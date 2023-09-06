export EDITOR=vim
export PAGER=less
export KERNEL_NAME=$(uname|tr '[:upper:]' '[:lower:]')
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# add docker path
PATH="${HOME}/.docker/bin:${PATH}"

# add go path
export GOPATH=/Users/mlambrichs/.asdf/installs/golang/1.21.0/packages
export GOROOT=/Users/mlambrichs/.asdf/installs/golang/1.21.0/go
export GOPROXY="https://lambri000:cmVmdGtuOjAxOjE3MjMyOTUyMTE6RUs2amlrMVk5eEJBT1JJQnE3YXFPR0JEbjhV"
export GONOSUMDB="persgroep.cloud/*"
PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# add java path
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# add julia path
PATH="/usr/local/julia/bin:${PATH}"

# add node path
PATH="${HOME}/.asdf/installs/nodejs/16.16.0/bin:${PATH}"

# add oracle
export ORACLE_HOME=~/.oracle
export LD_LIBRARY_PATH=${ORACLE_HOME}/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
PATH=$PATH:${ORACLE_HOME}/bin

# add packer path
PATH="${HOME}/dev/github/packer/bin:${PATH}"

# add godfather path
PATH=${ASDF_PATH}/installs/elixir/1.15.4-otp-26/.mix/escripts:${PATH}

# remove duplicate entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path
export PATH
