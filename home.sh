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
[ -e $PHOME/run/Vip.yaml ] || echo "proxies:" > $PHOME/run/Vip.yaml
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
<action shell="hidden">
<title>Thêm Sever</title>
<desc>Nhập đường dẫn File, URL để thêm vào list</desc>
<param name="Tensv" value-sh="Xset Tensv" type="text" desc="Nhập Url hoặc Tệp tin nếu nhập cả hai nó chỉ nhận Url" placeholder="Tên Sever" required="required" />
<param name="Durl" type="text" title="Url" placeholder="http, vmess, trojan"/>
<param name="Ffile" type="file" title="Tệp tin" editable="true" suffix="yaml"/>
<set>
if [ €(echo €Durl | grep -cm1 vmess) == 1 ];then
Url () { echo "€Durl" | sed 's|vmess:\/\/||g' | base64 -d 2>/dev/null | sed -e 's|"||g' -e 's|,|\n|g' -e 's| ||g' -e 's|{||g' -e 's|}||g' | grep -m1 €@ | cut -d: -f2; }
echo "  - {name: €Tensv, type: vmess, server: €(Url add), uuid: €(Url id), port: 80, alterId: 0, cipher: auto, udp: true, network: ws, ws-opts: {path: /€(Url path | sed 's|/||g'), headers: {Host: v.akamaized.net}}}" >> $PHOME/run/Vip.yaml
elif [ €(echo €Durl | grep -cm1 trojan) == 1 ];then
echo "  - { name: €Tensv, type: trojan, server: €(echo €Durl | cut -d @ -f2 | cut -d : -f1), port: 443, password: €(echo €Durl | cut -d / -f3 | cut -d @ -f1), udp: true, sni: v.akamaized.net, skip-cert-verify: true }" >> $PHOME/run/Vip.yaml
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
            interval: 36000
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
            interval: 36000
##€Tensv
" >> "$PHOME/config.yaml"
sed -i "s/#Themv/          - €Tensv\n#Themv/g" "$PHOME/config.yaml"
fi

</set>
</action>

<action shell="hidden" title="Xoá Sever" desc="Lựa chọn sever để xóa bỏ khỏi config.yaml" >
<param name="Xsv" label="Lựa chọn" option-sh="grep '##' $PHOME/config.yaml | sed 's/##//g'"/>
<set>
sed -i -e "/#€Xsv/,/##€Xsv/d" -e "/- €Xsv/d" -e '/^$/d' "$PHOME/config.yaml"
</set>
</action>
</group>

<group>
<action shell="hidden" reload="true" title="Mode" desc="Chế độ đã lựa chọn:$(grep -m1 mode: $PHOME/config.yaml | cut -d : -f2)" >
<param name="Luachokhb" label="Lựa chọn" value-sh="grep -m1 mode: $PHOME/config.yaml | cut -d : -f2" option-sh="echo Rule; echo Global; echo Direct; echo Script;"/>
<set>
sed -i -e "s/€(grep -m1 mode: $PHOME/config.yaml)/mode: €Luachokhb/g" "$PHOME/config.yaml"
</set>
</action>


<action shell="hidden" reload="true" title="Hệ thống" desc="Hệ thống đã lựa chọn:$(grep -m1 stack: $PHOME/config.yaml | cut -d : -f2)" >
<param name="ksjdbdjdj" label="Lựa chọn" value-sh="grep -m1 stack: $PHOME/config.yaml | cut -d : -f2" option-sh="echo system; echo gvisor;"/>
<set>
sed -i -e "s/€(grep -m1 stack: $PHOME/config.yaml)/  stack: €ksjdbdjdj/g" "$PHOME/config.yaml"
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
