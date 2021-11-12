%Autores: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%Fecha: Cuenca, Noviembre de 2021

%DESCRIPCION
%Algoritmo que permite general un modelo de regresión lineal (ecuacion de la recta)
%la cual nos permite explicar la relación lineal que existe entre dos
%variables. Siendo Y la variable dependiente y X la variable independiente.

%EJEMPLO
%Predecir el comportamiemto de mediciones de temperatura, las cuales vieien
%dadas en varios puntos (mediciones) a traves del tiempo. Mediante regresion
%lineal, determinar la tendencia que las mediciones siguen.

clc,clear;

try

##    Ejemplo 2
##    X=[1 2 3 4 5 6 7 8 9 10];%t=horas
##    Y=[18 12 8 15 10 13 7 9 16 6];%T=°C

##    Ejemplo 1: Mediciones en el Cajas
    X=[1 2 3 4 5 6 7];%t=horas
    Y=[0.5 2.5 2.0 4.0 3.5 6.0 5.5];%T=°C

    %Llamada a la funcion
    [sr,recta ] = regresion_lineal( X,Y );
    
    fprintf('Suma del Residuo calculado: %f',sr);
    
    %Grafico
    subplot(2,2,1);
    scatter(X,Y,'*')
    title('Regresion Lineal')

    hold on 
    plot(X,recta)
    legend('Datos medidos','Ecuacion de la recta')
    xlabel('Puntos de X')
    ylabel('Puntos de Y')
    hold off
    
catch err
    fprintf('Error: %s/n',err.message);
end


