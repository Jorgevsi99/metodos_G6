%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2020.

%DESCRIPCION:
%Implementacion del Algoritmo de Regresion Polinomial el cual consiste en
%encontrar una ecuacion polinomica la cual relacione las variable X(variable independiente)
% y Y(variable dependiente), tambien se busca conseguir la aproximacion mas
% cercana a la expresion medida Y y calcular el error cometido teniendo en
% cuenta el grado del polinomio calculado para saber el que mejor se llega
% a ajustar a los datos.

clc;clear;

%Un circuito RLC presenta ciertas anomalias en su funcionamiento al
%momento de recibir voltaje a la entrada. Se desea obtener una curva
%referencial del comportamiento del mismo en base a ciertos datos medidos,
%con el fin de determinar y solucionar las fallas en el mismo:

% Ejemplo 1
X=[0 1 2 3 4 5];
Y=[2.1 7.7 13.6 27.2 40.9 61.1];
m=2;

% Ejemplo 2
##X=[3 4 5 7 8 9 11 12];
##Y=[1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];
##m=3;

try
    [A,b,C,Sr,S,polinomio,reg] = regresion_polinomial(X,Y,m);%calcula la matriz de coeficientes a_m+1 y el vector de terminos independientes
    fprintf('Matriz de coeficientes: ');
    display(A);
    fprintf('Vector de términos independientes: ');
    display(b);
    fprintf('Coeficientes del polinomio: ');
    display(C);
    fprintf('Suma de cuadrados: ');
    display(Sr);
    fprintf('\nError Parcial: ');
    display(S);
    fprintf('\n');
    
    polinomio=strrep(polinomio,'.*','*');
    polinomio=strrep(polinomio,'.^','^');
        
    display(polinomio);
    
    % Gráfico
    scatter(X,Y,'r')
    hold on
    grid on
    
    puntos=X(1):0.001:X(length(X));
    plot(puntos,reg(puntos),'b','LineWidth',2)
    xlabel('Voltaje (V)')
    ylabel('Corriente (mA)')
    legend('Muestras','Funcion hallada')
    
catch err
    fprintf('Error: %s/n',err.message); 
end

