num = [1];
den = [1 5 6 0];
sys = tf(num, den);

controller_K = 20;

total_sys = feedback(series(controller_K, sys), 1);

step(total_sys);