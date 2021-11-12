##FACTLU
##  FACTLU(A,B)
##    [resultados,L,u,pasos,pasosL,pasosU]=factLU(A,B)
##    resultados = vector de soluciones
##    L = La matriz triangular inferior
##    U = La matriz triangular superior con 1s en diagonal
##    pasos, pasosL & pasosU = step-by-step del metodo


function [resultados,L,u,pasos,pasosL,pasosU]=factLU(A,B)
  
##  format short
  
  #Verificacion de matrices                 
    if size(A,1) ~= size(A,2)  #comparando el número de filas con el número de columnas
        error('Se necesita que la matriz A sea cuadrada');
        
    elseif size(B,2) ~= 1  #comprueba si el vector B tiene mas de una columna
        error('B debe ser un vector columna');
        
    elseif size(A,1) ~= size(B,1) #Comprueba si el numero de filas de A es igual a de B
        error('El numero de filas de A no coincide con el de B. Sistema inconsistente');
    end
  
  
  [n,m]=size(A);
  
  #Para imprimir 
  t = ' | '; 
  f=char(25);
  T = repmat(t,n,1);
  F = repmat(f,1,n);
  
  C=[A,B];
##  matrizCompleta=C;
  c=num2str(C);
  pasos=[c];
  pasosL=[c];
  pasosU=[c];
  # la matriz C, representa la forma de la matriz aumentada [AB]
  
  if n==m 
    for k=1:n
      %La instrucción iterativa for permite repetir estamentos a un
      %numero específico de veces  
      u(k,k)=1; %princio del metodo
      suma=0;
      for p=1:k-1
        suma=suma+L(k,p)*u(p,k);
      end
      L(k,k)=(A(k,k)-suma);
      
##      #guardamos en pasos la matriz actual    
##      c=num2str(L);
##      pasosL=[pasosL;F;c];
##      
##      c=num2str(u);
##      pasosU=[pasosU;F;c];
          
      for i=k+1:n
        suma=0;
          for r=1:k-1
            suma=suma+L(i,r)*u(r,k);
          end
          L(i,k)=(A(i,k)-suma); %obtencion de la matriz L
      end
      
      #guardamos en pasos la matriz actual    
      c=num2str(L);
      pasosL=[pasosL;F;c];
      
      for j=k+1:n
        suma=0;
        for s=1:k-1
          suma=suma+L(k,s)*u(s,j);
        end
        u(k,j)=(A(k,j)-suma)/L(k,k); %obtencion de la matriz U
      end
      
      #guardamos en pasos la matriz actual    
      c=num2str(u);
      pasosU=[pasosU;F;c];
      
    end
    memoriau=1; %calculo del determinante de u
    memoriaL=1; %calculo del determinante inicial de L
    for i=1:n
      memoriaL=memoriaL*L(i,i); 
    end
    producto=memoriaL*memoriau;  %calculo del determinante total
      
    if producto~=0
      for i=1:n %sustitucion progresiva
        suma=0;
        for p=1:i-1
          suma=suma+L(i,p)*y(p);
        end
        y(i)=(B(i)-suma)/L(i,i); %obtencion del vector y (Ly=B)
        #guardamos en pasos la matriz actual    
        c=num2str(y);
        pasos=[pasos;F;c];
      end
      for i=n:-1:1 %sustitucion regresiva
        suma=0;
        for p=(i+1):n
          suma = suma+u(i,p)*x(p);
        end
        x(i)=(y(i)-suma)/u(i,i); % solucion, calculos de las variables (Ux=y)
        #guardamos en pasos la matriz actual    
        c=num2str(x);
        pasos=[pasos;F;c];
      end
      resultados=x';
    else
      msgID = 'DETERMINANTE';
      msg = 'El determinante es igual a cero, por lo tanto el sistema tiene infinitas o ninguna solucion';
      error(msgID,msg);
    end
  end
  
end