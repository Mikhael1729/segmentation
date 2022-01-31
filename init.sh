#!/usr/bin/env bash
dataset_ids=("15hGDLhsx8bLgLcIRD5DhYt5iBxnjNF1M" "1GUCogbp16PMGa39thoMMeWxp7Rp5oM8Q" "1HIfDbVEWKmsYKJZm4lchTBDLW5N7dY5T" "1IgM1-ctR6FsveYNZhnh9xSCW_Gucap0a")
dataset_names=("WIDER_train.zip" "WIDER_val.zip" "WIDER_test.zip"  "wider_face_split.zip")
dataset_dir="dataset"

mkdir $dataset_dir
cd $dataset_dir

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
