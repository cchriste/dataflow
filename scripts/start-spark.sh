#! /bin/bash

echo "starting spark..."
cd $HOME/code/spark
cat $COBALT_NODEFILE > conf/slaves
./sbin/start-all.sh 
echo "spark started..."

h=`hostname`
num_workers=`wc -l conf/slaves`

echo "Spark is now running with $num_workers workers:" > ~/spark-hostname
echo "  STATUS: http://$h.cooley.pub.alcf.anl.gov:8000" >> ~/spark-hostname
echo "  MASTER: spark://$h:7077" >> ~/spark-hostname

#keep non-interactive job running
while true
do
  sleep 5
  echo `hostname`
  cat $COBALT_NODEFILE
done