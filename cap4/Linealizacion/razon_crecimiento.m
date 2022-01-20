%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%Funcion razon_crecimiento: la cual permite el ingreso de dos vectores los
%cuales contienen n valores respectivamente y lo que se busca es encontrar
%una relacion lineal entre ellos, por lo cual intentamos aproximar a una
%ecuacion de recta encontrando los coeficientes que estaran dentro del
%vector C la ecuacion de la recta y en base a esos coeficientes que son los
%que corresponden al modelo de linealizacion convertir mediante artificios
%matematicos a los coeficientes de la ecuacion del modelo exponencial y
%esto evaluar con los puntos del vector X para ver su grafica y evaluar la
%comparacion entre el Y medido y nuestro Y calculado y ver con las dos
%graficas siguientes que modelo se ajusta mejor a las condiciones dadas 

%Parametros de entrada 
%X= conjunto de valores que estan representados por la variable independiente
%Y=conjunto de valores que estan representados por la variable dependiente

%Parametro de salida
%C3= vector que contiene los coeficientes de la ecuacion de la recta
%a3=coeficiente de la ecuacion exponencial el cual multiplica al exponente
%b3=coeficiente de la ecuacion exponencial el cual es la potencia junto
%con x del exponencial.
%ecuacion1=ecuacion exponencial evaluada con los coeficientes a3 y b3 encontrados
%mediante los coeficientes lineales a1 y a0.

function [ C3,a3,b3,ecuacion3 ] = razon_crecimiento( X,Y )
if nargin == 2
    n=length(X);
    n1=length(Y);
    if n==n1
        %contadores
        x=0; 
        y=0;
        x2=0;
        y2=0;
        mult=0;

        %bucle para recorrer los vectores X e Y posicion por posicion
        for i=1:n
          %Estados y contadores al momento
            aux1=1/(X(i));
            aux2=1/(Y(i));
            x=x+aux1; %x_i
            y=y+aux2; %y_i
            x2=x2+aux1^2; %contador de x_i^2
            y2=y2+aux2^2; %contador de y_i^2
            mult=mult+aux1*aux2; %contador de x_i*y_i
        end
        
        %Promedios
        x_prom=x/n;
        y_prom=y/n;
        
        %Coeficientes a_1 ^ a_0
        a1=(n*mult-x*y)/(n*x2-x^2);
        a0=y_prom-a1*x_prom; %corresponde al termino independiente
        
        
        C3=[a1 a0]; %calculo que corresponde al coeficiente de la variable x
        a3=1/C3(2);%coeficiente alpha_3 de la ecuacion3
        b3=a3*C3(1);%constante beta de la ecuacion3
        ecuacion3=(a3*X)./(b3+X);%ecuacion de razon de crecimiento.
        
    else
        error('Vectores inconsistentes');
    end
else
    error('Argumentos Insuficientes');
end    
end

