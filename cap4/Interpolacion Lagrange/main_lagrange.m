%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%DESCRIPCION
%Algoritmo que simula la Interpolacion de Lagrange, método que consiste en
%una reformulacion de la interpolacion de Newton, la cual evita el cálculo
%de las diferencias divididas y tolera las diferencias entre las distancias
%x entre puntos.

clc,clear;

%Un circuito RLC presenta ciertas anomalias en su funcionamiento al
%momento de recibir voltaje a la entrada. Se desea obtener una curva
%referencial del comportamiento del mismo en base a ciertos datos medidos,
%con el fin de determinar y solucionar las fallas en el mismo:

try 
    %Ejemplo 1
##    X=[1 2 4 8];
##    Y=[5 8 4 2];

    %Ejemplo 2
    X=[-7 -1 1 3 5 6];
    Y=[-127 -1 -7 -37 -127 -91];

    [p] = inter_lagrange( X,Y );
    display(p);
    %polinomio simplificado
    p=simplify(p);
    display('Polinomio de Lagrange simplificado:')
    display(p)
    
    %Grafico
    scatter(X,Y,'r')%muestras iniciales
    grid on;
    hold on;
    ezplot(p,[X(1),X(length(X))])%plot de funcion syms
    title('Interpolacion de Lagrange')
    xlabel('Voltaje (V)')
    ylabel('Corriente (mA)')
    legend('Muestras','Interpolacion de Lagrange')
    
catch err
    fprintf('Error: %s/n',err.message); 
end