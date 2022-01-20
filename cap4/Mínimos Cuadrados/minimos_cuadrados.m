%Autores: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%Fecha: Cuenca, Noviembre de 2021

%Funcion minimos cuadrados: la cual permite el ingreso de dos vectores los
%cuales contienen n valores respectivamente y lo que se busca es encontrar
%una relacion lineal entre ellos, por lo cual intentamos aproximar a una
%ecuacion de recta encontrando los coeficientes que estaran dentro del
%vector C la ecuacion de la recta repreentada por la variable recta y el
%residuo que hay al tener un valor medido y un valor calculado.

%MINIMOS_CUADRADOS
  %MINIMOS_CUADRADOS(X,Y)
    %[ C,recta] = minimos_cuadrados( X,Y )
    %X = conjunto de valores que estan representados por la variable independiente
    %Y = conjunto de valores que estan representados por la variable dependiente
    %C= vector que contiene los coeficientes de la ecuacion de la recta
    %recta=ecuacion de la recta evaluada con los coeficientes en C


function [ C,recta] = minimos_cuadrados( X,Y )
if nargin == 2
  
    n=length(X);
    n1=length(Y);
    
    if n==n1
        
        x=0; 
        y=0;
        x2=0;
        y2=0;
        mult=0;
        
        %bucle para recorrer los vectores X e Y posicion por posicion
        for i=1:n
          
            %almacenar en memoria
            aux1=X(i);
            aux2=Y(i);
            
            %contadores
            x=x+aux1;
            y=y+aux2;
            x2=x2+aux1^2;
            y2=y2+aux2^2;
            mult=mult+aux1*aux2;
            
            %Promedios
            x_prom=x/n;
            y_prom=y/n;
            
            %Coeficientes a1 & a0
            a1=(n*mult-x*y)/(n*x2-x^2);
            a0=y_prom-a1*x_prom;
            
            C=[a1 a0]; %calculo del coeficiente a1 que corresponde al coeficiente de la variable x
            recta=polyval(C,X); %ecuacion de la recta evaluada
        end
    else
        error('Vectores Inconsistentes');
    end
else
    error('Argumentos Insuficientes');
end
end
