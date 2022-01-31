base_dir="segmentation"

echo "---[ Training de model ]---"

cd "$PWD/$base_dir/detr"

python3 main.py --dataset_file face --data_path ../dataset/ --output_dir output --resume weights/detr-r50-e632da11.pth
