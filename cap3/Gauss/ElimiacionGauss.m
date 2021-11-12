##ELIMINACIONGAUSS
##  ELIMINACIONGAUSS(A,B)
##    [matrizCompleta,pasos,resultados]=ElimiacionGaussPivP(A,B)
##    Se envian al main los siguientes datos:
##    -Matriz completa
##    -La matriz de los pasos
##    -El vector de las soluciones.

function [matrizCompleta,pasos,resultados]= ElimiacionGauss(A,B)   #creamos la funcion y le recibe los parametros A,B

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

#---------Aplicamos eliminacion hacia delante--------

j = 1;
#Recorremos desde 1 hasta la dimencion de la matriz menos 1
for k = 1:n - 1

    for i = k + 1:n

        factor = A(i,k)/A(k,k);
        A(i,:) = A(i,:) - factor*A(k,:);
        B(i) = B(i) - factor*B(k);
        #Unimos en una sola matriz
        c = [num2str(A), T, num2str(B)];
        j = j+1;
    end
        pasos=[pasos;F;c];
end


#-----Aplicamos sustitucion hacia atras para encontrar el valor de las incognitas

x(n) = B(n)/A(n,n);
for i = n - 1:-1:1
    sum = B(i);
    for j = i + 1:n
        sum = sum - A(i,j)*x(j); #modificamos el valor del resultado
    end
    x(i) = sum/A(i,i);
end
resultados = x';




