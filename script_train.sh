declare -a ModelTypes=('resnet' 'fcnet' 'vit' 'densenet' 'vgg' 'MLPMixer4')

# For Figures 1, 2, 3, 4, 5 and Table 1
for mod in "${ModelTypes[@]}";
do

for seed in  0 1 2
do

python main.py --net $mod --set_seed $seed --save_net ./params --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001

done
done

 For Figures 1, 2, 3, 4, 5 and Table 1

for wid in 10 20 30
#for wid in 10
do
for seed in 0 1 2
#for seed in 0
do
python main.py --net WideResNet --widen_factor $wid  --set_seed $seed --save_net ./params --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001
done
done

# For Table 1
declare -a ModelTypes=('resnet' 'vit' 'vgg' 'MLPMixer4')

for mod in "${ModelTypes[@]}";
do

for seed in  0 1 2
do

python main.py --net $mod --set_seed $seed --save_net ./params_SGD --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001 --opt SGD
python main.py --net $mod --set_seed $seed --save_net ./params_SAM --imgs 500,5000,1600 --resolution 500 --epochs 100 --lr 0.001 --opt SGD --sam_radius 0.01

done
done
