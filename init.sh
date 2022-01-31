#!/usr/bin/env bash
dataset_ids=("1N1o8yy4ke8IH1ygdCNE6_IVEkhT4MkD1" "1JxzthX7caH2Q8XVzTcWH0fO-z1QmQh7L" "1_iwVbqvPHUztloWsy_ot11wFCgs66GGN" "1_6jBHmCSGRGebG__MmJU8Onmg-2QyJE6")
dataset_names=("WIDER_train.zip" "WIDER_val.zip" "WIDER_test.zip"  "wider_face_split.zip")
base_dir="segmentation"
dataset_dir="$base_dir/dataset"

mkdir $dataset_dir
cd "$PWD/$dataset_dir"

for index in "${!dataset_ids[@]}"
do
  dataset_name=${dataset_names[$index]}

  echo "---[ Downloading $dataset_name ]---"

  gdown --id ${dataset_ids[$index]} --output $dataset_name

  echo "---[ Unzipping $dataset_name ]---"
  unzip $dataset_name -d .

  rm -r $dataset_name
done

echo "---[ Convert datasets to coco (train and val) ]---"

python3 face_to_coco.py

echo "---[ Download pretrained model ]---"

# Go to detr/weights
cd ..
cd detr/
mkdir weights
cd weights

# From there https://github.com/facebookresearch/detr 
wget https://dl.fbaipublicfiles.com/detr/detr-r50-e632da11.pth
