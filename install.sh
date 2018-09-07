#/usr/bin/bash

declare -a entities=( ".bashrc" ".vim" ".vimrc" ".tmux.conf" ".tmux.conf.local" ".curlrc" ".git" ".gitignore" )


cd ~
absHomePath=$(pwd -P)

for entity in "${entities[@]}"; do 
   dotPath="${absHomePath}/dotfiles/${entity}"
   homeDotPath="${absHomePath}/${entity}"
   
   if [[ -d  ${entity} ]] ; then
       rm  -rf ${homeDotPath}
   else
       rm  ${homeDotPath}
   fi
   ln -s ${dotPath} ${homeDotPath}

done



