%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2020.
%
%REGRESION_POLINOMIAL la cual permite el ingreso de dos vectores los
%cuales contienen n valores respectivamente y lo que se busca es encontrar
%una relacionl entre ellos, por lo cual intentamos aproximar a una
%ecuacion polinomial encontrando los coeficientes que estaran dentro del
%de la ecuacion polinomial pero para eso primero encontraremos una matriz cuadrada la cual esta
%formada por un sistema de ecuaciones que tiene como icognitas los coeficientes de la ecuacion 
%polinomial, es justamente lo que obtendermos en esta funcion para luego
%calcular por Gauus-Jordan los coeficientes de la ecuacion y de igual
%manera calcular el error parcial en otra funcion 
%
%Inputs
%X= conjunto de valores que estan representados por la variable independiente
%Y=conjunto de valores que estan representados por la variable dependiente
%m=grado del polinomio a calcular
%
%Outputs
%A: matriz de orden m+1 la cual contiene un sistema de ecuaciones que tienen
%como incognitas los coeficientes de la ecuacion polinomial
%b: vector de terminos independientes
%C: coeficientes del polinomio
%Sr: resto de cuadrados
%S: error parcial
%polinomio: polinomio de grado m calculado

function [A,b,C,Sr,S,polinomio,reg] = regresion_polinomial(X,Y,m)

if nargin >= 3
    n=length(X); %cantidad de datos obtenidos en el vector X
    n1=length(Y); %cantidad de datos obtenidos en el vector X
    if n == n1
        A=zeros(m+1); %definiendo matriz
        b=zeros(m+1,1); %definiendo vector
        %bucles para llenar la matriz A y el vector b
        for i=1:m+1 
            for j=1:m+1
                %inicializando contadores
                x=0; 
                mult=0; 
                for k=1:n %bucle para realizar la sumatoria
                    %calculo de los coeficientes de la matria A en las posiciones
                    %i,j y del vector b en (i,1)
                    aux1=(X(k))^(j-2+i); 
                    x=x+aux1;
                    aux2=(X(k))^(i-1);
                    mult=mult+(aux2*Y(k));
                end
                A(i,j)=x; %almacenar valor calculado en cada posicion
            end
            b(i,1)=mult; %almacenar el valor calculado de la posicion respectiva del vector b
        end
        [C]=gauss_jordan(A,b); %calcula los coeficientes del polinomio
        [Sr,S]=error_estandar(X,Y,C,m); %funcion que muestra la suma del resto de cuadrados y el error parcial
        
        %construccion del polinomio
        reg_str1=num2str(C(1));%Primer valor del polinomio
        reg_str2='';
        for i=2:length(C)
            temp=strcat(num2str(C(i)),'.*x.^(',num2str(i-1),')');
            reg_str2=strcat(reg_str2,'+(',temp,')');
        end
        
        %Aclaracion de variable simbolica
        reg_str1=strcat('@(x)',reg_str2);
        reg_final=reg_str1;
        polinomio=reg_final(5:end);
        reg=str2func(reg_final);
        
    else
        error('Vectores Inconsistentes');
    end 
else 
    error('Argumentos Insuficientes');
end    
    

