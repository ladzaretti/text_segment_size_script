dir_exec_size(){
  path=$1
  filename=$2
  for i in `find $1 -executable`; do                        #iterate over executable paths
    size $i | grep -i ${path} | cut -f1 >> ${filename}      #get size of exec, filter relevant data column, append size's output into temp
    done
  sed -i 's/\ //g' ${filename}                              #remove whitespaces                              
}
analyze_dir(){
  path=$1
  filename=$2
  echo "analyzing ${path}..."
  dir_exec_size ${path} ${filename}
  awk '{sum+=$1; ++n;} END {avg=sum/n; print "avg = " avg ", # = " n; print "optimal page size = sqrt(2*s*e) = " sqrt(8*avg)}' ${filename}
  sort -k1 -n ${filename} | awk '{arr_sorted[i++]=$1; } END {print "median = " arr_sorted[int(i/2)]; }'
  rm -r output                                                #refresh/remove output      
}
lsb_release -a
echo "#################################################"
echo "(assuming page table entry size is 4 byte, e = 4)"
echo
analyze_dir /usr/bin output 2>/dev/null
echo "#################################################"
analyze_dir /bin output 2>/dev/null
