%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%DESCRIPCION
%Algoritmo que permite generar un modelo de linealizacion para los modelos no lineales 
%los cuales se pueden expresar entres tipos: exponencial, potencial y tasa_crecimiento que haciendo un ajusta a las 
%ecuaciones que rigen cada caso se convertirian en regresión lineal  y luego con sus respectivas transformaciones a los coeficientes de 
%sus ecuaciones dee recta se llegaria a sus coeficientes beta y alffa correspondientes en cada caso.

%A continuacion se presenta algunos ejemplos para poder comprobar que el
%algoritmo funciona correctamente
clc,clear;
try
##    Ejemplo 1
##    X=[1 2 3 4 5 ];
##    Y=[0.5 1.7 3.4 5.7 8.4];

##    Ejemplo 2
    X=[2.5 3.5 5 6 8.5 10 12.5 15 17.5 20];
    Y=[13 11 8.5 8.2 7 6.2 5.2 4.8 4.6 4.3];

    %Ajuste exponencial
    fprintf('\nAjuste Exponencial:\n');
    [C,a,b,ecuacion1] = ecuacion_exponencial( X,Y );
    display(C); %coeficientes de la linealizacion
    display(a); %valor de alpha_1
    display(b); %valor de beta_1
    
    %Ajuste potencial
    fprintf('\nAjuste de Potencia:\n');
    [C2,a2,b2,ecuacion2] = ecuacion_potencias( X,Y );
    display(C2); %coeficientes de la linealizacion
    display(a2); %valor de alpha_2 calculado
    display(b2); %valor de beta_2 calculado

    %Ajuste de razon_crecimiento
    fprintf('\nAjuste de Razón de Crecimiento:\n');
    [ C3,a3,b3,ecuacion3 ] = razon_crecimiento( X,Y );
    display(C3); %coeficientes de la linealizacion
    display(a3); %valor de alpha_3 calculado
    display(b3); %valor de beta_3 calculado

catch err
    fprintf('Error: %s/n',err.message);
end

%Muestras 3 graficas las cuales hacen la comparacion del Y medido con el Y
%calculado en cada modelo

%Ajuste exponencial
subplot(2,2,1);
scatter(X,Y,'*')
title('Ajuste exponencial')

hold on 
plot(X,ecuacion1)
legend('Datos medidos','Recta con Ajuste Exponencial')
xlabel('X')
ylabel('Y')
hold off

%Ajuste potencial
subplot(2,2,2);
scatter(X,Y,'*')
title('Ajuste potencial')

hold on 
plot(X,ecuacion2)
legend('Datos medidos','Recta con Ajuste de Potencias')
xlabel('X')
ylabel('Y')
hold off

%Ajuste razon de crecimiento
subplot(2,2,3);
scatter(X,Y,'*')
title('Ajuste tasa de crecimiento')

hold on 
plot(X,ecuacion3)
legend('Datos medidos','Recta de con Ajuste de Razon de Crecimiento')
xlabel('X')
ylabel('Y')
hold off