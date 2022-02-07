# DETR model for face recognition

## Setting up

Add the following as env variables

- `WIDER_TRAIN_ID`
- `WIDER_VAL_ID`
- `WIDER_TEST_ID`
- `WIDER_FACE_SPLIT_ID`

Each one is the ID of a .zip dataset located at Google Drive. [Here](http://shuoyang1213.me/WIDERFACE/) are the links to the datasets in Google Drive


After that, execute the following inside the directory of the project:

```bash
bash init.sh
```

What it does is to download, uncompress and convert to coco format each one of the datasets which you use as reference in the previous env variables. It also downloads a pretrained model to speed up the training process (you just need 2 epochs of training to get reasonable results)

## Train the model

To train the model execute the `train_model.sh` and modify it as you wish

## Save your trained model

After training your model, a directory inside `detr/` will contain folder called `output`. Copy that folder to save a backup of your trained model

## Use the test dataset

Into the `detr/` directory, execute the following:

```
python3 test.py \ 
  --data_path ../dataset/WIDER_test/images \
  --resume <output-directory>/checkpoint.pth
```
