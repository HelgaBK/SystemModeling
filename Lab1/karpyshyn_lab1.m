clear
clc
y = dlmread('D:\f8.txt',' ');
dt = 0.01;
T = 5;
t = 0:dt:T;

plot(t,y),grid; %����������� ���� ���
%f = fft(y);

n = length(y); 
c1(1:n) = 0; %��������� ������, ������� n, ����������
c2(1:n) = 0;
c(1:n) = 0;

for k = 1:n %�� ��������� ����� ������ ��������� ������������ ���"�
    sum1 = 0;
    sum2 = 0;
    for  m = 1:n
        sum1 = sum1 + y(m)*cos(2*pi*(k-1)*(m-1)/n); %y(m)=x(k) �������� �(�)
        sum2 = sum2 + y(m)*sin(2*pi*(k-1)*(m-1)/n); 
    end
    c1(k) = sum1/n;
    c2(k) = sum2/n;
    c(k) = sqrt(c1(k)*c1(k)+c2(k)*c2(k));
end

figure;
plot(t,c),grid; %������ ������ ������ ����������� ������������

%fy=fft(y);
%figure;
%plot(abs(fy)),grid;


k=0;

for i=3:((n/2)-2) %��������� ��������� ��������
    if((c(i-1)<c(i))&(c(i+1)<c(i))&(c(i-2)<c(i))&(c(i+2)<c(i))) 
            k = k+1; %������ ��������� ����������
            extr(k) = i; %���������
    end
end
extr
w = (extr-1)/T; 
w

b(1) = 0; %b � ��� ���, �� � �� 2 ������
for i= 1: n
    b(1) = b(1) + y(i)*t(i)*t(i)*t(i);
end

b(2) = 0;
for i= 1: n
    b(2) = b(2) + y(i)*t(i)*t(i);
end

b(3) = 0;
for i= 1: n
    b(3) = b(3) + y(i)*t(i);
end

b(4) = 0;
for i= 1: n
    b(4) = b(4) + y(i)*sin(2*pi*w(1)*t(i));
end

b(5) = 0;
for i= 1: n
    b(5) = b(5) + y(i);
end

b

a(1,1)=sum(t.^6);
a(1,2)=sum(t.^5);
a(1,3)=sum(t.^4);
a(1,4)=sum(sin(2*pi*w(1).*t).*t.^3);
a(1,5)=sum(t.^3);


a(2,1)=sum(t.^5);
a(2,2)=sum(t.^4);
a(2,3)=sum(t.^3);
a(2,4)=sum(sin(2*pi*w(1).*t).*t.^2);
a(2,5)=sum(t.^2);

a(3,1)=sum(t.^4);
a(3,2)=sum(t.^3);
a(3,3)=sum(t.^2);
a(3,4)=sum(sin(2*pi*w(1).*t).*t);
a(3,5)=sum(t);

a(4,1)=sum(t.^3.*sin(2*pi*w(1).*t));
a(4,2)=sum(t.^2.*sin(2*pi*w(1).*t));
a(4,3)=sum(t.*sin(2*pi*w(1).*t));
a(4,4)=sum(sin(2*pi*w(1).*t).*sin(2*pi*w(1).*t));
a(4,5)=501*sum(sin(2*pi*w(1).*t));

a(5,1)=sum(t.^3);
a(5,2)=sum(t.^2);
a(5,3)=sum(t);
a(5,4)=sum(sin(2*pi*w(1).*t));
a(5,5)=501;

x=inv(a)*b' %��=b, ������ ������ �

myY = x(1).*t.^3+x(2).*t.^2+x(3).*t+x(4)*sin(2*pi*w(1).*t)+x(5); %x(1), x(2)...  �� ���� ������� �
figure;
plot(t,myY),grid;
error = 0;
for i =1:n 
    error = error+ (myY(i)-y(i))*(myY(i)-y(i));
end;
error