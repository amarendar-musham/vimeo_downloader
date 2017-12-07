while :
do
        a=`termux-battery-status | grep percentage | awk '{print $2}' | cut -d, -f1`
        k=`termux-battery-status | grep status | awk '{print $2}' | cut -d'"' -f2`
        b=`echo $a-1|bc -l`

        if [ "$k" == "CHARGING" ] && [ $b -gt 98 ] ; then
                termux-tts-speak "your battery fully charged  and it is $a percentage now" && termux-vibrate -d 2000 -f ;
        fi
sleep 1
done
