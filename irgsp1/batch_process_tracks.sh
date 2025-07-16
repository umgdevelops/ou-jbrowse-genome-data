#!/bin/bash



INPUT_DIR="tracks"

OUTPUT_DIR="tracks_sorted"

mkdir -p "$OUTPUT_DIR"



for bed in "$INPUT_DIR"/*.bed; do

  filename=$(basename "$bed" .bed)

  sorted_bed="$OUTPUT_DIR/${filename}.sorted.bed.gz"



  echo "Processing $filename..."



  # 1. Sort

  jbrowse sort-bed "$bed" | bgzip > "$sorted_bed"



  # 2. Index

  tabix -p bed "$sorted_bed"



  # 3. Add to config.json (optional)

  jbrowse add-track "$sorted_bed" --load inPlace  --trackId "$filename" --name "$filename"



done



echo "✅ All BED files processed and added!"


