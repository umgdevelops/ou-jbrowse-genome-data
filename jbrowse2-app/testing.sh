/fs/project/mog-ou.195/ou.195/rice_zygote

# only keep chrs and sort
grep -P -v '^A|^S' unfertilized_ovary_cat.bed > unfertilized_ovary_cat.chr.bed 
bedtools sort -i unfertilized_ovary_cat.chr.bed > unfertilized_ovary_cat.chr.sorted.bed

# convert cigar bed to coverage and bigwig format
python3 cigar_bed_to_coverage.py -i unfertilized_ovary_cat.chr.sorted.bed > unfertilized_ovary_cat.chr.sorted.cov
bedGraphToBigWig unfertilized_ovary_cat.chr.sorted.cov genome_sizes.txt unfertilized_ovary_cat.chr.sorted.bw

# fertilized_ovary
grep -P -v '^A|^S' fertilized_ovary_concat.bed > fertilized_ovary_cat.chr.bed
bedtools sort -i fertilized_ovary_cat.chr.bed > fertilized_ovary_cat.chr.sorted.bed
python3 ../../cigar_bed_to_coverage.py -i fertilized_ovary_cat.chr.sorted.bed > fertilized_ovary_cat.chr.sorted.cov
bedGraphToBigWig fertilized_ovary_cat.chr.sorted.cov ../genome_sizes.txt fertilized_ovary_cat.chr.sorted.bw

#seedling
grep -P -v '^A|^S' seedling_concat.bed > seedling_cat.chr.bed
bedtools sort -i seedling_cat.chr.bed > seedling_cat.chr.sorted.bed
nohup python3 ../../cigar_bed_to_coverage.py -i seedling_cat.chr.sorted.bed > seedling_cat.chr.sorted.cov &
bedGraphToBigWig seedling_cat.chr.sorted.cov ../genome_sizes.txt seedling_cat.chr.sorted.bw

#sperm
nohup grep -P -v '^A|^S' sperm_concat.bed > sperm_cat.chr.bed &
nohup bedtools sort -i sperm_cat.chr.bed > sperm_cat.chr.sorted.bed &
python3 ../../cigar_bed_to_coverage.py -i sperm_cat.chr.sorted.bed > sperm_cat.chr.sorted.cov
bedGraphToBigWig sperm_cat.chr.sorted.cov ../genome_sizes.txt sperm_cat.chr.sorted.bw

# unfertilized_ovary
nohup grep -P -v '^A|^S' unfertilized_ovary_cat.bed > unfertilized_ovary_cat.chr.bed  &
nohup bedtools sort -i unfertilized_ovary_cat.chr.bed > unfertilized_ovary_cat.chr.sorted.bed &
python3 ../../cigar_bed_to_coverage.py -i unfertilized_ovary_cat.chr.sorted.bed > unfertilized_ovary_cat.chr.sorted.cov
bedGraphToBigWig unfertilized_ovary_cat.chr.sorted.cov ../genome_sizes.txt unfertilized_ovary_cat.chr.sorted.bw

#zygote_concat.bed
nohup grep -P -v '^A|^S' zygote_concat.bed > zygote_cat.chr.bed &
nohup bedtools sort -i zygote_cat.chr.bed > zygote_cat.chr.sorted.bed &
python3 ../../cigar_bed_to_coverage.py -i zygote_cat.chr.sorted.bed > zygote_cat.chr.sorted.cov
bedGraphToBigWig zygote_cat.chr.sorted.cov ../genome_sizes.txt zygote_cat.chr.sorted.bw




git add fertilized_ovary/fertilized_ovary_cat.chr.sorted.bw
git add seedling/seedling_cat.chr.sorted.bw
git add sperm/sperm_cat.chr.sorted.bw
git add unfertilized_ovary/unfertilized_ovary_cat.chr.sorted.bw
git add zygote/zygote_cat.chr.sorted.bw