LOGFILE="log2.txt"
MaxFileSize=1000

while : ; do
  read line

  printf "%s\n" "$line" >> $LOGFILE
  file_size=`du -b $LOGFILE | tr -s '\t' ' ' | cut -d' ' -f1`
  if [ $file_size -gt $MaxFileSize ];then   
     rm $LOGFILE
  fi

done
