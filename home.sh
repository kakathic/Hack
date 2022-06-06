# Path
PHOME="$TOME/Module/Hack-Proxy"
CLASH=$PHOME/Clash

if [ ! -e /data/adb/service.d/Hack-Proxy.sh ];then
mkdir -p /data/adb/service.d
cp -rf $PHOME/Hack-Proxy.sh /data/adb/service.d 2>/dev/null
fi

if [ ! -e $PHOME/yacd-gh-pages ];then
Taive "https://github.com/MetaCubeX/yacd/archive/refs/heads/gh-pages.zip" "$PHOME/Testvg.zip"
unzip -qo "$PHOME/Testvg.zip" -d "$PHOME"
rm -fr "$PHOME/Testvg.zip"
fi

if [ ! -e "$CLASH" ];then
[ "$(Xset jsdjdn)" == 1 ] && Ukrrr="https://github.com/MetaCubeX/Clash.Meta/releases/tag/v1.11.1" || Ukrrr="https://github.com/MetaCubeX/Clash.Meta/releases/tag/Prerelease-Alpha"
Linkhhf="$(Xem "$Ukrrr" | grep -m1 'Clash.Meta-android-arm64-alpha' | cut -d \" -f2)"
Taive "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat" "$PHOME/GeoSite.dat"

Taive "https://github.com$Linkhhf" "$TEMP_DIR/Clash.gz"
gzip -d "$TEMP_DIR/Clash.gz"
mv -f "$TEMP_DIR/Clash" $PHOME/Clash
chmod -R 777 "$PHOME"
fi

if [ ! -e $PHOME/run/Vip.yaml ];then
mkdir -p "$PHOME/run"
echo 'proxies:
#🇭🇰 4G HK iamtayky
  - { name: "🇭🇰 4G HK iamtayky", server: 104.208.104.245, port: 443, type: vmess, uuid: a5f4f11a-0af5-4afe-fe44-27883a80d8be, alterId: 0, cipher: auto, tls: false, network: ws, ws-opts: { path: /, headers: { Host: iamtayky.akamaized.net } } }
##🇭🇰 4G HK iamtayky' > $PHOME/run/Vip.yaml
fi

cat << HiH | sed2
<?xml version="1.0" encoding="UTF-8" ?>
<items>

<text/>
<text title="Phiên bản" desc-sh="$CLASH -v;echo; cat $PHOME/run/error;echo"/>


<group>
<switch shell="hidden" reload="true" id="$RANDOM">
<title>Hack Proxy</title>
<desc>$(cat $PHOME/run/run.log)</desc>
<get>test -e $PHOME/run/clash.pid && echo 1 || echo 0</get>
<set>
$PHOME/scripts/service.sh
</set>
</switch>
</group>

