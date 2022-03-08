import os
import yt-dlp

print('started')
os.chdir('~/temp')





#! /usr/local/bin/bash

echo 'started'; \
pushd ~/temp; \
yt-dlp --extract-audio --audio-format mp3 https://www.youtube.com/watch\?v\=62hBet56ACw -o temp.mp3; \
mpv --loop=3 temp.mp3; \
rm -rf temp.mp3;
