clear all; clc;
%(a)
f1 =100;
Ts=0.002;
M = 1000;
n=1:M;
x=cos(2*pi*(n-1)*Ts)+2*cos(2*pi*f1*(n-1)*Ts);
subplot(3,1,1),plot(n,x,'-ob'),xlabel('n'), ylabel('x[n]');
%%(b)
fc=0.25;

[b1,a1]=butter(16,0.25,'low');
y1=filter(b1,a1,x);

subplot(3,1,2),plot(n,y1),xlabel('n'), ylabel('y1[n]');
%%(c)




fc=0.25;

[b2,a2]=butter(8,[0.2,0.8],"bandpass");
y2=filter(b2,a2,x);


subplot(3,1,3),plot(n,y2),xlabel('n'), ylabel('y2[n]');
