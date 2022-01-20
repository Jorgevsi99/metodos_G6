%Autores:Claudia Padilla, Justin Picón, Samantha Zaruma
%Fecha: Cuenca, 3 de diciembre de 2020.
%Funcion que calculara la suma de los residuos cuadrados en cada X(i) e Y(i)
%lo cual nos servira como parte fundamental para calcular el error estandar

%Parametros de entrada
%X:conjunto de valores que estan representados por la variable independiente
%Y:conjunto de valores que estan representados por la variable dependiente 
%C: vector solucion del metodo de Gauss Jordan
%m: grado del polinomio

%Parametros de salida
%Sr:suma de los residuos cuadrados
%S:error parcial del metodo

function [ Sr,S ] = error_estandar( X,Y,C,m )
if nargin == 4
    Sr=0;%inicializando contador
    n=length(X); %cantidad de datos obtenidos en el vector X
    n1=length(Y); %cantidad de datos obtenidos en el vector X
    if n==n1
        for i=1:n %bucle para evaluar la ecuacion de Sr
            cont=0; %inicializando contador
            for j=1:m+1
                cont=cont+(C(j)*(X(i))^(j-1)); %calculo de los termino de Sr
            end
            Sr=Sr+(Y(i)-cont)^2; %valor calculado de Sr
        end
        S=(Sr/(n-m-1))^(1/2); %ecuacion para calcular el error parcial
    else
        error('Vectores Inconsistentes');
    end
else
    error('Argumentos Insuficientes');
end
end

