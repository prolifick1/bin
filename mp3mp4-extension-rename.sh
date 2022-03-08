#!/usr/local/bin/bash
# convert.sh
# Apply tempo filter to .mp3 files in this and all sub directories
# Optional: Delete original file after conversion

shopt -s globstar
i=1
for song in ./**/*.mp3.mp4
do
  rename 's/(\.mp3\.mp4)/.mp4/' *
done