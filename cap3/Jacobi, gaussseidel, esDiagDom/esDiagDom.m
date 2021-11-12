function [esdom] = esDiagDom(A) 
  
esdom=all((2*abs(diag(A))) >= sum(abs(A),2));
#0 no es diagonalmente dominante
#1 si es diagonalmente dominante