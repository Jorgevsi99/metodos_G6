function [matrizCompleta,pasos,matrizOrdenada,resultados] = MetodoGaussJordan(A,B)
% ESTA FUNCION PIDE LOS SIGUIENTES DATOS DE ENTRADA:

% A = matriz cuadrada de coeficientes del sistema de ecuaciones.
% B = Vector columna de resultados de cada ecuación.

% VARIABLES DE SALIDA:

% Resultados = regresa los valores soliciones del sistemas.
% matrizCompleta = regresa la matriz unida.
% pasos = iteraciones de los diferentes pasos del metodo.

%--------------------- Manejo de errores ------------------------%
%Si se ingresan todos los datos de entrada                     
    if size(A,1) ~= size(A,2)  #comparando el número de filas con el número de columnas
        error('Se necesita que la matriz A sea cuadrada')
        
    elseif size(B,2) ~= 1  #comprueba si el vector B tiene mas de una columna
        error('B debe ser un vector columna');
        
    elseif size(A,1) ~= size(B,1) #Comprueba si el numero de filas de A es igual a de B
        error('El numero de filas de A no coincide con el de B. Sistema inconsistente');
    end

disp(newline); #salto de linea
if prod(diag(A)) == 0  #si el determinante=0 no se puede resolver el sistema
    error('El determinante de la matriz A es cero, no se puede resolver');
end
   
#---------------- Union y impresion de matriz completa---------------

#Obtenemos el tamaño de la matriz
n = size(A,1);
#Para imprimir 
t = ' | ';
#Para mostrar las flechas 
f=char(25);
T = repmat(t,n,1);
#Creamos un vector horizontal de flechas
F = repmat(f,1,n);
#Unimos las matrices en una sola
a = num2str(A);
b = num2str(B);
c = [a T b]; 
matrizCompleta=[c]; #la matriz c se va a guardar en la matriz completa para retornar
pasos=[c];

%--------------------------- Pivoteo parcial -----------------------------%

for k = 1:n
    if A(k,k) ~= max(abs(A(:,k)))
        [filapivote,~] = find(abs(A) == max(abs(A(:,k))));
        A([k,filapivote(1)],:) = A([filapivote(1),k],:);
        B([k,filapivote(1)]) = B([filapivote(1),k]);
    end
end
c = [num2str(A), T, num2str(B)]; %%unión de los datos en una solo matriz
matrizOrdenada =[c];

%--------------------------------- Gauss-Jordan ----------------------------%

j = 1;
for k = 1:n
    if A(k,k) ~= 1 % si el elemento i,i de la diagonal es diferente de 1
        B(k) = B(k)/A(k,k);
        A(k,:) = A(k,:)./A(k,k);
        c = [num2str(A), T, num2str(B)]; %%unión de los datos en una solo matriz
        pasos = [pasos; F; c]; 
        j = j+1;
    end
    
    for i = 1:n
        if i ~= k
            factor = A(i,k)/A(k,k);
            A(i,:) = A(i,:) - factor*A(k,:);
            B(i) = B(i) - factor*B(k);
            c = [num2str(A), T, num2str(B)]; %%unión de los datos en una solo matriz
            pasos = [pasos; F; c];
            j = j+1;
        end
    end
    x = B;
    resultados = x;
end