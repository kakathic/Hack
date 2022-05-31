cd $(dirname $0)
if [ ! -f "$TOME/Module/Hack-Proxy/run/clash.pid" ];then
sh clash.service -s
cat $TOME/Module/Hack-Proxy/run/run.log
else
sh clash.service -k
cat $TOME/Module/Hack-Proxy/run/run.log
fi
if [ -f "$TOME/Module/Hack-Proxy/run/error" ];then
cat $TOME/Module/Hack-Proxy/run/error
fi