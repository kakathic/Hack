# Path
PHOME="$TOME/Module/Hack-Proxy"

# Command
cat << HiH | sed2
<group>
<page config-sh=". $PHOME/home.sh" id="12345" locked="$(test -e /sdcard/Tools/Pro && echo 0 || echo 1)">
<title>Hack Proxy</title>
<desc>Giúp máy bạn có mạng, thay đổi ip proxy</desc>
<option reload="true" auto-off="true" id="kk3" >Cập nhật config.yaml</option>
<option type="default" id="kk2" auto-off="true" auto-finish="true" >Cập nhật toàn bộ</option>
<option type="default" id="kk" >Nhật ký</option>
<option type="default" reload="true" auto-off="true" style="fab" icon="$TOME/usr/Tool/Loading.png" id="kk4" >$lammoi</option>
<handler>
# Start code
if [ "€menu_id" == "kk" ];then
cat $PHOME/run/kernel.log
elif [ "€menu_id" == "kk4" ];then
curl -s -X PUT -H "Content-Type: application/json" -d '{"path": "$PHOME/config.yaml"}' http://127.0.0.1:9090/configs
elif [ "€menu_id" == "kk3" ];then
Taive "$(Xset conda)" $TEMP_DIR/config.yaml
if [ -e $TEMP_DIR/config.yaml ];then
mv -f $TEMP_DIR/config.yaml $PHOME/config.yaml
if [ -e $PHOME/run/clash.pid ];then
$PHOME/scripts/service.sh
echo
$PHOME/scripts/service.sh
sleep 2
fi
else
Thoat "Cập nhật thất bại hãy kiểm tra lại mạng!"
fi
else
ecgi "€loading"
Taive "https://github.com/kakathic/Hack/archive/refs/heads/Proxy.zip" "$TEMP_DIR/Test.zip"
[ -e "$TEMP_DIR/Test.zip" ] && unzip -o "$TEMP_DIR/Test.zip" -d "$TOME/Module" || Thoat "Cập nhật dữ liệu thất bại, vui lòng kiểm tra lại mạng!"
rm -fr "$TEMP_DIR"/*
rm -fr $TOME/bin/Clash
rm -fr $PHOME/*gh-pages
chmod -R 777 $PHOME
fi
# End code
</handler></page></group>
HiH
