#!/system/bin/sh

module_dir="${0%/*}"
scripts_dir="/data/data/com.kakathic.shells/files/TOME/Module/Hack-Proxy/scripts"

Vkk () {
echo > /sdcard/Ktesst
if [ -e /sdcard/Ktesst ];then
rm -fr /sdcard/Ktesst
else
sleep 2
Vkk
fi
}
Vkk

${scripts_dir}/clash.service -s
inotifyd ${scripts_dir}/clash.inotify ${module_dir} >> /dev/null &