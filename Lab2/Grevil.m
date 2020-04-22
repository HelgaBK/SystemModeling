function [ RES ] = Grevil( X )

m = size(X, 1);

a = X(1, :).';
A(1, :) = a;
if((a.' * a) == 0)
    RES = a;
else
    RES = a / (a.' * a);
end
e = 1^-6;

for k=2:m
    a = X(k, :).';
    AA = RES * A;
    one = ones(1, size(AA, 1));
    Z = diag(one) - AA;
    atZa = a.' * Z * a;
    A(k, :) = a;
    if atZa > e
        RES = RES - (Z * a * a.' * RES) / atZa;
        RES(:, k) = (Z * a) / atZa;
    else
        R = RES * RES.';
        atRa = a.' * R * a;
        RES = RES - (R * a * a.' *RES) / (1 + atRa);
        RES(:, k) = (R * a) / (1 + atRa);
    end
    
end

end
