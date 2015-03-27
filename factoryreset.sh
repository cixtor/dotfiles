#!/bin/bash
cd $HOME

# Keep a copy of some session files.
cp -v .ICEauthority dot.ICEauthority
cp -v .Xauthority dot.Xauthority
cp -v .bash_logout dot.bash_logout
cp -v .bashrc dot.bashrc
cp -v .profile dot.profile

# Keep a copy of some configuration files.
mkdir dot.config
cp -rv .config/user-dirs.dirs dot.config/
cp -rv .config/sublime-text-3 dot.config/
cp -rv .config/terminator dot.config/
cp -v .nanorc dot.nanorc
cp -v .vimrc dot.vimrc

# Keep a copy of some miscellaneous files.
mv -iv .backgrounds dot.backgrounds
mv -iv .themes dot.themes
mv -iv .fonts dot.fonts
mv -iv .icons dot.icons
mv -iv .git dot.git
mv -iv .gitconfig dot.gitconfig
mv -iv .gitignore dot.gitignore
mv -iv .hgrc dot.hgrc
mv -iv .ssh dot.ssh
mv -iv .subversion dot.subversion

# Remove unnecessary directories and files.
rm -rf "VirtualBox VMs"
rm -rf "Audiobooks"
rm -rf "Podcasts"

for directory in $(ls -1a | grep '^\...'); do
    echo -n "Deleting '${directory}' ... "
    rm -rf $directory
    echo "OK"
done

for resource in $(ls -1 | grep '^dot\.'); do
    mv -iv "$resource" $(echo "$resource" | sed 's/dot\./\./g')
done
