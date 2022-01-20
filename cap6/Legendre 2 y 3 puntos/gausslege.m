%Descripcion
%Esta funcion usa integrales de La cuadratura de Gauss legendre

function I = gausslege(f,a,b,n)  #recibimos la funcion, intervalos y n
a0=(b+a)/2;  #hallamos el centro
a1=(b-a)/2;  #hallamos la mitad del subintervalo
#--------------------------------------
#desarrollo del método legendre 2 puntos. 
if n==2
  x0=a0+(a1*(-1/(sqrt(3)))); #Hallando el punto hacia la izquierda
  x1=a0+(a1*(1/(sqrt(3))));  #Hallando el punto hacia la derecha
  fx0=a1*f(x0);  #Hallamos CoF(Xo) 
  fx1=a1*f(x1);  #Hallamos C1F(X1)
  I=fx0+fx1;     #fórmula  para hallar la integral
end

#-----------------------------------------
#desarrollo del método legendre 3 puntos.
if n==3
    x0=a0+(a1*-0.774596669);  #desplazamiento hacia la izquierda
    x1=a0;  #no se mueve en el centro
    x2=a0+(a1*0.774596669);  #desplacamiento hacia la derecha
    fx0=a1*f(x0);
    fx1=a1*f(x1);
    fx2=a1*f(x2);
    I=(0.5555556*fx0)+(0.8888889*fx1)+(0.5555556*fx2);   #C0 , C1 , C3 vienen definidos en la tabla 
end
end