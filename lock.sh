echo '1>LOCK'
echo '2>UNLOCK'
ext=".gpg"
read ch
if [ $ch -eq 1 ];
then
        echo 'ENTER FILE NAME WITH EXTENSION'
        read file
        gpg -c $file
#       rm $file
        echo 'FILE LOCKED'

        ful="$file$ext"
        hid=".$ful"
        mv $ful $hid


elif [ $ch -eq 2 ];
then
        echo 'ENTER THE FILE NAME WITH EXTENSION'
        read file
        ful="$file$ext "

        hid=".$ful"
        mv $hid $ful
        gpg -d $ful| > $file
fi
