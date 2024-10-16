export EDITOR=vim
export PAGER=less
export KERNEL_NAME=$(uname|tr '[:upper:]' '[:lower:]')
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# add docker path
PATH="${HOME}/.docker/bin:${PATH}"

# add go path
export GOPATH=/Users/mlambrichs/.asdf/installs/golang/1.21.6/packages
export GOROOT=/Users/mlambrichs/.asdf/installs/golang/1.21.6/go
export GOPROXY="https://lambri000:cmVmdGtuOjAxOjE3MjMyOTUyMTE6RUs2amlrMVk5eEJBT1JJQnE3YXFPR0JEbjhV@artifactory.persgroep.cloud/artifactory/api/go/go,https://proxy.golang.org,direct"
export GONOSUMDB="persgroep.cloud/*"
PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"

# add erlang settings
 export ERL_AFLOGS="-kernel shell_history enabled"

# add java path
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# add julia path
PATH="/usr/local/julia/bin:${PATH}"

# add vscode path
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"

# add node path
PATH="${HOME}/.asdf/installs/nodejs/21.4.0/bin:${PATH}"

# add oracle
export ORACLE_HOME=~/.oracle
export LD_LIBRARY_PATH=${ORACLE_HOME}/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
PATH=$PATH:${ORACLE_HOME}/bin

# add packer path
PATH="${HOME}/dev/github/packer/bin:${PATH}"

# add godfather path
PATH=${HOME}/.asdf/installs/elixir/1.17.0-otp-27/.mix/escripts:${PATH}

# ZCLI #
export AWS_CA_BUNDLE=/opt/homebrew/etc/ca-certificates/cert.pem;
export NODE_EXTRA_CA_CERTS=/Users/mlambrichs/.zcli/zscaler_root.pem;
# end ZCLI #

# remove duplicate entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path
export PATH
