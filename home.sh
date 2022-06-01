# Path
PHOME="$TOME/Module/Hack-Proxy"
CLASH=$PHOME/Clash

if [ ! -e /data/adb/service.d/Hack-Proxy.sh ];then
mkdir -p /data/adb/service.d
cp -rf $PHOME/Hack-Proxy.sh /data/adb/service.d 2>/dev/null
mv -f $PHOME/Dashboard $TEMP_DIR
mv -f $PHOME/clash-dashboard $TEMP_DIR
fi

cat << HiH | sed2
<?xml version="1.0" encoding="UTF-8" ?>
<items>

<text/>
<text title="Phiên bản£" desc-sh="$CLASH -v;echo; cat $PHOME/run/error;echo"/>


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
<action shell="hidden" reload="true" title="Mode" desc="Chế độ đã lựa chọn:$(Zhex $PHOME/config.yaml | grep -m1 mode: | cut -d : -f2)" >
<param name="Luachokhb" label="Lựa chọn" value-sh="Zhex $PHOME/config.yaml | grep -m1 mode: | cut -d : -f2" option-sh="echo Rule; echo Global; echo Direct;"/>
<set>
Zhex "$PHOME/config.yaml" > "$TEMP_DIR/kkc.yaml"
sed -i -e "s/€(Zhex $PHOME/config.yaml | grep -m1 mode:)/mode: €Luachokhb/g" "$TEMP_DIR/kkc.yaml"
Xhex "$TEMP_DIR/kkc.yaml" > "$PHOME/config.yaml"
</set>
</action>
</group>

<group>
<action shell="hidden">
<title>Thêm Sever</title>
<desc>Nhập đường dẫn File, URL để thêm vào list</desc>
<param name="Tensv" value-sh="Xset Tensv" type="text" desc="Nhập Url hoặc Tệp tin nếu nhập cả hai nó chỉ nhận Url" placeholder="Tên Sever" required="required" />
<param name="Durl" type="text" title="Url" placeholder="http://test.com"/>
<param name="Ffile" type="file" title="Tệp tin" editable="true" suffix="yaml"/>
<set>
if [ €Durl ];then
Zhex "$PHOME/config.yaml" > "$TEMP_DIR/kkc.yaml"
echo "
#€Tensv
    €Tensv:
        type: http
        url: "€Durl"
        path: ./run/€(date +"%H_%M_%S")_€RANDOM.yaml
        health-check:
            enable: true
            url: http://www.gstatic.com/generate_204
            interval: 600
##€Tensv
" >> "$TEMP_DIR/kkc.yaml"

else
KKFi="€(date +"%H_%M_%S")_€RANDOM.yaml"
Zhex "$PHOME/config.yaml" > "$TEMP_DIR/kkc.yaml"
cp -rf "€Ffile" "$PHOME/run/€KKFi"
echo "
#€Tensv
    €Tensv:
        type: file
        path: ./run/€KKFi
        health-check:
            enable: true
            url: http://www.gstatic.com/generate_204
            interval: 600
##€Tensv
" >> "$TEMP_DIR/kkc.yaml"
fi

sed -i "s/#Themv/          - €Tensv\n#Themv/g" "$TEMP_DIR/kkc.yaml"
Xhex "$TEMP_DIR/kkc.yaml" > "$PHOME/config.yaml"
</set>
</action>

</group>

<group>
<action shell="hidden" title="Xoá Sever" desc="Lựa chọn sever để xóa bỏ khỏi config.yaml" >
<param name="Xsv" label="Lựa chọn" option-sh="Zhex $PHOME/config.yaml | grep '##' | sed 's/##//g'"/>
<set>
Zhex "$PHOME/config.yaml" > "$TEMP_DIR/kkc.yaml"
sed -i -e "/#€Xsv/,/##€Xsv/d" -e "/- €Xsv/d" -e '/^$/d' "$TEMP_DIR/kkc.yaml"
Xhex "$TEMP_DIR/kkc.yaml" > "$PHOME/config.yaml"
</set>
</action>
</group>


<group>
<action shell="hidden" reload="true" title="Giao diện Web" desc="Chủ đề đã lựa chọn:$(Zhex $PHOME/config.yaml | grep -m1 external-ui: | cut -d : -f2)" >
<param name="kxkdbrb" label="Lựa chọn" value-sh="Zhex $PHOME/config.yaml | grep -m1 external-ui: | cut -d : -f2" option-sh="echo Dashboard; echo clash-dashboard/dist;"/>
<set>
Zhex "$PHOME/config.yaml" > "$TEMP_DIR/kkc.yaml"
sed -i -e "s/€(Zhex $PHOME/config.yaml | grep -m1 external-ui:)/external-ui: €kxkdbrb/g" "$TEMP_DIR/kkc.yaml"
Xhex "$TEMP_DIR/kkc.yaml" > "$PHOME/config.yaml"
</set>
</action>
</group>


<group>
<page html="http://127.0.0.1:9090/ui">
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
