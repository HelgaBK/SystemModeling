function res = U_RungeKutt(A, U, h, y, m, c)
    k1 = h * fU(A, U, y, m, c);
    k2 = h * fU(A, U + k1 / 2.0, y, m, c);
    k3 = h * fU(A, U + k2 / 2.0, y, m, c);
    k4 = h * fU(A, U + k3, y, m, c);
    res = U + (k1 + 2 * k2 + 2 * k3 + k4) / 6.0;
end