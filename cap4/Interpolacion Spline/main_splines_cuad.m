%Autores: Cristian Marín, Jorge Sánchez, Antony Uquillas
%Fecha: Noviembre de 2021.

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
##x=[-7 -1 1 3 5 6];
##y=[-127 -1 -7 -37 -127 -91];


try
      [c,x,n] = Spline_Cuad(X,Y);
      display(c)
      figure(1)
      j=1;
      hold on;
      scatter(X,Y,'r','DisplayName', 'Muestras')
      grid on;
      xlim([min(X)-2 max(X)+2]);
      ylim([min(Y)-2 max(Y)+2]);
      
      for i=1:n
        curve=@(x) c(j)*(x.^2) + c(j+1)*x + c(j+2);
        ezplot(curve,[X(i),X(i+1)]);
        hndl=get(gca,'Children');
        set(hndl,'LineWidth',2,'DisplayName', strcat('f',num2str(i)));
        legend('show')
        hold on
        j=j+3;
      end
      
  %leyendas de la grafica
  title('Interpolacion Spline')
  xlabel('Voltaje (V)')
  ylabel('Corriente (mA)')
catch err
    fprintf('Error: %s/n',err.message);
end

fprintf('-------------------------------------------------------------------\n')


