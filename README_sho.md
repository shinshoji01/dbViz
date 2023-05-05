# Instruction from Sho
There are some errors (especially the path error) I found in thie repo so I fixed some codes. To ease the reproduction, I also add two `.sh` files: `script_train.sh` and `script_soft_dist.sh`.
In thie README, you can find the basic instruction and how to create the environment.
## How to Create Conda Environment with Docker
1. Download docker and docker-compose by the following websites (you may need vpn to visit).
    1. https://www.notion.so/Install-Docker-Compose-e242593471b94cc895a0dfaa5289a673?pvs=4
    1. https://www.notion.so/How-to-Use-Nvidia-Docker-f8ba5120b2c84b44854cbb3564dfd796?pvs=4
2. `cd Docker`
3. Change the path of the working directry under "volumns"; mine is set as `/workspace/sho/`.
4. Set the GPU indices you use; e.g. if you use two gpus, it should be set as ["0", "1"].
5. `docker-compose up -d`
6. `docker-compose exec conda bash`
7. Go to `dbViz/` folder.
8. `conda env create -f environment.yml`
    1. You need to run this only once.
9. `conda activate dbviz_env`
10. `pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple`
    1. You need to run this only once.

## New files
- `script_train.sh`
    - This is used to train all the models you will use. 
    - All models will be stored in `params/`. 
    - If you don't need the models with SGD optimizer, you can comment out "For Table 1" part. 
- `script_soft_dist.sh`
    - This is used to reproduce Figure 5, so if you won't need the figure, you just ignore this.
    - All models will be stored in `params_dist/`.

## What I editted
- `main.py`
    - I fixed the path errors.
    - I edited `WideResNet` codes to align with `script_plots.sh`
- `save_preds.py` and `calculate_iou.py`
    - I editted them to align with `main.py`
- `models.py`
    - I fixed `get_teacher_model` to allow the name with lower case letters.
- `script_plots.sh`
    - I edited this file to automate the reproduction of the figures.
- `evaluation.py`
    - I changed the loss function for the distillation -> MSELoss.
