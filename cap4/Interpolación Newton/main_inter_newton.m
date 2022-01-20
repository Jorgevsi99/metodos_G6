%Autores: Christian Mar�n, Jorge S�nchez, Anthony Uquillas
%Fecha: Noviembre de 2020.
%
%DESCRIPCION:
%Es un m�todo de interpolaci�n polin�mica. Aunque solo existe un �nico
%polinomio que interpola una serie de puntos, existen diferentes formas de
%calcularlo. Este m�todo es �til para situaciones que requieran un n�mero
%bajo de puntos para interpolar, ya que a medida que crece el n�mero de
%puntos, tambi�n lo hace el grado del polinomio.

clc;clear;

%Un circuito RLC presenta ciertas anomalias en su funcionamiento al
%momento de recibir voltaje a la entrada. Se desea obtener una curva
%referencial del comportamiento del mismo en base a ciertos datos medidos,
%con el fin de determinar y solucionar las fallas en el mismo:

%Ejemplo 1
##X=[1 2 4 8];
##Y=[50 80 40 20];

%Ejemplo 2
X=[-7 -1 1 3 5 6];
Y=[-127 -1 -7 -37 -127 -91];

try
    [ b,ecuacion,polinomio ] = inter_newton(X,Y);
    
    fprintf('\nTabla de diferencias:\n\n');
    display(b)
    
    %Manipulacion de string para presentacion
    newstr=erase(polinomio,'.*');
    newstr=strrep(newstr,'+',' + ');
    newstr=strrep(newstr,'-',' - ');
    
    polinomio=newstr;
    display(polinomio)
    
    fprintf('\n');
    
    % Gr�fico
    
    puntos=X(1):0.001:X(length(X));%rango de valores en X
    scatter(X,Y,'r')%muestras iniciales
    hold on
    grid on
    plot(puntos,ecuacion(puntos),'b','LineWidth',2)%Grafica del polinomio
    xlabel('Voltaje (V)')
    ylabel('Corriente (mA)')
    legend('Muestras','Interpolacion de Newton')
    
catch err
    fprintf('Error: %s/n',err.message);  
end

