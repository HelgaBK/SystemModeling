clear
clc

X = imread('x2.bmp');
X = double(X);
figure();
imshow(uint8(X));
title('Input X');

Y = imread('y5.bmp');
Y = double(Y);
figure();
imshow(uint8(Y));
title('Input Y');

% AX = Y %

%Grevil%
reverseX1 = Grevil(X);
X_reverseX1 = X * reverseX1;
one = ones(1, size(X_reverseX1, 1));
Z1 = diag(one) - X_reverseX1;
V1 = rand(size(Y, 1), size(reverseX1, 2));

A1 = Y * reverseX1 + V1 * Z1.';
Y1 = A1 * X;

figure();
imshow(uint8(Y1));
title('Grevill method');

%Mura-Penrouse
reverseX2 = MuraPenrouse(X);
X_reverseX2 = X * reverseX2;
one = ones(1, size(X_reverseX2, 1));
Z2 = diag(one) - X_reverseX2;
V2 = rand(size(Y, 1), size(reverseX2, 2));

A2 = Y * reverseX2 + V2 * Z2.';
Y2 = A2 * X;

figure();
imshow(uint8(Y2));
title('Mura-Penrouse method');

