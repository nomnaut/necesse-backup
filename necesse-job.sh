eval "$(ssh-agent -s)"  
ssh-add ~/.ssh/id_rsa_linode

saveFiles=""
for file in /home/necesse/necesse-server/saves/*.zip
do
    saveFiles="${saveFiles} $file"
done

for file in "${saveFiles}"
do
    echo $file
    md5sum /home/necesse/necesse-server/saves/$file
    md5sum /home/necesse/necesse-backup/saves/$file
    # currSave="$(md5sum /home/necesse/necesse-server/saves/$file)"
    # gittSave="$(md5sum /home/necesse/necesse-backup/saves/$file)"
    # if [ $currSave != $gittSave ]; then
    #     cp -fr /home/necesse/necesse-server/saves/$file ~/necesse-backup/saves/$file
    #     git -C /home/necesse/necesse-backup/saves/ add -f $file
    #     git -C /home/necesse/necesse-backup/saves/ commit -m "add saves from "$(date +"%m-%d-%Y")
    #     git -C /home/necesse/necesse-backup/saves/ push origin main
    # fi
done

