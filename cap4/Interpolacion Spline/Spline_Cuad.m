%Autores: Cristian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%Funcion interpolacion la cual encuentra los coeficientes de un polinomio
%el cual es la aproximacion de la relacion de los vectores x e y (puntos).

%INPUTS
  %X: datos tabulados
  %Y: datos tabulados

%OUTPUTS
  %c: matriz de coeficientes

function[c,x,n]=Spline_Cuad(X,Y)
%Se recibe 2 vectores [x,y] de tipo int
%Se va a devolver una matriz de Coeficientes

  if nargin >= 2
    n1 = length(X); 
    n2 = length(Y);
    if n1==n2
      
      n  = length(X)-1;
      V=[zeros(n^2,1)];         %Creamos una columna de 0 para los coeficientes independientes
      Z = zeros(length(V));     %Matriz cuadratica de 0 de longitud V
      j=1; 
      f=1; 
      
      %Llenamos la Matriz para hallar los coeficientes  Z
      
        for i=2:2:2*n  
          Z(i,f:f+2) = [X(j)^2 X(j) 1]; % Operaciones para crear la matriz de coeficientes
          V(i) = Y(j);                  % Se rellena la Matriz de Coeficientes independients
          j = j+1; 
          Z(i+1,f:f+2) = [X(j)^2 X(j) 1];
          V(i+1) = Y(j);
          f =  f+3;
        end
      
      %Comprobamos la continuidad de los nodos interiores y agregamos a la Matriz Z
      j=1;
      x=2;
      
        for i=2*n+2:3*n  
          Z(i,j:j+1) = [2*X(x) 1];
          Z(i,j+3:j+4) = [-2*X(x) -1];
          j = j+3;
          x = x+1;
        end
      
      % Ajustamos el valor de la matriz de la columna 1; fila 1,  para el valor a1=0
        Z(1,1) = (1);
        c = Z\V;   %Se resuelve la Matriz Aumentada para obtener los coeficientes
        
         for i=1:n
          splines = c(j)*(x.^2) + c(j+1)*x + c(j+2);
         end
    else
      error('Vectores inconsistentes');
    end
  else
    error('Argumentos insuficientes');
  end
endfunction

