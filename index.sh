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

Taive "https://raw.githubusercontent.com/Qiu2zhi1zhe3/anti-ad/main/anti-ad.yaml" "$PHOME/run/anti-ad.yaml"
Taive "https://github.com/MetaCubeX/yacd/archive/refs/heads/gh-pages.zip" "$TEMP_DIR/Testvg.zip"
unzip -o "$TEMP_DIR/Testvg.zip" -d "$PHOME"
Taive "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat" "$PHOME/GeoSite.dat"
Taive "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat" "$PHOME/GeoIP.dat"
Linkhhf="€(Xem "https://github.com/MetaCubeX/Clash.Meta/releases/tag/Prerelease-Alpha" | grep -m1 'Clash.Meta-android-arm64-alpha' | cut -d \" -f2)"
Taive "https://github.com€Linkhhf" "$TEMP_DIR/Clash.gz"
gzip -d "$TEMP_DIR/Clash.gz"
mv -f "$TEMP_DIR/Clash" $PHOME/Clash
chmod -R 777 "$PHOME"
rm -fr "$TEMP_DIR"/*
fi
# End code
</handler></page></group>
HiH
