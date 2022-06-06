# Path
PHOME="$TOME/Module/Hack-Proxy"

# Command
cat << HiH | sed2
<group>
<page config-sh=". $PHOME/home.sh" id="$RANDOM" visible="test -e /sdcard/Tools/Vip && echo 1 || echo 0">
<title>Hack Proxy</title>
<desc>Giúp máy bạn có mạng, thay đổi ip proxy</desc>
<option reload="true" auto-off="true" id="kk3" >Cập nhật config.yaml</option>
<option type="default" id="kk2" reload="true" auto-off="true">Cập nhật toàn bộ</option>
<option type="default" id="kk" >Nhật ký</option>
<option type="default" auto-off="true" style="fab" icon="$TOME/usr/Tool/Loading.png" id="kk4" >$lammoi</option>
<handler>
# Start code
if [ "€menu_id" == "kk" ];then
cat $PHOME/run/kernel.log
elif [ "€menu_id" == "kk4" ];then
[ "€(Xem "http://ip-api.com/csv/?fields=countryCode")" == "VN" ] || Thoat "Vui lòng chọn Sever Việt Nam hoặc chọn sever Việt Nam khác" >&amp;2
curl -s -X PUT -H "Content-Type: application/json" -d '{"path": "$PHOME/config.yaml"}' http://127.0.0.1:9090/configs
elif [ "€menu_id" == "kk3" ];then
Taive "https://raw.githubusercontent.com/kakathic/Hack/Proxy/config.yaml" $PHOME/config.yaml
if [ -e $PHOME/run/clash.pid ];then
$PHOME/scripts/service.sh
echo
$PHOME/scripts/service.sh
fi
else
ecgi "€loading"
Taive "https://github.com/kakathic/Hack/archive/refs/heads/Proxy.zip" "€TEMP_DIR/Test.zip"
[ -e "$TEMP_DIR/Test.zip" ] && unzip -o "$TEMP_DIR/Test.zip" -d "$TOME/Module" || Thoat "Tải dữ liệu thất bại!"
rm -fr "€TEMP_DIR"/*
rm -fr $PHOME/yacd-gh-pages
rm -fr $PHOME/Clash
fi
# End code
</handler></page></group>
HiH
