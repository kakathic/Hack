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
<option type="default" id="kk2" reload="true" auto-off="true">Cập nhật toàn bộ</option>
<option type="default" id="kk3" reload="true" auto-off="true">Cập nhật giao diện web</option>
<option type="default" id="kk" >Nhật ký</option>
<handler>
# Start code
if [ "€menu_id" == "kk" ];then
cat $PHOME/run/kernel.log
elif [ "€menu_id" == "kk2" ];then
ecgi "€loading"
Taive "https://github.com/kakathic/Hack/archive/refs/heads/Proxy.zip" "€TEMP_DIR/Test.zip"
unzip -o "€TEMP_DIR/Test.zip" -x "Hack-Proxy/Clash" -d "€TOME/Module"
unzip -o "€TEMP_DIR/Test.zip" "Hack-Proxy/Clash" -d "€TEMP_DIR"
mv -f "€TEMP_DIR/Hack-Proxy/Clash" $PHOME/Clash
chmod -R 777 "€TOME/Module"
rm -fr "€TEMP_DIR/Test.zip"
elif [ "€menu_id" == "kk3" ];then
rm -fr $PHOME/yacd-gh-pages
else
ecgi "€loading"
Taive "https://raw.githubusercontent.com/kakathic/Hack/Proxy/config.yaml" "$PHOME/config.yaml"
fi
# End code
</handler></page></group>
HiH
