%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%Funcion de la Interpolacion de Lagrange, que encuentra los coeficientes
%de un polinomio, como la aproximacion de la relacion de los vectores x e y.

%Inputs
%X: datos tabulados
%Y: datos tabulados
%xi: dato que queremos interpolar

%Outputs
%p=polinomio de lagrange

function [p] = inter_lagrange( X,Y )
  
if nargin == 2 %Se verifican los errores el método
  
    n=length(X);
    m=length(Y);
    
    if n==m
      
        %inicializacion (polinomio)
        p=0;
        %variable simbólica
        syms x;

        for i=1:n
            %L=f(xi) 
            L=Y(i);%facilita el calculo del producto Li(x)f(xi)
            
            for j=1:n
              %Condicion del productivo: i=0 --> j!=i
                if j!=i
                    %Producto Li(x)f(xi)
                    L=L*(x-X(j))/(X(i)-X(j));
                end    
            end 
            %polinomio de Lagrange
            %Pn(x)=sum(Li(x)f(xi))
            p=p+L;
        end
                        
    else 
        error("Vectores Inconsistentes");
    end
else 
    error("Argumentos Insuficientes");
end
end

