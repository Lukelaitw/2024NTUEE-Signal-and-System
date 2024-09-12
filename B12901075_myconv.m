clear all; clc;
n = 1 : 39;
x1 = (n).*(n<=20 & n>=1)+(40-n).*(n>20 & n<=39);
x2 = (n<11 & n>=1);
figure(1)
stem(n, x1)
figure(2)
stem(n, x2)
%%
%hold on
y = conv(x1,x2);
stem(y);
%%
clear all; clc;
X2(1:10)=1;
X1(1:39)=0;
for i=1:39
    if i<=20 && i>=1
        X1(i)=i;
    else i>20 & i<= 39;
        X1(i)=40-i;
    end
end
A(1:48,1:10)=0;
for i =1:10
    for j = 1:48
        if j>=i && j-i+1<=39
            A(j,i)=X1(j-i+1);
        end
    end
end
X2=transpose(X2);

mat = A*X2;
stem(mat);
%%
clear all; clc;
n = 1 : 3;
x1 = (3.^n).*(n<=3 & n>=1)
figure(1)
stem(n, x1)
n = 1 : 5
x2 = (2.^n).*(n<11 & n>=1) ;

figure(2)
stem(n, x2)
%%
hold on
y = conv(x1,x2);
stem(y);
%%
clear all; clc;
X2(1:5)=1;
X1(1:3)=0;
for i=1:5
    if i<=3
        X1(i)=3^i;
        X2(i)=2^i
    else i>3;
        X2(i)=2^i
    end
end
A(1:7,1:5)=0;
for i =1:5
    for j = 1:7
        if j>=i && j-i+1<=3
            A(j,i)=X1(j-i+1);
        end
    end
end
X2=transpose(X2);
mat = A*X2
stem(mat);

