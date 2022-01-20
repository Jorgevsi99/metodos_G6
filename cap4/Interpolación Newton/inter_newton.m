%Autores: Christian Marín, Jorge Sánchez, Anthony Uquillas
%Fecha: Noviembre de 2020.
%
%Inputs
%X: valores de X
%Y: valores de Y
%
%Outputs
%b=matriz de diferencias
%ecuacion=funcion polinomica
%p=polinomio resultante

function [ b,ecuacion,p ] = inter_newton(X,Y)

n=length(X);
n1=length(Y);

if nargin >= 2
    if n==n1
        b=zeros(n); %creacion de matriz de diferencias
        b(:,1)=Y(:);%colocar los valores de Y en la primera columna de b
        
        %bucle para llenar la matriz de diferencias
        for j=2:n %empieza desde la 2da col
            for i=1:n-j+1 %n-j+1 -> la tabla tendra menos filas en cada iter
              %(Formula del metodo de diferencias divididas)
                b(i,j)=(b(i+1,j-1)-b(i,j-1))/(X(i+j-1)-X(i));
            end
        end   
        
        %construir el polinomio y la expresion 
        p=num2str(b(1,1));%primer valor del polinomio
        xx=X*-1;%valores de cada X (necesario verificar el signo)
        
        %blucle para obtener los coeficientes y los signos de los polinomios
        for j=2:n
            signo='';
            %solo se realiza la aclaracion para el signo '+', pues este
            %no se mostraria por defecto en el str (a diferencia del '-')
            if b(1,j)>=0
                signo='+';
            end
            xt='';%string de (x-x0)(x-x1)(x-x2)...(x-x_n-2)
            for i=1:j-1
                signo2='';
                %solo se realiza la aclaracion para el signo '+', pues este
                %no se mostraria por defecto en el str (a diferencia del '-')
                if xx(i)>=0
                    signo2='+';
                end
                xt=strcat(xt,'.*(x',signo2,num2str(xx(i)),')');
            end
            
            %polinomio como string
            p=strcat(p,signo,num2str(b(1,j)),xt); 
            
        end  
      
        %Aclaracion de variable simbolica
        tmp=strcat('@(x)',p);
        
        ecuacion=str2func(tmp);
        
    else
        error('Vectores inconsistentes');
    end
else
    error('Argumentos Insuficientes');
end
end
