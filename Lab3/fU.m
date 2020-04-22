function res = fU(A, U, y, m, c)
    dAy = zeros(6,3);
    dAy(4, 1) = (-c(2)*y(1)+(c(2)+c(3))*y(3)-c(3)*y(5))/(m(2)*m(2));
    dAy(4, 2) = (-y(3)+y(5))/m(2);
    dAy(6, 2) = (-y(5)+y(3))/m(3);
    dAy(6, 3) = (-c(3)*y(3)+(c(3)+c(4))*y(5))/(m(3)*m(3));
    res = A * U + dAy;
end