<group>
<action shell="hidden" reload="true">
<title>Thêm Sever</title>
<desc>Nhập đường dẫn File, URL để thêm vào list</desc>
<param name="Tensv" value-sh="Xset Tensv" type="text" desc="Nhập Url hoặc Tệp tin nếu nhập cả hai nó chỉ nhận Url" placeholder="Tên Sever" required="required" />
<param name="Durl" type="text" title="Url" placeholder="http, vmess, trojan"/>
<param name="Ffile" type="file" title="Tệp tin" editable="true" suffix="yaml"/>
<set>
if [ €(echo €Durl | grep -cm1 vmess) == 1 ];then
Url () { echo "€Durl" | sed 's|vmess:\/\/||g' | base64 -d 2>/dev/null | sed -e 's|"||g' -e 's|,|\n|g' -e 's| ||g' -e 's|{||g' -e 's|}||g' -e 's|aid||g' | grep -m1 €@: | cut -d: -f2; }
[ €(echo "€(Url add)" | grep -cm1 'akamaized.net') == 1 ] && Tck="€(Url host)" || Tck="€(Url add)"
echo "#€Tensv
# €Durl
  - { name: \"€Tensv\", type: vmess, server: €Tck, uuid: €(Url id), port: €(Url port), alterId: 0, cipher: auto, tls: false, network: ws, ws-opts: { path: \"€(echo €(Url path))\", headers: { Host: v.akamaized.net } } }
##€Tensv" >> $PHOME/run/Vip.yaml
elif [ €(echo €Durl | grep -cm1 trojan) == 1 ];then
echo "#€Tensv
# €Durl
  - { name: \"€Tensv\", type: trojan, server: €(echo €Durl | cut -d @ -f2 | cut -d : -f1), port: 443, password: €(echo €Durl | cut -d / -f3 | cut -d @ -f1), sni: v.akamaized.net }
##€Tensv" >> $PHOME/run/Vip.yaml
elif [ €Durl ];then
echo "
#€Tensv
    €Tensv:
        type: http
        url: "€Durl"
        path: ./run/€(date +"%H_%M_%S")_€RANDOM.yaml
        health-check:
            enable: true
            url: http://www.gstatic.com/generate_204
            interval: 300
##€Tensv
" >> "$PHOME/config.yaml"
sed -i "s/#Themv/          - €Tensv\n#Themv/g" "$PHOME/config.yaml"
else
KKFi="€(date +"%H_%M_%S")_€RANDOM.yaml"
cp -rf "€Ffile" "$PHOME/run/€KKFi"
echo "
#€Tensv
    €Tensv:
        type: file
        path: ./run/€KKFi
        health-check:
            enable: true
            url: http://www.gstatic.com/generate_204
            interval: 300
##€Tensv
" >> "$PHOME/config.yaml"
sed -i "s/#Themv/          - €Tensv\n#Themv/g" "$PHOME/config.yaml"
fi

</set>
</action>
</group>

<group>
<action reload="true" shell="hidden" title="Xoá Sever" desc="Lựa chọn sever để xóa bỏ khỏi config.yaml" >
<param name="Xsv" label="Lựa chọn" required="required" option-sh="grep '##' $PHOME/config.yaml | sed 's/##//g' | awk '{print €0 &quot; 🎟️&quot;}';cat $PHOME/run/Vip.yaml | tr ',' '\n' | grep name: | cut -d \&quot; -f2 | awk '{print €0 &quot; 🎫&quot;}'"/>
<set>
if [ "€Xsv" ];then
Took="€(echo "€Xsv" | sed -e 's| 🎫||g' -e 's| 🎟️||g')"
[ "€(echo "€Xsv" | grep -cm1 '🎫')" == 1 ] && sed -i -e "/#€Took/,/##€Took/d" -e '/^$/d' "$PHOME/run/Vip.yaml" || sed -i -e "/- €Took/d" -e "/€Took/,/##€Took/d" -e '/^$/d' "$PHOME/config.yaml"
fi
</set>
</action>
</group>

<group>
<action shell="hidden" reload="true" title="Tùy chọn" desc="Tổng hợp các tùy chọn nhanh" >
<param name="Luachokhb" desc=" " label="Chế độ" value-sh="grep -m1 mode: $PHOME/config.yaml | cut -d : -f2" option-sh="echo Rule; echo Global; echo Direct; echo Script;"/>
<param name="ksjdbdjdj" desc=" " label="Hệ thống" value-sh="grep -m1 stack: $PHOME/config.yaml | cut -d : -f2" option-sh="echo System; echo gVisor;"/>
<param name="eheheb" desc=" " label="Nhật ký" value-sh="grep -m1 log-level: $PHOME/config.yaml | cut -d : -f2" option-sh="echo silent; echo info; echo warning; echo error; echo debug;"/>
<param name="sjdjdh" value-sh="grep -m1 filter: $PHOME/config.yaml | cut -d \&quot; -f2" type="text" desc="£Điền tên cần lọc ở sever Auto, Magic, bỏ trống để hủy lọc££Mặc định: 🇻🇳|VN£" label="Lọc tên"/>
<param name="bsbeh4j" desc=" " label="Chặn QC" value-sh="test $(grep -cm1 '#  - RULE-SET,anti-ad,REJECT' $PHOME/config.yaml) == 1 && echo 0 || echo 1" type="switch"/>
<param name="jsdjdn" label="Bản chính thức" desc="£Sử dụng Calsh phiên bản chính thức" value-sh="Xset jsdjdn" type="bool"/>
<set>
[ "€Luachokhb" ] && sed -i -e "s/€(grep -m1 mode: $PHOME/config.yaml)/mode: €Luachokhb/g" "$PHOME/config.yaml"
[ "€ksjdbdjdj" ] && sed -i -e "s/€(grep -m1 stack: $PHOME/config.yaml)/  stack: €ksjdbdjdj/g" "$PHOME/config.yaml"
[ "€eheheb" ] && sed -i -e "s/€(grep -m1 log-level: $PHOME/config.yaml)/log-level: €eheheb/g" "$PHOME/config.yaml"

[ "€bsbeh4j" == 1 ] && sed -i -e "s/€(grep -m1 'RULE-SET,anti-ad,REJECT' $PHOME/config.yaml)/  - RULE-SET,anti-ad,REJECT/g" "$PHOME/config.yaml" || sed -i -e "s/€(grep -m1 'RULE-SET,anti-ad,REJECT' $PHOME/config.yaml)/#  - RULE-SET,anti-ad,REJECT/g" "$PHOME/config.yaml"

[ "€sjdjdh" ] && sed -i -e "s/€(grep -m1 filter: $PHOME/config.yaml)/      filter: \"€sjdjdh\"/g" "$PHOME/config.yaml" || sed -i -e "s/€(grep -m1 filter: $PHOME/config.yaml)/#      filter: \"€sjdjdh\"/g" "$PHOME/config.yaml"
Tset jsdjdn €jsdjdn
</set>
</action>

</group>


<group>
<page html="http://127.0.0.1:9090/ui/#/proxies">
<title>Web Ui</title>
<desc>Lựa chọn các sever và các cài đặt khác</desc>
</page>
</group>


<group>
<page html="http://fastvpn-ph.speedtestcustom.com">
<title>Speed Test</title>
<desc>Kiểm tra tốc độ tải xuống, lên, ping mạng</desc>
</page>

</group>


<group>
<page html="https://checkip.vip">
<title>Kiểm tra ip</title>
<desc>Xem ip vị trí của bạn đang ở đâu</desc>
</page>
</group>

</items>
HiH
