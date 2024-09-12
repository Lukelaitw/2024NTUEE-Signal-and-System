clear all; clc;
%%
%(a)
a = [1, -0.8, 0.39, -0.062, 0.005];
b = 0.09*[1, 0, -2, 0, 1];
[r, p, k] = residuez(b, a);

figure
subplot(3,3,1)
zplane(b, a)
title('(a) zplane')
%%
%(b)
n=0:20;


h=impz(b,a, length(n));

subplot(3,3,2)
stem(n,h)
title('(b) h[n] vs n')
%%
%(c)
[H,w]=freqz(b,a);
Mag_H=abs(H);
subplot(3,3,3)
plot(w,Mag_H)
title('(c) |H| vs \omega')
theta = unwrap(angle(H));
subplot(3,3,4)
plot(w,theta)
title('(c) \theta vs \omega')


%%
%(d)
[z,p,k]=tf2zp(b,a);
sos = zp2sos(z, p, k);
[H1, w1] = freqz(sos(1, 1:3), sos(1, 4:6));
Mag_H1=abs(H1);
[H2, w2] = freqz(sos(2, 1:3), sos(2, 4:6));
Mag_H2=abs(H2);
pofH = abs(H2).*abs(H1);

%%
%(e)
subplot(3,3,5)
plot(w,Mag_H1)
title('(d) |H1| vs \omega')

subplot(3,3,6)
plot(w,Mag_H2)
title('(d) |H2| vs \omega')

subplot(3,3,7)
plot(w,pofH);
title('(d) |H1|*|H2| vs \omega')
%%
%(f)
x = zeros(1, 21);
x(1) = 1;
y = filter(b, a, x);

% Plot y[n] vs n
subplot(3,3,8)
stem(n, y)
title('(f) y[n] vs n')

