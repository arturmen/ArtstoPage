#!/bin/bash

args=("$@")

src=${args[0]}
dst=${args[1]}

IMG_SIZE=250k

# step 1
# resize to 1000

# step 2
mkdir -p $dst
jpegoptim $src/*.jpg --size=$IMG_SIZE --dest=$dst
jpegoptim $src/*.png --size=$IMG_SIZE --dest=$dst