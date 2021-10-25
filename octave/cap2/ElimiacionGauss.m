#eliminacion de Gauss

function x = ElimiacionGauss(A,B)   #creamos la funcion y le recibe los parametros A,B
  
#Validacion de entrada de datos

##if nargin ~= 2                 
##    error('Se debe ingresar una matriz cuadrada A y un vector columna B');
##    
##%Si se ingresan todos los datos de entrada
##else                          
##    if size(A,1) ~= size(A,2)
##        error('Se necesita que la matriz A sea cuadrada')
##    elseif size(B,2) ~= 1
##        error('B debe ser un vector columna');
##    elseif size(A,1) ~= size(B,1)
##        error('El numero de filas de A no coincide con el de B. Sistema inconsistente');
##    end
##end
##
##disp(newline);
##if prod(diag(A)) == 0
##    error('El determinante de la matriz A es cero, no se puede resolver');
##end


#---------------- Union y impresion de matriz completa--------------- 

#Obtenemos el valor de la matriz
n = size(A,1);
#Para imprimir 
t = ' | '; 
T = repmat(t,n,1);
#Unimos las matrices en una sola
a = num2str(A); b = num2str(B); c = [a T b]; 
#Imprimir la matriz completa
disp('Matriz completa'); 
disp(c); 
disp(newline);


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
        #Imprimimos
        disp(['Paso ',num2str(j)]); disp(c); disp(newline);
        j = j+1;
    end
end


#-----Aplicamos sustitucion hacia atras para encontrar el valor de las incognitas

x(n) = B(n)/A(n,n);
for i = n - 1:-1:1
    sum = B(i);
    for j = i + 1:n
        sum = sum - A(i,j)*x(j);
    end
    x(i) = sum/A(i,i);
end
x = x';

#--------Imprimimos los resultados

disp('Resultados');
for i = 1:n
    fprintf('x%d = %f',i,x(i));
    fprintf('\n');
end

