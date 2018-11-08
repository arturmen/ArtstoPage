#!/bin/bash

# run from images_work/originals

args=("$@")
dst=${args[0]}

tmp_resized_dir=/tmp/resized
tmp_miniatures_dir=/tmp/miniatures

# step 1 - resizing and compression
# rm -rf ${tmp_resized_dir}
# mkdir -p ${tmp_resized_dir}
# mogrify -path ${tmp_resized_dir} -filter lanczos2 -resize '1000x1000>' -quality 90 *.jpg
# ls ${tmp_resized_dir}

# step 2 - add miniatures
rm -rf ${tmp_miniatures_dir}
mkdir -p ${tmp_miniatures_dir}
mogrify -path ${tmp_miniatures_dir} -filter lanczos2 -resize 'x100>' -quality 90 *.jpg
ls ${tmp_miniatures_dir}

# step 3 - image optimization for large, resized images
# img_size=250k

# mkdir -p $dst
# jpegoptim ${tmp_resized_dir}/*.jpg --size=$img_size --dest=$dst
# jpegoptim ${tmp_resized_dir}/*.png --size=$img_size --dest=$dst