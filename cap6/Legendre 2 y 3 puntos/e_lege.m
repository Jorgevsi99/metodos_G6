%FUNCIÓN CÁLCULO DE ERROR
%RESPUESTA
function e_lege = gausslege(f,n,c,m)
syms x;
dn=2*n+2;
for i=1:dn
  g=diff(f,x);
  f=g;
  if f == 0
      e_lege = 0;
      break
  else
    h = matlabFunction(f);
    d = h(c);
    e_lege=d*(2^(2*n+3)*(factorial(n+1))^4)/((2*n+3)*(factorial(2*n+2))^3);
  end
end
end