function _cmd_available {
    command -v "$1" >/dev/null
}

function _include {
    [[ -f "$1" ]] && source "$1"
}

# Shorters
alias g=git
alias x=exit
alias c=clear
alias tre=tree
alias m=make
alias vim=nvim
alias vi=nvim
alias v=nvim
alias d=docker
alias k=kubectl
alias tf=terraform
alias kx=kubectx
alias t=tmux

# Add verbosity to common commands
alias rm="rm -v"
alias cp="cp -vi"
alias mv="mv -vi"
alias ln="ln -iv"
alias mkdir="mkdir -v"

# ls
alias exa="exa --group-directories-first"

# open dotfiles in vscode
alias "."="code $DOTFILES"

alias ls-backend=exa
alias ll="ls-backend"
alias ls="ll"
alias lsa="ll -a"
alias l="ls"

# Always expose a known TERM (not the 256color version) to the server I'm connecting to.
alias ssh='TERM=xterm ssh'

# Get a formated list of all gke clusters and versions
function gcloud-k8s-versions
{
    for project in $(gcloud projects list --format="value(projectId)") ; do \
        gcloud container clusters list --format="value[separator=' | '](name,currentMasterVersion,nodePools.version)" --project $project
    done;
}

function kubectlgetall
{
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}

# launch editor (- let's try that!)
alias e="code"

# git stuff
alias nah="git reset --hard && git clean -df"
alias push='git push origin `git rev-parse --abbrev-ref HEAD`'
alias pull='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias add='git add $@'
alias commit='git commit -m "$@"'
alias amend='git add -A && git commit --amend --no-edit'
alias gitcleanbranches="git branch --merged | grep -v \* | xargs git branch -D"

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

function rand {
    local DEFAULT_LENGTH=6
    local LENGTH=${1:-$DEFAULT_LENGTH}

    LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c $LENGTH
}
