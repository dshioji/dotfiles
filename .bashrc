# .bashrc

##############PATH

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and function

#tmux
export LD_LIBRARY_PATH="/usr/local/libevent-2.1.8-stable/lib:$LD_LIBRARY_PATH"

#golang
export GOPATH="$HOME/src/golang"

#pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
#rbenv
eval "$(rbenv init -)"

#misc
export HISTSIZE=""

export HISTFILESIZE="${HISTSIZE}";


# Make vim the default editor.
export EDITOR='vim';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';



#aliases ###################

alias ga="git add -A"
alias gc="git commit -m"
alias gpush="git push origin master"
#alias gpull="git push origin master"

#conf
alias br=". ~/.bashrc"
alias be="vim ~/.bashrc"

alias ve="vim ~/.vimrc"

alias tmux="tmux -2"
alias te="vim ~/.tmux.conf"
alias tk="tmux kill-server"
alias tn="tmux new-session -s"
#credit
#https://github.com/mathiasbynens/dotfiles/blob/master/.aliases

# Reload the shell (i.e. invoke as a login shell)
#alias reload="exec $SHELL -l"


# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias mkdir="mkdir -p"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
    export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
    colorflag="-G"
    export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# List only files
alias lsf="ls -lF ${colorflag} | grep -v --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"


# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'




# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"


#for mac?
# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"



#intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

#npm 
#execute local scripts from node_modules/.bin
alias npme="PATH=$(npm bin):$PATH"
alias npm-exec="PATH=$(npm bin):$PATH"


#functions ##################

