%REGULA FALSI
%   REGFAL(FUN,A,D,T,ITER) llenar
%       [ra,datos] = regfal(fun, a, b, tol, iter)
%       ra = raiz de la función
%       datos = todas las variables de la ejecución
%       fun = la función a tratar
%       [an,bn] intervalo
%       tol = tolerancia
%       iter = número máximo de iteraciones

function [ra,datos,j] = regfal(fun,an,bn,tol=0.01,iter=1000)
  j=2;
  ea=100;
  f=fun;
  u=f(an);
  v=f(bn);
  a=an;
  b=bn;
  p=a;
##  x(1)=p; %Toma como primer valor el extremo izquierdo del intervalo
  
  while ea>tol
    if j>1
      %almacenamos los primeros datos
      datos(j-1,1)=a;
      datos(j-1,2)=b;
            
      %Formula para el punto en regla falsa
      p=a-(u*(b-a)/(v-u));
      
      %Calculo del error
      ea=f(p);
      w=ea;
      datos(j-1,3)=ea;
      
      if u*w<0 %Analiza si hay cambio de signo para acortar el intervalo
        %Reemplaza el extremo b del intervalo por el punto p
        a=an;
        b=p;
        %ra=b;
      else
        %Reemplaza el otro extremo del intervalo
        a=p;
        b=bn;
        %ra=a;
      end
      u=f(a);
      v=f(b);
      j=j+1;
      ra=p;
    elseif j>iter
      msgID = 'REGFAL:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg);
    endif
    if ea<tol
      break;
    endif
end
%ra=p;
