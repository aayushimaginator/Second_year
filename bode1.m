num=[80];
den=[1 22 40 0];
sys=tf(num,den);
bode(sys);
grid on;