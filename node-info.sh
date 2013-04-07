DISTRIB_RELEASE=$(cat /etc/lsb-release | grep DISTRIB_RELEASE | cut -f2 -d=)
CPU_MODEL=$(cat /proc/cpuinfo | grep 'model name' | cut -f2 -d: | head -n 1)
NCPUS=$(cat /proc/cpuinfo | grep processor | wc -l)
AVAIL_MEM=$(free -m -t | grep Total: | awk '{print $2}')
FREE_MEM=$(free -m -t | grep Total: | awk '{print $4}')

echo "$HOSTNAME $HOSTTYPE $NCPUS $FREE_MEM $AVAIL_MEM $DISTRIB_RELEASE $CPU_MODEL"
