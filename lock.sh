echo '1>LOCK'
echo '2>UNLOCK'
ext=".nc"
read ch
if [ $ch -eq 1 ];
then
        echo 'ENTER FILE NAME WITH EXTENSION'
        read file
        mcrypt $file
        x=$?
        exit 1

        rm $file
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
        mcrypt -d $ful
        x=$?
        if [ $x -eq 0 ];
        then
                rm $ful
                exit
        else
                mv $ful $hid
        fi
fi
