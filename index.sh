# Path
PHOME="$TOME/Module/Hack-Proxy"

# Command
cat << HiH | sed2
<group>
<page config-sh=". $PHOME/home.sh" id="$RANDOM" visible="test -e /sdcard/Tools/Vip && echo 1 || echo 0">
<title>Hack Proxy</title>
<desc>Giúp máy bạn có mạng, thay đổi ip proxy</desc>
<option type="default" auto-off="true">Cập nhật Config.yaml</option>
<handler>
# Start code
Taive "https://raw.githubusercontent.com/kakathic/Hack/Proxy/config.yaml" "$PHOME/config.yaml" "-#kLJ --connect-timeout 5" "text"
# End code
</handler></page></group>
HiH
