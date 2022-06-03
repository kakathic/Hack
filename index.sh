# Path
PHOME="$TOME/Module/Hack-Proxy"

# Command
cat << HiH | sed2
<group>
<page config-sh=". $PHOME/home.sh" id="$RANDOM" visible="test -e /sdcard/Tools/Vip && echo 1 || echo 0">
<title>Hack Proxy</title>
<desc>Giúp máy bạn có mạng, thay đổi ip proxy</desc>
<option type="refresh" icon="$TOME/usr/Tool/Loading.png" >$lammoi</option>
<option type="default" id="kk2" reload="true" auto-off="true">Cập nhật toàn bộ</option>
<option type="default" id="kk" >Nhật ký</option>
<handler>
# Start code
if [ "€menu_id" == "kk" ];then
cat $PHOME/run/kernel.log
else
ecgi "€loading"
Taive "https://github.com/kakathic/Hack/archive/refs/heads/Proxy.zip" "€TEMP_DIR/Test.zip"
Linkhhf="€(Xem "https://github.com/MetaCubeX/Clash.Meta/releases/tag/Prerelease-Alpha" | grep -m1 'Clash.Meta-android-arm64-alpha' | cut -d \" -f2)"
Taive "https://github.com€Linkhhf" "€TEMP_DIR/Clash.gz"
unzip -o "€TEMP_DIR/Test.zip" -d "€TOME/Module"
gzip -d "€TEMP_DIR/Clash.gz"
mv -f "€TEMP_DIR/Clash" $PHOME/Clash
chmod -R 777 "$PHOME"
rm -fr "€TEMP_DIR/Test.zip"
rm -fr $PHOME/yacd-gh-pages
fi
# End code
</handler></page></group>
HiH
