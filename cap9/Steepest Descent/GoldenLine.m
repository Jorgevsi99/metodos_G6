# Se utiliza Golden Search Metod
#   Técnica para hallar el extremo (mínimo o máximo) de una función unimodal, 
#   mediante reducciones sucesivas del rango de valores en el cual se conoce 
#   que se encuentra el extremo

# Teoria : Seccion 5.4 Algoritmo 5.3
# a : Limite inferior
# b : Limite superior
# epsilon : Tolerancia
# maxiter : Limite de iteraciones
# falpha1 : funcion evaluada en alpha1
# falpha2 : funcion evaluada en alpha2
# alpha1 : el salto 
#Search : Direccion a la que damos el salto

function [ golden ] = GoldenLine(a, b, x, search , epsilon , maxiter)
tau = 0.381967;
alpha1 = a*(1-tau) + b* tau;
alpha2 = a* tau + b*(1-tau);
falpha1 = funcionVar(x+alpha1 * search);
falpha2 = funcionVar(x+alpha2 * search);
#For
for i=1:maxiter
if (falpha1 > falpha2)
a = alpha1;
alpha1 = alpha2;
falpha1 = falpha2;
alpha2 = tau*a + (1-tau)*b;
falpha2 = funcionVar(x+alpha2 * search);
else
b = alpha2;
alpha2 = alpha1;
falpha2 = falpha1;
alpha1 = tau*b + (1-tau)*a;
falpha1 = funcionVar(x+alpha1 * search);
endif

if ( abs(funcionVar(x+alpha1 * search)-funcionVar(x+alpha2 * search))< epsilon)
#golden = [alpha1 falpha1];
break;
endif

golden = [alpha1 falpha1];

endfor

end