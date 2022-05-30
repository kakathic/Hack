cd $(dirname $0)
if [ ! -f "/data/data/com.kakathic.shells/files/TOME/Module/Hack-Proxy/run/clash.pid" ];then
sh clash.service -s
cat /data/data/com.kakathic.shells/files/TOME/Module/Hack-Proxy/run/run.log
else
sh clash.service -k
cat /data/data/com.kakathic.shells/files/TOME/Module/Hack-Proxy/run/run.log
fi
if [ -f "/data/data/com.kakathic.shells/files/TOME/Module/Hack-Proxy/run/error" ];then
cat /data/data/com.kakathic.shells/files/TOME/Module/Hack-Proxy/run/error
fi