%REGULA FALSI
%   REGFAL(FUN,A,D,T,ITER) llenar
%       [ra,datos] = regfal(fun, a, b, tol, iter)
%       ra = raiz de la función
%       datos = todas las variables de la ejecución
%       fun = la función a tratar
%       [a,b] intervalo
%       tol = tolerancia
%       iter = número máximo de iteraciones

function [ra,datos,j] = newton(fun,a,b,tol=0.01,iter=1000)
  j=2;
  ea=100;
  f=fun;
  c=a;
  d=b;
  p=a;
  x(1)=p; %Toma como primer valor el extremo izquierdo del intervalo
  
  while ea>tol
    if j>1
      %almacenamos los primeros datos
      datos(j-1,1)=c;
      datos(j-1,2)=d;
      
      %Calculamos el porcentaje de error
      ea=abs((c-d)/c)*100;
      datos(j-1,3)=ea;
      
      %Formula para el punto en regla falsa
      p=c-f(c)*(d-c)/(f(d)-f(c));
      
      if f(c)*f(p)<0 %Analiza si hay cambio de signo para acortar el intervalo
        %Reemplaza el extremo b del intervalo por el punto p
        d=p;
        ra=d;
      else
        %Reemplaza el otro extremo del intervalo
        c=p;
        ra=c;
      end
    elseif j>iter
      msgID = 'NR:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg);
    endif
    if ea<tol
      break;
    endif
    j=j+1;
end
