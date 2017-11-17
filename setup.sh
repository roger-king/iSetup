os=uname

if [ $os == "Darwin"]; 
then
    # 1. Install Command Line Tools for XCode
    xcode-select --install

    # 2. Install Homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /usr/local

    #3. Install Python so we can run our other scripts
    brew install python

    #4. Run our python scripts
else
    # Expect Linux (for now only support Fedora)
fi