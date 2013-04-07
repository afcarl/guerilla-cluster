DISTRIB_RELEASE=`cat /etc/lsb-release | grep DISTRIB_RELEASE | cut -f2 -d=`
CPU_MODEL=`cat /proc/cpuinfo | grep 'model name' | cut -f2 -d: | head -n 1`
NCPUS=`cat /proc/cpuinfo | grep processor | wc -l`

echo "$HOSTNAME $DISTRIB_RELEASE $HOSTTYPE $NCPUS $CPU_MODEL"
