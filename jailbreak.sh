#!/bin/bash
cd ~/Documents/iCloudBypass
killall iTunes
killall iTunesHelper
rm -rf checkra1n.app
rm -rf __MACOSX
unzip checkra1n.zip
clear
./checkra1n.app/Contents/MacOS/checkra1n_gui
killall Terminal
