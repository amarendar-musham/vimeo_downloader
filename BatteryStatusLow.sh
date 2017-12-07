while :
do
        a=`termux-battery-status | grep percentage | awk '{print $2}' | cut -d, -f1`
        k=`termux-battery-status | grep status | awk '{print $2}' | cut -d'"' -f2`
        b=`echo $a-1|bc -l`

        if [ "$k" == "DISCHARGING" ] && [ $b -lt 35 ] ; then
                termux-tts-speak "your battery is going to die and it is bloody $a percentage now" && termux-vibrate -d 2000 -f ;
        fi
sleep 1
done
