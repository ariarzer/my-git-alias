#!/usr/bin/env bash

touch file;
touch cashe;

for (( i=0; i <= 2; i++ )) do
    echo -e "* commit$i \n|" >> file
    git add file  >> cashe
    git commit -m "commit$i" >> cashe
done

git checkout -b v1
echo -e "*\n| \ " >> file

for (( i=0; i <= 2; i++ )) do
    echo -e "|  * commit$i \n|  |" >> file
    git add file  >> cashe
    git commit -m "commit$i"  >> cashe
done

git checkout master

for (( i=0; i <= 2; i++ )) do
    echo -e "* commit$i \n|" >> file
    git add file  >> cashe
    git commit -m "commit$i"  >> cashe
done
