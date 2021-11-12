##INVER
##  INVER(A,B)
##    [a,y,pasos,inversa]=inver(A,B)
##    a = Matriz Aumentada para calcular la iversa
##    y = Matriz Identidad de tamaño n
##    inversa = Matriz inversa
##    pasos = step-by-step del metodo

function [a,y,pasos,inversa]=inver(A,B)

  #Verificacion de matrices                 
    if size(A,1) ~= size(A,2)  #comparando el número de filas con el número de columnas
        error('Se necesita que la matriz X sea cuadrada');
    end

  n = size(A,1); % Tamaño de la matriz
  y = eye(n);% Matriz Identidad de tamaño n
  a = [A y]; %Matriz Aumentada para calcular la iversa
  pasos=[];
  inversa=[];
  
  %Se realiza las operaciones pertinentes para calcular la matriz aumentada
  
  %Escribir la matriz y adjuntar a su derecha la matriz identidad de tamano n
  for k=1:n
    a(k,:)=a(k,:)/a(k,k);
      
    for j=k+1:n
      a(j,:)=a(j,:)-a(k,:)*a(j,k);
      j=j+1;
    end
    
    k=k+1;
  end
  %Se realizan las transformaciones de Gauss de forma sucesiva hasta conseguir
  %que la matriz identidad quede a la izquierda.
  for k=n:-1:2
    
    for j=k-1:-1:1
      a(j,:)=a(j,:)-a(k,:)*a(j,k);
      j=j-1;
    end
    
    k=k-1;
  end
  
  %La matriz resultante a la derecha será la inversa de la matriz dada.
  
  %Guardar en memoria la etapa actual de la matriz aunemtada
  %(extendida a matriz identidad en las primeras columnas)
  pasos=a;
  %Modificar la matriz aumentada
  a(:,1) = [];
  a(:,1) = [];
  a(:,1) = [];
  %Obtencion y guardado en memoria de la matriz inversa
  inversa=a;
  
