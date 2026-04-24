clc;
clear all;
close all;
% A = [4 1 1; 1 5 2; 1 2 3];
x1 = 0.5;
x2 = 0.5;
x3 = 0.5;
n = input('Enter the number of iterations: ');
for i=1:n
    x1i=(2-x2-x3)/4;
    x2i=(-6-2*x3-x1)/5;
    x3i=(-4-x1-2*x2)/3;
    x1=x1i;
    x2=x2i;
    x3=x3i;
end
fprintf('value ofx1=%d\n value of x2=%d\n value of x3=%d\n',x1,x2,x3);
fprintf('value of i = %d',i);
