# Comments

## oh-my-zsh

You need to install Powerline fonts to show the correct path.

```
# cd powerline/fonts
# sh install.sh
```

Next, change your profile in iterm2. Select `text` tab in profile and then tick
`Use built-in Powerline glyphs`.

## asdf

Install the following plugins:

* awscli-local
* awscli
* buildpack
* bundler
* elixir-ls
* elixir
* erlang
* golang
* kubectl
* kubectx
* kubeseal
* linkerd
* nodejs
* packer
* perl
* postgres
* pre-commit
* python
* rust
* terraform-lsp
* terraform-validator
* terraform
* terragrunt
* tmux
* yarn

### examples
```
> export KERL_CONFIGURE_OPTIONS="--with-odbc --without-javac --without-wx --with-ssl=$(brew --prefix openssl@1.1)"
> export KERL_BUILD_DOCS=1
> asdf install erlang 26.0.2

> export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --without-icu --with-openssl --with-libraries=/usr/local/lib:$(brew --prefix openssl@1.1)/lib --with-includes=/usr/local/include:$(brew --prefix openssl@1.1)/include"
> asdf install postgres latest
```

## git-date

`>< npm install git-date -g`

## R

```
> pip3 install -U git+https://github.com/randy3k/radian
> /usr/sbin/softwareupdate --install-rosetta
```

## docker

Install Docker Desktop for Mac

## python

```
> asdf install python 3.12.1
> asdf install awscli latest
> asdf install awscli-local latest
```

## ruby

`ruby-install` is installed with brew. Next
```
ruby-install ruby 1.9
ruby-install ruby 2.0
cd ~/.rubies
ln -s 1.9.3-p448 1.9.3
ln -s 2.0.0-p247 2.0
```

Add to `~/.config/direnv/direnvrc`
```
use_ruby() {
  local ruby_dir=$HOME/.rubies/$1
  load_prefix $ruby_dir
  layout ruby
}
```

Now in any project you can run `direnv edit .`, then add e.g. `use ruby 1.9.3` and direnv will select the right ruby version.

## wireshark

```
> brew install --cask wireshark
```
