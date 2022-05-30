# Path
PHOME="$TOME/Module/Hack-Proxy"
CLASH=$PHOME/Clash

if [ ! -e /data/adb/service.d/Hack-Proxy.sh ];then
mkdir -p /data/adb/service.d
cp -rf $PHOME/Hack-Proxy.sh /data/adb/service.d 2>/dev/null
fi

cat << HiH | sed2
<?xml version="1.0" encoding="UTF-8" ?>
<items>
<text/>
<text>
<summary>$($CLASH -v)</summary>
</text>


<group>
<switch shell="hidden" reload="true" id="123">
<title>Hack Proxy</title>
<desc>$(cat $PHOME/run/run.log)</desc>
<summary>$(cat $PHOME/run/error)</summary>
<get>test -e $PHOME/run/clash.pid && echo 1 || echo 0</get>
<set>
$PHOME/scripts/service.sh
</set>
</switch>
</group>

<group>
<page link="http://127.0.0.1:9090/ui">
<title>Web Ui</title>
<desc>Lựa chọn các sever và các cài đặt khác</desc>
</page>
</group>

<group>
<action shell="hidden">
<title>Thêm Sever</title>
<desc>Nhập đường dẫn File, URL để thêm vào list</desc>
<param name="Tensv" value-sh="Xset Tensv" type="text" placeholder="Tên Sever" required="required" />
<param name="Durl" type="text" desc="£Hoặc" placeholder="http://test.com"/>
<param name="Ffile" type="file" editable="true" suffix="yaml"/>
<set>
if [ €Durl ];then
echo "
#€Tensv
    €Tensv:
        type: http
        url: "€Durl"
        path: ./run/€(date +"%Y_%m_%d_%H")_€RANDOM.yaml
        health-check:
            enable: true
            url: http://www.gstatic.com/generate_204
            interval: 600
##€Tensv
" >> $PHOME/config.yaml
else
KKFi="€(date +"%Y_%m_%d_%H")_€RANDOM.yaml"
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
" >> $PHOME/config.yaml
fi

sed -i "s/#Themv/          - €Tensv\n#Themv/g" $PHOME/config.yaml
</set>
</action>
</group>

<group>
<action shell="hidden" title="Xoá Sever" desc="Lựa chọn sever để xóa bỏ khỏi config.yaml" >
<param name="Xsv" label="Lựa chọn" option-sh="cat $PHOME/config.yaml | grep '##' | sed 's/##//g'"/>
<set>
sed -i -e "/#€Xsv/,/##€Xsv/d" -e "/- €Xsv/d" -e '/^$/d' $PHOME/config.yaml
</set>
</action>
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
