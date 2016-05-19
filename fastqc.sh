for file in `ls  */*.fastq.gz`
do 
/home/jinxu/Software/FastQC/fastqc    $file
done
