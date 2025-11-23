#!/usr/bin/env bash

expand_home() {
    echo "${1//\$HOME/$HOME}"
}

BIN_PATH="$(expand_home $(jq -r '.swww.binPath' ./manifest.json))"
CACHE_PATH="$(expand_home $(jq -r '.swww.cachePath' ./manifest.json))"
DAEMON_BIN_PATH="$(expand_home $(jq -r '.swww.daemonBinPath' ./manifest.json))"
G_DRIVE_FILE_ID=$(jq -r '.swww.GDriveFileId' ./manifest.json)
WALLPAPER_PATH="$(expand_home $(jq -r '.swww.wallpaperPath' ./manifest.json))"

install() {
    echo "Cloning swww"
    git clone https://github.com/LGFae/swww.git /tmp/swww

    pushd /tmp/swww
    echo "building..."
    cargo build --release
    echo "$BIN_PATH binpath"
    mv ./target/release/swww $BIN_PATH
    mv ./target/release/swww-daemon $DAEMON_BIN_PATH

    echo "generating man pages..."
    chmod u+x ./doc/gen.sh
    ./doc/gen.sh
    popd

}

run_daemon() {
    $DAEMON_BIN_PATH &
}

download_and_set_wallpaper() {
    if [ ! -e "$WALLPAPER_PATH" ]; then
        echo "$WALLPAPER_PATH doesn't exist"
        echo "Downloading wallpaper"
        curl "https://drive.usercontent.google.com/download?id=$G_DRIVE_FILE_ID&export=download&confirm" -o "$WALLPAPER_PATH"
        echo "Wallpaper downloaded"
    else
        echo "Wallpaper exists"
    fi

    if [ ! -d "$CACHE_PATH" ]; then
        mkdir $CACHE_PATH
    fi

    $BIN_PATH img $WALLPAPER_PATH
}

if command -v swww &>/dev/null && command -v swww-daemon &>/dev/null; then
    echo "swww is installed"
    download_and_set_wallpaper
else
    echo "swww not installed"
    install
    run_daemon
    download_and_set_wallpaper
fi
