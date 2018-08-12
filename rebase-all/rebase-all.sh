#!/usr/bin/env bash

for file in $(ls .git/refs/heads ); do
        if [ ${file} != master ];
            then
                echo "\n";
                git checkout ${file};
                echo "\n";
                read -n 1 -p "Are you sure you want to do REBASE $file branch? (y/n):" amsure;
                if [ ${amsure} = y ];
                    then
                        echo "\n";
                        git pull origin master --rebase;
                        git status;
                        read -p "Are you sure you want to do FORCE PUSH $file branch? (yes/n):" amsure;
                        if [ ${amsure} = yes ];
                            then
                                echo "\n";
                                git push origin ${file} --force;
                        fi;
                fi;
            else
            read -p "Are you sure you want to do PULL $file branch? (y/n):" amsure;
                if [ ${amsure} = yes ];
                     then
                         git pull origin master;
                 fi;
        fi
    done
