clear
clc

explored_y = dlmread('y4.txt',' ');
plot(0:0.2:50, explored_y(1,:));
[M,N] = size(explored_y);

c(1) = 0.14;
c(2) = 0.3;
c(3) = 0.15;
c(4) = 0.12;

m(1) = 12;
m(2) = 21;
m(3) = 11;

h = 0.2;
t = 0.0;
tk = 50.0;
eps = 1e-6;
I = inf;
iterationNumber = 0;
resulted_y = zeros(M,N);

while (I > eps)
    iterationNumber = iterationNumber+1;
    y = explored_y(:,1);
    dy = zeros(M,1);
    U = zeros(6,3);
    B = zeros(3,3);
    b = zeros(3,1);
    I = 0.0;
    i = 2;

    for iter = 1:M
        resulted_y(iter,1) = y(iter,1);
    end

    while(i <= N)
        A = getA(m,c);
        Unew = U_RungeKutt(A, U, h, y, m, c);
        yNew = Y_RungeKutt(A, y, h, m, c);
        dyNew = explored_y(:,i) - yNew;
        for iter = 1:M
            resulted_y(iter,i)=y(iter,1);
        end

        B = B + h*(U'*U + Unew'*Unew) / 2.0;
        b = b + h*(U'*dy + Unew'*dyNew) / 2.0;
        I = I + h*(dy'*dy + dyNew'*dyNew) / 2.0;
        U = Unew;
        y = yNew;
        dy = dyNew;
        i = i + 1;
    end
    delta = pinv(B)*b;
    m(2) = m(2) + delta(1);
    c(3) = c(3) + delta(2);
    m(3) = m(3) + delta(3);
    disp(I);
   % figure
   % plot(0:0.2:50, explored_y(1,:),0:0.2:50, resulted_y(1,:));
end

%disp(size(resulted_y));
figure
plot(0:0.2:50, explored_y(1,:),0:0.2:50, resulted_y(1,:));
disp('m2: ');
disp(c(4));
disp('c3: ');
disp(m(1));
disp('m3: ');
disp(m(3));
disp('Iterations: ');
disp(iterationNumber);
