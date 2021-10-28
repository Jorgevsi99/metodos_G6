##ELIMINACIONGAUSSPIVP
##  ELIMINACIONGAUSSPIVP(A,B)
##    [matrizCompleta,pasos,resultados]=ElimiacionGaussPivP(A,B)
##    Se envian al main los siguientes datos:
##    -Matriz completa
##    -La matriz de los pasos
##    -El vector de las soluciones.


function [matrizCompleta,pasos,resultados]= ElimiacionGaussPivP(A,b)
format short #Para que las numeros no se muestren muy grandes


#Verificacion de matrices                 
    if size(A,1) ~= size(A,2)  #comparando el número de filas con el número de columnas
        error('Se necesita que la matriz A sea cuadrada');
        
    elseif size(b,2) ~= 1  #comprueba si el vector B tiene mas de una columna
        error('B debe ser un vector columna');
        
    elseif size(A,1) ~= size(b,1) #Comprueba si el numero de filas de A es igual a de B
        error('El numero de filas de A no coincide con el de B. Sistema inconsistente');
    end
    
if prod(diag(A)) == 0  #si el determinante=0 no se puede resolver el sistema
    error('El determinante de la matriz A es cero, no se puede resolver');
end

#---------------- Union y impresion de matriz completa--------------- 

#Obtenemos el tamaño de la matriz
[n,m]=size(A);
#Para imprimir 
t = ' | '; 
f=char(25);
T = repmat(t,n,1);
F = repmat(f,1,n);


C=[A,b];
matrizCompleta=C;
c=num2str(C);
pasos=[c];
# la matriz C, representa la forma de la matriz aumentada [Ab]


    for k=1:(n-1)
 
        mayor=0; %asigna como cero el numero mayor de la fila
        filam=k; %asigna la fila k como la columna que tiene el numero mayor
        for p=k:n
            if mayor<abs(C(p,k)) %se busca el numero mayor en la fila K;
                mayor=abs(C(p,k));%cambio de mayor
                filam=p; %cambio de fila
            end
        end
        if mayor ==0
            error('El sistema tiene infinitas soluciones')
             %se interrumpe el programa con la instruccion error
        else
            if filam ~= k 
            for j=1:(n+1)
                aux=C(k,j); %para poder intercambiar las filas, utilizamos una
                            %variable auxiliar
                C(k,j)=C(filam,j);
                C(filam,j)=aux;
            end

            end
        end 
          #guardamos en pasos la matriz actual       
         c=num2str(C);
         pasos=[pasos;F;c];
         for i=(k+1):n
            m(i,k)=C(i,k)/C(k,k); %formula multiplicadores


            for j=k:(n+1)
                C(i,j)= C(i,j) - m(i,k)*C(k,j);%formula nueva fila
            end
         end
         #guardamos en pasos la matriz actual    
         c=num2str(C);
         pasos=[pasos;F;c];
    end
         
#-----Aplicamos sustitucion hacia atras para encontrar el valor de las incognitas
         for i=n:-1:1
            suma=0;
               for p=(i+1):n
                suma = suma + C(i,p)*X(p);
               end
            X(i)=(C(i,n+1)-suma)/C(i,i);
            
         end

resultados=X';
       
            
        
               