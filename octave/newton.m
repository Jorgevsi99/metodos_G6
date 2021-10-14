%NEWTON RAPHSON
%   NEWTON(FUN,A,D,T,ITER) llenar
%       [c,datos] = newton(fun, a, d, tol, iter)
%       c = raiz de la funci�n
%       datos = todas las variables de la ejecuci�n
%       fun = la funci�n a tratar
%       a = valor inicial de x
%       d = derivada de la funcion
%       tol = tolerancia
%       iter = n�mero m�ximo de iteraciones

function [c,datos,j] = newton(fun,a,d,tol=0.01,iter=1000)
  j=0;
  ea=100;
  f=fun;
  der=d;
  xi=0;
  
  while ea>tol
    if j>-1
      j=j+1;
      %almacenamos el primer punto
      datos(j,1)=a;
      %Aproximamos la raiz con la fórmula correpondiente
      xi=a-(f(a)/der(a));
      %Calculamos el porcentaje de error
      ea=abs((xi-a)/xi)*100;
      a=xi;
      %almacenamos los datos para la funcion Main
      datos(j,2)=xi;
      datos(j,3)=ea;
      c=xi;
      %fprintf('%d\t%f\t%f\n',j,a,ea);
    elseif j>iter
      msgID = 'PUNTOFIJO:iteraciones';
      msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
      error(msgID,msg);
    endif
    if ea<tol
      break;
    endif
end