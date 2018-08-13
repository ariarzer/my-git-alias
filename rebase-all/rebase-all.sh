#!/usr/bin/env bash

for file in $(ls .git/refs/heads ); do
        if [ ${file} != master ];
            then
                git checkout ${file};
                read -n 1 -p "$(echo -e "Are you sure you want to do \x1b[32;1mREBASE\x1b[0m $file branch? (y/n):")" amsure;
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
                echo ""
            else
            read -p "$(echo -e "Are you sure you want to do \x1b[32;1mPULL\x1b[0m $file branch? (y/n):")" amsure;
                if [ ${amsure} = yes ];
                     then
                         git pull origin master;
                 fi;
        fi
    done

