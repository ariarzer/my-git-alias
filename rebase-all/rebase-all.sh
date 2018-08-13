#!/usr/bin/env bash

for file in $(git branch | grep -i -v "*"); do
        if [ ${file} != master ];
            then
                echo;
                git checkout ${file};
                echo;
                read -n 1 -p "$(echo -e "Are you sure you want to do \x1b[32;1mREBASE\x1b[0m (y/n) or \x1b[33;1mDELETE\x1b[0m (D) $file branch?:")" amsure;
                echo;
                if [ ${amsure} = y ];
                    then
                        git pull origin master --rebase;
                        git status;
                        read -p -e "$(echo -e "Are you sure you want to do \x1b[31;1mFORCE PUSH\x1b[0m $file branch? (yes/n):")" amsure;
                        if [ ${amsure} = yes ];
                            then
                                git push origin ${file} --force;
                        fi;
                fi;
                if [ ${amsure} = D ];
                    then
                        git checkout master;
                        git branch -D ${file};
                fi;
            else
            read -p "$(echo -e "Are you sure you want to do \x1b[32;1mPULL\x1b[0m $file branch? (y/n):")" amsure;
                if [ ${amsure} = yes ];
                     then
                         git pull origin master;
                 fi;
        fi
    done

