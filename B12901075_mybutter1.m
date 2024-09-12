clear all; clc;
%%(a)
fs=20;
Ts=1/20;
n=1:100;
x=cos(2*pi*(n-1)*Ts);
figure(1)
plot(n,x,'-ob')
%%(b)
[b1,a1]=butter(3,0.05);
[H1, w1] = freqz(b1,a1);

y1=filter(b1,a1,x);
figure(2)
subplot(3,3,1),plot(w1,20*log(abs(H1))),xlabel('omega (rad/s)'), ylabel('20log|H1| (db)');
subplot(3,3,2),plot(w1,unwrap(angle(H1))*180/pi),xlabel('omega (rad/s)'), ylabel('Angle of H1(degree)');
subplot(3,3,3),plot(n,y1),xlabel('n'), ylabel('y1[n]');
%%(c)


[b2,a2]=butter(7,0.05);
[H2, w2] = freqz(b2,a2);

y2=filter(b2,a2,x);
subplot(3,3,4),plot(w2,20*log(abs(H2))),xlabel('omega (rad/s)'), ylabel('20log|H2| (db)');
subplot(3,3,5),plot(w2,unwrap(angle(H2))*180/pi),xlabel('omega (rad/s)'), ylabel('Angle of H2(degree)');
subplot(3,3,6),plot(n,y2),xlabel('n'), ylabel('y2[n]');

%%(d)
[b3,a3]=butter(3,0.5);
[H3, w3] = freqz(b3,a3);


y3=filter(b3,a3,x);
subplot(3,3,7),plot(w3,20*log(abs(H3))),xlabel('omega (rad/s)'), ylabel('20log|H3| (db)');
subplot(3,3,8),plot(w3,unwrap(angle(H3))*180/pi),xlabel('omega (rad/s)'), ylabel('Angle of H3(degree)');
subplot(3,3,9),plot(n,y3),xlabel('n'), ylabel('y3[n]');
