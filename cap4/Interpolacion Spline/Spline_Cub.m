%Autores: Cristian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%Funcion interpolacion la cual encuentra los coeficientes de un polinomio
%el cual es la aproximacion de la relacion de los vectores x e y (puntos).

%INPUTS
  %X: datos tabulados
  %Y: datos tabulados

%OUTPUTS
  %c: matriz de coeficientes

function [c,h] = Spline_Cub(X,Y)
  
  n=length(X);
  n1=length(Y);
  
  if nargin >= 2
    if n==n1
      
      %Segundas derivadas en los puntos p_0 y p_n
      W1=0;
      WN=0;
      
      %Inicializacion de matrices
      h=zeros(1,n-1);
      U=zeros(1,n-1);
      b=zeros(1,n-2);
      
      %vector de Delta X (ayuda a simplificar la expresion de la 2da derivada)
      for i=1:n-1
          h(i)=X(i+1)-X(i);
      end
      
      %calculo de las segundas diferencias divididas
      for k=1:n-2
          b(k) = 6 * ((Y(k+2)-Y(k+1))/h(k+1) - (Y(k+1)-Y(k))/h(k));
      end
      
      %Sistema de ecuaciones para hallar las segundas derivadas
      %en los puntos p_2 hasta p_(n-1)
      M(1,1)=2*(h(1)+h(2));
      M(1,2)=h(2);
      B(1)=b(1)-h(1)*W1;
      M(n-2,n-3)=h(n-2);
      M(n-2,n-2)=2*(h(n-2)+h(n-1));
      B(n-2)=b(n-2)-h(n-1)*WN;
      
      for k=2:n-3
          M(k,k-1)=h(k);
          M(k,k)=2*(h(k)+h(k+1));
          M(k,k+1)=h(k+1);
          B(k)=b(k);
      end

      aux=inv(M)*B';
      W(1)=W1;
      W(n)=WN;
      
      for j=2:n-1
          W(j)=aux(j-1);
      end
      
      %Calculo de las primeras derivadas
      for k=1:n-1
          U(k)=(Y(k+1)-Y(k))/h(k)-(h(k)/6)*(2*W(k)+W(k+1));
      end
      
      %Calculo de los coeficientes de los polinomios
      for k=1:n-1
          c(k,1)=(W(k+1)-W(k))/(6*h(k));%valores de a (coeficientes de x^3)
          c(k,2)=W(k)/2 - 3*X(k)*c(k,1);%valores de b (coeficientes de x^2)
          c(k,3)=U(k)-X(k)*W(k)+3*c(k,1)*X(k)^2;%valores de c (coeficientes de x)
          c(k,4)=-c(k,1)*X(k)^3+(X(k)^2)*W(k)/2-X(k)*U(k)+Y(k);%valores de d
      end
      
    else
      error('Vectores inconsistentes');
    end
  else
    error('Argumentos insuficientes');
  end
  
end

