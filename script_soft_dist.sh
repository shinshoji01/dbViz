declare -a ModelTypes=('resnet' 'densenet' 'vgg')

### For Figure 5
for tmod in "${ModelTypes[@]}";
do
for smod in "${ModelTypes[@]}";
do

for seed in  0 1 2
do

python main.py --net $smod --set_seed $seed --save_net ./params_dist/$tmod --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001 --teacher_loc ./params/$tmod/0.pth --train_mode soft_distillation --teacher_net $tmod

done
done
done

# teacher is WideResNet
for smod in "${ModelTypes[@]}";
do

#for seed in  0 1 2
for seed in  0
do

python main.py --net $smod --set_seed $seed --save_net ./params_dist/WideResNet_10 --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001 --teacher_loc ./params/WideResNet_10/0.pth --train_mode soft_distillation --teacher_net WideResNet --widen_factor 10

done
done

# student is WideResNet
for tmod in "${ModelTypes[@]}";
do

#for seed in  0 1 2
for seed in  0
do

python main.py --net WideResNet --set_seed $seed --save_net ./params_dist/$tmod --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001 --teacher_loc ./params/$tmod/0.pth --train_mode soft_distillation --teacher_net $tmod --widen_factor 10

done
done
