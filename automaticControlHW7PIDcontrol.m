Jm = 1.13*10^-2;
b = 0.028;
La = 0.1;
Ra = 0.45;
Kt = 0.067;
Ke = 0.067;

A = Kt;
a1 = Jm*La;
a2 = b*La+Jm*Ra;
a3 = b*Ra + Kt*Ke;

sys = tf([A], [a1 a2 a3]);

kP = 3;
kI = 15;
kD = 0.3;

ctrl = tf([kD kP kI], [1 0]);

sys_C = feedback(series(ctrl, sys), 1);
sys_W = feedback(sys, ctrl);

step(sys_C);
grid;