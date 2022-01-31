echo "---[ Training the model ]---"

base_dir="$CLONE_DIR"

cd "$PWD/$base_dir/detr"

python3 main.py \
  --dataset_file face \
  --data_path ../dataset/ \
  --epochs 2 \
  --output_dir output \
  --device cuda \
  --resume weights/detr-r50-e632da11.pth
