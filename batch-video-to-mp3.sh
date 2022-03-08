#! /usr/local/bin/bash
# convert all downloaded media to mp3
# rename all converted files to remove {webm,mkv,mp4} from filenames
# echo file conversion list
# then delete everything but the newly converted mp3
echo "starting up, get list of files, please be patient..."
ls | echo "Found $(wc -l) media files for conversion in the present working directory." | xargs
echo "starting mp3 conversion with ffmpeg and libmp3lame."

for i in *.{webm,mkv,mp4}; do 
    ffmpeg -i "$i" -acodec libmp3lame "$(basename "${i/.{webm,mkv,mp4}")".mp3
    sleep 2
done

sleep 3
echo "Renaming media files, please wait..."
for file in *.mp3; do 
    if [[ $file == *webm* ]];
        then
            mv -- "$file" "${file/webm./}"
            echo $file
    elif [[ $file == *mkv* ]];
        then
            mv -- "$file" "${file/mkv./}"
            echo $file
    elif [[ $file == *mp4* ]];
        then
            mv -- "$file" "${file/mp4./}"
            echo $file
    else
        echo "Unknown file type, skipping rename..."
        echo $file
    fi
done;
echo "renaming media files finished..."
echo "cleaning up, removing downloaded media..."
rm -rf *.{webm,mkv,mp4}
echo "conversion complete"
