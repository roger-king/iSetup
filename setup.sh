#!/bin/bash
os="$(uname)"
user=$USER
home_dir=/home/$USER
workspace_dir=$home_dir/Workspace
labs_dir=$workspace/labs

xcodeExists () {
    cmd="$(xcode-select -p)"
    if [ "cmd" == "/Library/Developer/CommandLineTools" ]
    then
        return true
    
    fi

    return false
}

if [ "$os" == "Darwin" ]; 
then
    echo "Setting up your mac!"
    # 1. Create workspace folder
    mkdir $home_dir/Workspace

    #2. Create labs folder
    mkdir labs_dir

    xcode-select --install

    cli_tools_installing=true

    while cli_tools_installing; do
        if xcodeExists;
        then
            cli_tools_installing=false
            echo "Installing XCode Command Line Tools"
            sleep 5

        fi
    done

    # 2. Install Homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /usr/local

    #3. Install Python so we can run our other scripts
    brew install python

    #4. Run our python scripts
    python ./scripts/main.py $home_dir/Downloads "mac"

else
    # Expect Linux (for now only support Fedora)
    echo "This is a linux machine"
    python ./scripts/applications.py $home_dir/Downloads

fi