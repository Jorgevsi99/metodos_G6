function [x,error,it]=jacobi(A,b,x0,tol,itmax)
#Union e impresión de la matriz completa.
disp("Matriz Aumentada");
[n,n]=size(A);
for i = 1:n
  for j = 1:n
     fprintf('%d \t', A(i,j));
  end
  fprintf('| %d ', b(i,1));
  disp("");

end

%--------------------- Manejo de errores ------------------------%
%Si se ingresan todos los datos de entrada                     
if (size(A,1) ~= size(A,2))  #comparando el nullmero de filas con el numero de columnas
    error('Se necesita que la matriz A sea cuadrada');
    
elseif size(b,2) ~= 1  #comprueba si el vector B tiene mas de una columna
    error('B debe ser un vector columna');
    
elseif size(A,1) ~= size(b,1) #Comprueba si el numero de filas de A es igual a de B
    error('El numero de filas de A no coincide con el de B. Sistema inconsistente');
end
disp(newline); #salto de linea
if prod(diag(A)) == 0  #si el determinante=0 no se puede resolver el sistema
    error('El determinante de la matriz A es cero, no se puede resolver');
end

#analizando criterio de convergencia
#pg 5 https://www.ingenieria.unam.mx/pinilla/PE105117/pdfs/tema3/3-3_metodos_jacobi_gauss-seidel.pdf

#comprobacion y movimiento de filas en caso de no cumplir criterio de convergencia
[esdom] = esDiagDom(A) ;  #llamamos a la función Diagonal Dominante. 
if(esdom) #si la matriz es diagonalmente dominante se ejcuta el proceso sino no se ejecuta
  [n,n]=size(A);
  
  if (nargin('jacobi')<3)
    x0=zeros(n,1);
    tol=1.e-5;
    itmax=1000;
  end
  
  it=0;
  error=1000.0;
  D=diag(diag(A))
  D1=inv(D)
  E=-tril(A,-1)
  F=-triu(A,+1)
  res=norm(A*x0-b);
  error= res/norm(b);
  
  while (it<itmax && error>tol)
    it=it+1;
    x=D1*(E+F)*x0+D1*b;
    res=norm(A*x-b);
    error=res/norm(b);
    x0=x;
  end
elseif(esdom==0)
  disp("La matriz no es diagonalmente dominante");  
  x="No cumple criterio de convergencia";
  it=0;
  error="sin error";  
end
