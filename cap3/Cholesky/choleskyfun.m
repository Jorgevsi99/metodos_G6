function [C, L, u, z, x, n]=choleskyfun(A,b)

%--------------------- Manejo de errores ------------------------%
%Si se ingresan todos los datos de entrada                     
    if size(A,1) ~= size(A,2)  #comparando el número de filas con el número de columnas
        error('Se necesita que la matriz A sea cuadrada')
        
    elseif size(b,2) ~= 1  #comprueba si el vector B tiene mas de una columna
        error('B debe ser un vector columna');
        
    elseif size(A,1) ~= size(b,1) #Comprueba si el numero de filas de A es igual a de B
        error('El numero de filas de A no coincide con el de B. Sistema inconsistente');
    end

disp(newline); #salto de linea
if prod(diag(A)) == 0  #si el determinante=0 no se puede resolver el sistema
    error('El determinante de la matriz A es cero, no se puede resolver');
end
   
   
#---------------- Union y impresion de matriz completa---------------   
[n,m]=size(A);
C=[A,b];
% la matriz C, representa la forma de la matriz aumentada [Ab]
#disp(C);

%---------------------- Metodo ----------------------------------------------%
if n==m    
    for k=1:n
      %La instrucción iterativa for permite repetir estamentos a un
      %numero específico de veces  
        suma1=0;
        for p=1:k-1
            suma1=suma1+L(k,p)*u(p,k);
        end
        L(k,k)=sqrt(A(k,k)-suma1);
        u(k,k)=L(k,k); %princio del metodo
        for i=k+1:n
            suma2=0;
            for q=1:k-1
                suma2=suma2+L(i,q)*u(q,k);
            end
            L(i,k)=(A(i,k)-suma2)/L(k,k); %obtencion de la matriz L          
        end
        #MatrizL = num2str(L);
        for j=k+1:n
            suma3=0;
            for r=1:k-1
                suma3=suma3+L(k,r)*u(r,j);
            end
            u(k,j)=(A(k,j)-suma3)/L(k,k); %obtencion de la matriz U
        end
        #MatrizU = num2str(L);
    end
    producto=det(L)*det(u) %calculo del determinante
    
    if producto~=0
        for i=1:n
            suma=0;
            for p=1:i-1
                suma=suma+L(i,p)*z(p);
            end
            z(i)=(b(i)-suma)/L(i,i); %obtencion del vector Z
        end
        
        #VectorZ = num2str(z);
        for i=n:-1:1
            suma=0;
            for p=i+1:n
                suma = suma+u(i,p)*x(p);
            end
            x(i)=(z(i)-suma)/u(i,i); % solucion, calculos de las variables
        end 
      #Resultados = x';  
    else
        fprintf('\nEl determinante es igual a cero, por lo tanto el sistema tiene infinita o ninguna solucion\n')
    end
end

