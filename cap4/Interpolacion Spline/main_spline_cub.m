%Autores: Cristian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2021.

%DESCRIPCION
%Algoritmo que simula la Interpolacion de Spline la cual consiste en un
%procedimiento alternativo que consiste en colocar polinomios conectores
%de grado inferior (splines) en subconjuntos de los puntos asociados con datos

%Un circuito RLC presenta ciertas anomalias en su funcionamiento al
%momento de recibir voltaje a la entrada. Se desea obtener una curva
%referencial del comportamiento del mismo en base a ciertos datos medidos,
%con el fin de determinar y solucionar las fallas en el mismo:

clc,clear;

%Ejemplo 1
X=[1 2 4 8];
Y=[50 80 40 20];

%Ejemplo 2
##X=[-7 -1 1 3 5 6];
##Y=[-127 -1 -7 -37 -127 -91];

try     
    [c,h] = Spline_Cub(X,Y);
    
    %Construccion de los polinomios 
    n=length(X);
    n1=length(Y);
    
    display('Matriz de coeficientes: ');
    display(c);
    fprintf('\nPolinomios:\n\n');
    
    for j=1:n-1
        for i=1:4
            s(i)=c(j,i);
        end
        pol=(strcat('p',num2str(j),' =',polyout(s,'x'), ' /:', num2str(X(j)), '<', num2str(X(j+1))));
        display(pol);
        fprintf('\n');
    end
    
    %Representacion grafica de los polinomios
    cmap = hsv(6);
    for i=1:n-1
        scatter(X,Y,'r', 'DisplayName', 'Muestras')
        grid on
        hold all        
        t(i,:)=X(i):0.01*h(i):X(i+1);
        p(i,:)=c(i,1).*(t(i,:).^3)+c(i,2).*(t(i,:).^2)+c(i,3).*t(i,:)+c(i,4);
        plot(t(i,:),p(i,:),'Color', cmap(i,:), 'DisplayName', strcat('f',num2str(i)))
        legend('show')
    end
      
    %leyendas de la grafica
    title('Interpolacion Spline')
    xlabel('Voltaje (V)')
    ylabel('Corriente (mA)')
        
catch err
    fprintf('Error: %s/n',err.message);
end