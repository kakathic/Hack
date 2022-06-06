cd $(dirname $0)
if [ ! -f "$TOME/Module/Hack-Proxy/run/clash.pid" ];then
sh clash.service -s
cat $TOME/Module/Hack-Proxy/run/run.log
curl -s --connect-timeout 2 -X PUT -H "Content-Type: application/json" -d '{"path": "'$PHOME'/config.yaml"}' http://127.0.0.1:9090/configs >/dev/null
else
sh clash.service -k
cat $TOME/Module/Hack-Proxy/run/run.log
fi
if [ -f "$TOME/Module/Hack-Proxy/run/error" ];then
cat $TOME/Module/Hack-Proxy/run/error
fi
