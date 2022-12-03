#!/bin/bash
eval "$(ssh-agent -s)"  
ssh-add ~/.ssh/id_rsa_linode

declare -A saveFiles
for file in ~/necesse-server/saves/*.zip
do
    saveFiles=("${saveFiles[*]}" "$file")
done

declare -A checkSums
for file in "${saveFiles[*]}"
do
    currSave="$(md5sum ~/necesse-server/saves/$file)"
    gittSave="$(md5sum ~/necesse-backup/saves/$file)"
    if [[ currSave != gittSave ]]; then
        cp -fr ~/necesse-server/saves/$file ~/necesse-backup/saves/$file
        git -C ~/necesse-backup/saves/ add -f $file
        git commit -m "add saves from "$(date +"%m-%d-%Y")
        git push origin main
    fi
done

