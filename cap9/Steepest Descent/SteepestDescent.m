# Descripcion : Steepest Descent Method
# Theory : Section 6.3 and Algorithm 6.1
# x : Punto de inicio
# epsilon : Tolerancioa
# maxiter : Limite de iteraciones
# xm : Punto minimo
# fm : Minimo valor de la funcion

function [minimos,matrizIteraciones,xm,fm] = SteepestDescent(x,epsilon , maxiter)
#Inicializamos las matrices que almacenaran los resultados
minimos=[];  #mandamos los puntos 
matrizIteraciones=[];
#El valor de la primer punto evaluado
funcionPrevia = funcionVar(x);
fprintf('Funcion inicial:');
disp(funcionPrevia);


for k=0:maxiter # Numero de iteraciones
gradient= GradVec(x); # Gradiente de la funcion
buscarDireccion = -gradient; # Buscamos la direccion   (negaivo) 
# calcular la longitud del paso 
golden = GoldenLine( -100, 100,x,buscarDireccion,epsilon,maxiter);
#Revisarle
funcionAlpha = golden(2); # Siguiente punto 
alpha = golden(1);
# Condicion de finalizacion 
if ( abs (funcionAlpha - funcionPrevia)<epsilon || norm(gradient,2)<epsilon)
break;
endif

#Obtenemos la norma de la gradiente
normGrad =norm(gradient ,2);

#Almacenamos los valores para mostrar la solucion
matrizIteraciones=[matrizIteraciones;k x funcionPrevia normGrad];
#Almacenamos los minimos calculados 
minimos=[minimos;x funcionPrevia];
#Asignamos para la siguiente iteracion
funcionPrevia = funcionAlpha;

x= x + alpha * buscarDireccion; # Generamos un nuevo punto Pag 142
endfor


gradient = GradVec(x);
normGrad = norm(gradient ,2);
#Almacenamos los valores para mostrar la solucion
matrizIteraciones=[matrizIteraciones;k x funcionPrevia normGrad];
#Almacenamos los minimos calculados 
minimos=[minimos;x funcionPrevia];
xm=x;
fm=funcionPrevia;
x;

end