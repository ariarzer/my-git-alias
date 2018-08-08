#!/usr/bin/env bash

cd ~/.gitalias/

echo -e "\n[includeIf \"gitdir:~/\"]\n    path = ~/.gitalias/$1/$1\n" >> root

mkdir ./$1
cd ./$1

touch $1
echo -e "[alias]\n    $1 = \"!~/.gitalias/$1/$1.sh\"\n" >> $1

touch $1.sh
echo -e "#!/usr/bin/env bash\n" >> $1.sh

chmod +x $1.sh
