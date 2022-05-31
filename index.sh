# Path
PHOME="$TOME/Module/Hack-Proxy"

# Command
cat << HiH | sed2
<group>
<page config-sh=". $PHOME/home.sh" id="$RANDOM" visible="test -e /sdcard/Tools/Vip && echo 1 || echo 0">
<title>Hack Proxy</title>
<desc>Giúp máy bạn có mạng, thay đổi ip proxy</desc>
<option type="refresh" icon="$TOME/usr/Tool/Loading.png" >$lammoi</option>
<option type="default" auto-off="true">Cập nhật Config.yaml</option>
<option type="default" id="kk" >Nhật ký</option>
<handler>
# Start code
if [ "€menu_id" == "kk" ];then
cat $PHOME/run/kernel.log
else
Taive "https://raw.githubusercontent.com/kakathic/Hack/Proxy/config.yaml" "$PHOME/config.yaml" "-#kLJ --connect-timeout 5" "text"
fi
# End code
</handler></page></group>
HiH
