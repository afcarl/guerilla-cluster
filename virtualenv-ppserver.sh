export LD_CONFIG_PATH=$LD_CONFIG_PATH:$HOME/workspace/virtualenv/lib
source $HOME/workspace/virtualenv/bin/activate
cd $HOME/workspace/skill-acquisition/experiment
nohup ppserver.py -a -t 60 > ppserver-$HOSTNAME.out 2> ppserver-$HOSTNAME.err < /dev/null &

NCPUS=$(cat /proc/cpuinfo | grep processor | wc -l)
echo $HOSTNAME $NCPUS
