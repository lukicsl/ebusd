LOGFILE="ebusd"
LOGDIR=/var/log/
LOGEXT=".log"
MaxFileSize=20000000
MaxDirSize=200000000
cnt=0

while : ; do

  read line
  cnt=$(($cnt+1))

  printf "%s\n" "$line" >> $LOGDIR$LOGFILE$LOGEXT
  
  if [ $cnt -gt 200 ];then   
    cnt=0
    file_size=`du -b $LOGDIR$LOGFILE$LOGEXT | tr -s '\t' ' ' | cut -d' ' -f1`
    dir_size=`du -b $LOGDIR | tr -s '\t' ' ' | cut -d' ' -f1`

    if [ $file_size -gt $MaxFileSize ];then   
        timestamp=`date +%s`
        mv $LOGDIR$LOGFILE$LOGEXT $LOGDIR$LOGFILE.$timestamp$LOGEXT
    fi
    if [ $dir_size -gt $MaxDirSize ];then   
        rm $LOGDIR"$(ls -t $LOGDIR | tail -1)"
    fi
  fi

done