##dev---------
function rpull(){
rsync -azv -e ssh --delete --exclude='.git/' --exclude='node_modules/' --exclude='public/build/' --exclude='storage/logs/' --exclude='storage/framework/' ubudesktop:/home/vuladmin33/11work/11curent/matchingood/matchingood-site/2nd-matchingood/* .
}

function rpush(){
rsync -azv -e ssh --delete --exclude='.git/' --exclude='node_modules/' --exclude='public/build/' --exclude='storage/logs/' --exclude='storage/framework/' ./* ubudesktop:/home/vuladmin33/11work/11curent/matchingood/matchingood-site/2nd-matchingood/
}

function gc(){
git checkout master
git checkout issue-${1}-
}

function gcn(){
git checkout master
git checkout issue-${1}-
}

function exp(){
export FO=${1};make;

}

#serves http on current directory
#todo: change ip according to the machine
function serve_http(){
 export IP="${DS_SERVER_IP}";
 #export PORT="8080";
 echo "serving current directory at ${IP}:${PORT}"
 python -c 'import os; import BaseHTTPServer as bhs, SimpleHTTPServer as shs; bhs.HTTPServer((os.getenv("IP"),8080),
 shs.SimpleHTTPRequestHandler).serve_forever()'
}

##creating directories
function mkd (){
 mkdir $1 ;
 cd $1 ;
}

#
function find_filetype(){

find . -name "*.$1" | xargs less

}

function liner(){
    eval $(cat ~/.commands | fzy | awk '{$1=""; print $0}')
}

function gall(){
    
    git add -A ; git commit -m "$@" ; git push origin master;

}


function current_ip(){
    
    ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}' | xargs echo -n $1
    echo

}
#disable crontab -r
function crontab () { 
    [[ $@ =~ -[iel]*r ]] \
        && echo '"r" not allowed' \
        || command crontab "$@" ;

}

#replace wp database
function wpsr(){
    cd $1
    wp search-replace 45.76.202.145 45.32.12.87
    cd ..
}

# find file and edit it.  known names 8 dirs deep
function vimm() {
  SEARCH=$(echo "$@" | tr -d '/')

  dirs=()
  while read line ; do
    dirs+=("$line")
  done < <(find ./ -type f -name "$SEARCH" 2>/dev/null | sort)

  case ${#dirs[@]} in
    0)
      false
      ;;
    1) 
      pushd $( dirname ${dirs[@]} ) 
      vim $(basename ${dirs[@]})
      ;;
    *)
     if type fzf >/dev/null 2>&1 ; then

  
        local file_name=$(printf '%s\n' "${dirs[@]}" | fzy ) 
        
        cd $( dirname ${file_name})
        vim $(basename ${file_name})
     else
       select dir in "${dirs[@]}" ; do
       pushd $( dirname ${dir} ) 
       vim $(basename ${dir})
       break
       done
     fi
      ;;
  esac
}

# find directory and cd to it.  awesome for drupal modules with known names 8 dirs deep
function cdd() {
## todo argument needs double quotes for wildcard 
##      make it so that user doesnt need to use quotes                                              

  ##it seems shell expands the wild card before 
  ## passing it to the scrip to you need 
  ## the quotes
 
 #echo "$1"                                              
 #false 

 #tmp
 local tmp_file="$(mktemp -p /dev/shm)"              

 #find dir
 find  . -type d -name "$1" > ${tmp_file}      
 
 #check number of lines                                              
 local lines=$( cat ${tmp_file} | wc -l )            
                                               
 if [[ "${lines}" -eq "0" ]] ; then            
   false                                       
 elif [[ "${lines}" -eq "1" ]] ; then          
   pushd $(cat ${tmp_file})                    
 else                                          
   pushd $(cat ${tmp_file} | fzy)              
 fi                                            
 
 #clean up                                 
 rm -f ${tmp_file}                             


}


#fd credit :  renamed cdd
# https://github.com/sagotsky/fd/blob/master/fd.sh
# find directory and cd to it.  awesome for drupal modules with known names 8 dirs deep
function cdd2() {
  SEARCH=$(echo "$@" | tr -d '/')

  dirs=()
  while read line ; do
    dirs+=("$line")
  done < <(find ./ -type d -name "${SEARCH}" 2>/dev/null | sort)

  case ${#dirs[@]} in
    0)
      false
      ;;
    1) 
      pushd "${dirs[@]}"
      ;;
    *)
     if type fzy >/dev/null 2>&1 ; then
         pushd $(printf '%s\n' "${dirs[@]}" | fzy ) 

     else
       select dir in "${dirs[@]}" ; do
       pushd ${dir} 
       break
       done
     fi
      ;;
  esac
}

function lss() {
  SEARCH=$(echo "$@" | tr -d '/')

  dirs=()
  while read line ; do
    dirs+=("$line")
  done < <(find ./ -type d -name "$SEARCH" 2>/dev/null | sort)

  case ${#dirs[@]} in
    0)
      false
      ;;
    1) 
      ls "${dirs[@]}"
      ;;
    *)
     if type fzy >/dev/null 2>&1 ; then
         ls $(printf '%s\n' "${dirs[@]}" | fzy ) 

     else
       select dir in "${dirs[@]}" ; do
       ls ${dir} 
       break
       done
     fi
      ;;
  esac
}



function viewd() {
  SEARCH=$(echo "$@" | tr -d '/')

  dirs=()
  while read line ; do
    dirs+=("$line")
  done < <(find ./ -type d  2>/dev/null | sort)
  #done < <(find ./ -type d -name "$SEARCH" 2>/dev/null | sort)
    
    if type fzy >/dev/null 2>&1 ; then
         echo $(printf '%s\n' "${dirs[@]}" | fzy ) 

     else
       select dir in "${dirs[@]}" ; do
       echo ${dir} 
       break
       done
     fi
}


function viewf() {
  SEARCH=$(echo "$@" | tr -d '/')

  dirs=()
  
  local cache_file='/tmp/viewf.cache'
  
  #check cache file and if it was modified with in 5 minutes
  if [[ -f ${cache_file} && $(find ${cache_file} -mmin -5 ) ]] ; then
      echo "using cache" 

      while read line ; do
        dirs+=("$line")
      done <  ${cache_file}
  else
      echo "not using cache"
      while read line ; do
        dirs+=("$line")
      done < <(find ./ ! -path '*.git*' -type f 2>/dev/null | sort | tee ${cache_file})
  fi
  
    
  if type fzy >/dev/null 2>&1 ; then
    echo $(printf '%s\n' "${dirs[@]}" | fzy ) 

  else
    select dir in "${dirs[@]}" ; do
      echo ${dir} 
      break
    done
  fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}


# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified.";
        return 1;
    fi;

    local domain="${1}";
    echo "Testing ${domain}…";
    echo ""; # newline

    local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
        | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

    if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
        local certText=$(echo "${tmp}" \
            | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
            no_serial, no_sigdump, no_signame, no_validity, no_version");
        echo "Common Name:";
        echo ""; # newline
        echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
        echo ""; # newline
        echo "Subject Alternative Name(s):";
        echo ""; # newline
        echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
            | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
        return 0;
    else
        echo "ERROR: Certificate not found.";
        return 1;
    fi;
}



# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}

# Get a character’s Unicode code point
function codepoint() {
    perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}


# Run `dig` and display the most useful info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}

# UTF-8-encode a string of Unicode symbols
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}


# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}



# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Create a git.io short URL
function gitio() {
    if [ -z "${1}" -o -z "${2}" ]; then
        echo "Usage: \`gitio slug url\`";
        return 1;
    fi;
    curl -i https://git.io/ -F "url=${2}" -F "code=${1}";
}




# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@";
    }
fi;



# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}

###### autoload tmux ##############

#tmux new-session

# if [[ ! -n $TMUX && $- == *l* ]]; then
#   # get the IDs
#   ID="`tmux list-sessions`"
#   if [[ -z "$ID" ]]; then
#     tmux new-session
#   fi
#   create_new_session="Create New Session"
#   ID="$ID\n${create_new_session}:"
#   ID="`echo $ID | $PERCOL | cut -d: -f1`"
#   if [[ "$ID" = "${create_new_session}" ]]; then
#     tmux new-session
#   elif [[ -n "$ID" ]]; then
#     tmux attach-session -t "$ID"
#   else
#     :  # Start terminal normally
#   fi
# fi
#
#

