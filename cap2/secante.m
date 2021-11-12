%SECANTE
%   SECANTE(FUN,A,D,T,ITER) llenar
%       [c,datos] = secante(fun, a, b, tol, iter)
%       c = raiz de la funci�n
%       datos = todas las variables de la ejecuci�n
%       fun = la funci�n a tratar
%       [a,b] intervalo
%       tol = tolerancia
%       iter = n�mero m�ximo de iteraciones

function [c,datos,i] = secante(fun,a,b,tol=0.01,iter=1000)
  i=0;
  ea=100;
  f=fun;
  xi=0
  
  while ea>tol
    if i>-1
      i=i+1;
      %almacenamos los primeros datos
      datos(i,1)=a;
      datos(i,2)=b;
      %Aproximamos la raiz con la fórmula correpondiente
      xi=b-(f(b)*(a-b))/(f(a)-f(b));
      %Calculamos el porcentaje de error
      ea=abs((xi-b)/xi)*100;
      %Almacenamos los datos para la funcion main
      datos(i,3)=ea;
      a=b;
      b=xi;
      c=xi;
    elseif i>iter
      msgID = 'SECANTE:iteraciones';
      msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
      error(msgID,msg);
    endif
    if ea<tol
      break;
    endif    
  endwhile