function res = Y_RungeKutt(A, y, h, m, c)
    k1 = h * fy(A, y);
    k2 = h * fy(A, y + k1 / 2.0);
    k3 = h * fy(A, y + k2 / 2.0);
    k4 = h * fy(A, y + k3);
    res = y + (k1 + 2 * k2 + 2 * k3 + k4) / 6.0;
end