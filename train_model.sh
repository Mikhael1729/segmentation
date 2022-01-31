echo "---[ Training de model ]---"

cd detr

python3 main.py --dataset_file face --data_path ../dataset/ --output_dir output --device cpu --resume weights/detr-r50-e632da11.pth
