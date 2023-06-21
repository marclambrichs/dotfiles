#!/bin/bash

DOTFILES_GIT_REMOTE="git@github.com:marclambrichs/dotfiles.git"
DOTFILES_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ./lib/utils
source ./lib/brew

# Before relying on Homebrew, check that packages can be compiled
if ! type_exists 'gcc'; then
    e_error "The XCode Command Line Tools must be installed first."
    exit 1
fi

# Check for Homebrew
if ! type_exists 'brew'; then
    e_header "Installing Homebrew..."
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

# Check for git
e_header "Check for git..."
if ! type_exists 'git'; then
    e_header "Updating Homebrew..."
    brew update
    e_header "Installing Git..."
    brew install git
fi

git pull origin zsh;
git submodule update --init

# Initialize the git repository if it's missing
if ! is_git_repo; then
    e_header "Initializing git repository..."
    git init
    git remote add origin ${DOTFILES_GIT_REMOTE}
    git fetch origin master
    # Reset the index and working tree to the fetched HEAD
    # (submodules are cloned in the subsequent sync step)
    git reset --hard FETCH_HEAD
    # Remove any untracked files
    git clean -fd
fi

# Conditionally sync with the remote repository
if [[ $no_sync ]]; then
    printf "Skipped dotfiles sync.\n"
else
    e_header "Syncing dotfiles..."
    # Pull down the latest changes
    git pull --rebase origin master
    # Update submodules
    git submodule update --recursive --init --quiet
fi

# Install and update packages
if [[ $no_packages ]]; then
    printf "Skipped package installations.\n"
else
    printf "Updating packages...\n"
    # Install Homebrew formulae
    run_brew
fi

link() {
    if [ -e "${HOME}/${2}" ]; then
        rm -f "${HOME}/${2}"
    fi
    
    # Force create/replace the symlink.
    ln -fs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

mirrorfiles() {
    # Copy `.gitconfig`.
    # Any global git commands in `~/.bash_profile.local` will be written to
    # `.gitconfig`. This prevents them being committed to the repository.
    rsync -avh ${DOTFILES_DIRECTORY}/git/gitconfig  ${HOME}/.gitconfig

    # Force remove the vim directory if it's already there.
    if [ -e "${HOME}/.vim" ]; then
        rm -rf "${HOME}/.vim"
    fi
    # Force remove the zsh directory if it's already there.
    if [ -e "${HOME}/.zsh" ]; then
        rm -rf "${HOME}/.zsh"
    fi

    # Create the necessary symbolic links between the `.dotfiles` and `HOME`
    # directory.
    link "bash/bashrc"          ".bashrc"
    link "bash/profile"         ".profile"
    link "bash/bash_prompt"     ".bash_prompt"
    link "git/gitattributes"    ".gitattributes"
    link "git/gitconfig"        ".gitconfig"
    link "git/gitignore"        ".gitignore"
    link "git/gituser-default"  ".gituser-default"
    link "git/gitignore_global" ".gitignore_global"
    link "ohmyzsh"              ".oh-my-zsh"
    link "tmux/tmux.conf"       ".tmux.conf"
    link "vim"                  ".vim"
    link "vim/vimrc"            ".vimrc"
    link ".zshrc"               ".zshrc"
    link "zsh"                  ".zsh"

    e_success "Dotfiles update complete!"
}

# Ask before potentially overwriting files
seek_confirmation "Warning: This step may overwrite your existing dotfiles."

if is_confirmed; then
    mirrorfiles
    #source ${HOME}/.bash_profile
else
    printf "Aborting...\n"
    exit 1
fi

exit

function copyDots() {
	rsync --exclude ".git/" \
              --exclude ".DS_Store" \
              --exclude ".osx" \
	      --exclude "bootstrap.sh" \
	      -avh . ~;
	source ~/.bashrc;
}

read -p "This will overwrite existing files in your home directory. Are you sure? (y/N) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	copyDots
        cd ~/.oracle
        find /usr/lib/oracle -type d -name bin -exec ln -sf {} bin \;
        find /usr/lib/oracle -type d -name lib -exec ln -sf {} lib \;
        [ -d rdbms ] || mkdir rdbms; cd rdbms
        find /usr/include/oracle -type d -name client64 -exec ln -sf {} public \;
fi;
