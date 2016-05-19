
echo "Mapping by bowtie2"
time=`date`
echo $time
bowtie2   -p 5   --very-sensitive   -x /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all -1 /home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A_fastq/L8_CACGAT_L008_R1_001.fastq.gz -2 /home/jinxu/Ba
ckup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A_fastq/L8_CACGAT_L008_R2_001.fastq.gz  -S  /home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A/Rai1_ChIP_A.sam 
awk '$3!="chrM"' /home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A/Rai1_ChIP_A.sam |samtools view -S -b -f 0x2 -q 10 - |samtools sort -  /home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP
_A/Rai1_ChIP_A.pe.q10.sort
# remove duplicates
java -jar /home/jinxu/Software/broadinstitute-picard-5f5ba77/dist/picard.jar  MarkDuplicates  REMOVE_DUPLICATES=true METRICS_FILE=/home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A/Rai1_ChIP_
A.pe.q10.dup.txt AS=true INPUT=/home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A/Rai1_ChIP_A.pe.q10.sort.bam OUTPUT=/home/jinxu/Backup/Rai1-KO/Rai1-Chip-second/Rai1_ChIP_A/Rai1_ChIP_A.pe.q10
.rmdup.bam
