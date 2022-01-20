%Autores:Claudia Padilla, Justin Picón, Samantha Zaruma
%Fecha: Cuenca, 3 de diciembre de 2020.

%Funcion gauss_jordan la cual realiza el proceso de encontrar las soluciones de un sistemas de ecuaciones
%por el metodo de Gauus Jordan y tiene los siguientes parametros de entrada

%A= matriz de sistema de ecuaciones
%b=vector de terminos independientes
%Y tiene como salida:
%x=vector solucion
%A=matriz escalonada

function [C] = gauss_jordan(A,b)
if nargin == 2
    [m,n]=size(A);%tamanio de la matriz A
    if m==n
        A=[A b]; %concatenacion de la matriz A y el vector de terminos indeendientes
        for i=1:n %bucle que va a recorrer las filas de la matriz
            for k=[1:i-1,i+1:n] %bucle que va a recorrer desde 1 hasta antes de la fila pivote y  despues de la fila pivote hasta el final
                m=-A(k,i)/A(i,i); %factor de multiplicacion al pivote tal que al sumarlo a k haga ceros a la columna que necesita
                A(k,:)=A(k,:)+m*A(i,:); %actualizar a la fila k con el valor de k mas el factor de multiplicacion multiplicado por la fila pivote 
            end   
        end
        C=A(:,n+1)./diag(A);%calclo del vector solucion 
    else
        error('La matriz debe ser cuadrada');
    end
else
    error('Argumentos Insuficientes');
end

