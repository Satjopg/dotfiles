#!/bin/bash
DOTPATH=~/.dotfiles
GITHUB_URL="https://github.com/Satjopg/dotfiles.git"
tarball="https://github.com/Satjopg/dotfiles/archive/master.tar.gz"

# 最初にディレクトリを作成
mkdir ~/.dotfiles

# gitコマンドがあるならリポジトリをクローン
if has "git"; then
	git clone --recursive "$GITHUB_URL" "$DOTPATH"
# なければcurlかwgetでリポジトリをダウンロードして解凍して移動
elif has "curl" || has "wget"; then
	if has "curl"; then
		curl -L "$tarball" | tar xv -
	elif has "wget"; then
		wget -O - "$tarball" | tar xv -
	fi

	cd ~/dotfiles-master

	for file in `\find . -maxdepth 1 -type f`; 
	do
		mv -f "$file" "$DOTPATH"
	done
	
	echo "file move done!!"

	cd ../ | rm -rf ~/dotfiles-master
else
	die "curl or wget required!!"
fi

cd ~/.dotfiles

if [ $? = 1 ]; then
	dei "not found: $DOTPATH"
fi

# 移動できたらシンボリックリンクをホームディレクトリに貼る
for filename in .??*
do
	[ "$filename" = ".git" ] && continue
	[ "$filename" = ".DS_Store" ] && continue
	ln -snfv "$DOTPATH/$filename" "$HOME"/"$filename"
done
