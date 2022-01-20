% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integraci�n num�rica
% Gauss-Hermite


function p=hermipol(n)
  k=2;
  p(1,1)=1;
  p(2,1:2)=[2 0];
  for k=2:n
     p(k+1,1:k+1)=2*[p(k,1:k) 0]-2*(k-1)*[0 0 p(k-1,1:k-1)];
  end