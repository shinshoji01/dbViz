for k in 1 2 3 4 5 6 7 8 9 10 11 12 13 16 15 16 17 18 19 20 30 40 50 60 64
#for k in 1 4 10 20 40 60

do

	for nr in 0.0 0.2
	do

		#python3 main.py --k $k --active_log --epochs 10 --noise_rate $nr
		python3 main.py --k $k --epochs 10 --noise_rate $nr

	done
done
