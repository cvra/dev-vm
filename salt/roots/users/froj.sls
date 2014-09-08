froj:
  user.present:
    - home: /home/froj
    - shell: /usr/bin/fish
    - password: $6$trololol$axu7xFZgAVljFUy.pbG.zR/5Nccy8U/s7c4moDEaIITryYPnI71Zpf827seqzoy5Fe/PUxgQ9eGX5fLREPfDp1
    - groups:
       - sudo

https://github.com/froj/dotvim:
  git.latest:
    - target: /home/froj/.vim

/home/froj/.vimrc:
  file.symlink:
    - target: /home/froj/.vim/vimrc
    - user: froj
    - mode: 644

https://github.com/gmarik/Vundle.vim:
  git.latest:
    - target: /home/froj/.vim/bundle

https://github.com/froj/dotfiles:
  git.latest:
    - target: /home/froj/dotfiles

/home/froj/.config/fish/config.fish:
  file.symlink:
    - target: /home/froj/dotfiles/config.fish
    - user: froj
    - mode: 644

/home/froj/.gitconfig:
  file.symlink:
    - target: /home/froj/dotfiles/gitconfig
    - user: froj
    - mode: 644
