%section1
clear all; clc;

N=1001;
T=100;
N1 = 500;
Ts = T/N1;

n = (-500 :500) ; 
x = sin(2*pi*n*Ts)./(2*pi*n*Ts) ;
x(501)=1;
figure(1);
plot(n, x,'-or');
%%
X = fft(x);
X= fftshift(abs(X));
w= 2*pi*n./1001;
figure(2);
plot(w,X,"-oB")

%%
X2 (1:1001)=0;


for a =1:1001
    c=0;
    for q = -500:500
        c=c+x(q+501)*exp(-1i*2*pi*(q)*(a-1)./1001);
    end
    X2(a)=c;
end
X2= fftshift(abs(X2));
figure(3);
plot(w,X2,"-or")

%%
%section 2
Tw=50;
n = -500: 500;
W=0.5*(1+cos(2*pi*abs(n*Ts)./Tw)).*(abs(n*Ts)<=25) ;
figure(4);
plot(n, W,'-ob');
%%

t= -500:500;
y=x.*W;
figure(5);
plot(t,y,'-or');

%%

W2 (1:1001)=0;
for a =1:1001
    c=0;
    for q = -500:500
        c=c+y(q+501)*exp(-1i*2*pi*(q)*(a-1)./1001);
    end
    W2(a)=c;
end
W2= fftshift(abs(W2));
figure(6);
plot(n,W2,'-ob')