function [ RES ] = MuraPenrouse( X )

[m,n] = size(X);

del = 10;
X1=[];
X2=[];
eps = 0.001;
difX1X2 = 100;
while ( difX1X2 > eps )
   if( m > n)
       X1 = inv(X' * X - del * del * eye(n)) * X';
   else
       X1 = X' * inv(X * X' - del * del * eye(m));
   end
   del = del / 2;
   if( m > n)
       X2 = inv(X' * X - del * del * eye(n)) * X';
   else
       X2 = X' * inv(X * X' - del * del * eye(m));
   end
   difX1X2 = norm(X1 - X2);
end
RES = X1;

end

