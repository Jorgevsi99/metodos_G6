%SECANTE
%   SECANTE(FUN,A,D,T,ITER) llenar
%       [c,datos] = secante(fun, a, b, tol, iter)
%       c = raiz de la función
%       datos = todas las variables de la ejecución
%       fun = la función a tratar
%       [a,b] intervalo
%       tol = tolerancia
%       iter = número máximo de iteraciones

function [c,datos,i] = secante(fun,a,b,tol=0.01,iter=1000)
  i=0;
  ea=100;
  f=fun;
  x0=0;
  x1=0;
  x2=0;
  
  while ea>tol
    if i>-1
      i=i+1;
      %almacenamos los primeros datos
      datos(i,1)=a;
      datos(i,2)=b;
      x0=f(a);
      x1=f(b);
      %Aproximamos la raiz con la fÃ³rmula correpondiente
      x2=b-(x1*((b-a)/(x1-x0)));
      %Calculamos el porcentaje de error
      ea=abs((x2-b)/x2)*100;
      a=x0;
      b=x1;
      %Almacenamos los datos para la funcion main
      datos(i,3)=x2;
      datos(i,4)=ea;
      c=x2;
    elseif i>iter
      msgID = 'PUNTOFIJO:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg);
    endif
    if ea<tol
      break;
    endif    
  endwhile
