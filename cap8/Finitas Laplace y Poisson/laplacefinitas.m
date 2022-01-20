#Univiersidad de Cuenca - Enero 2022 
#Jorge Sanchez, Cristian Marin G , Antony Uquillas.

 

function r=laplacefinitas(ua, ub, uc, ud, n, m, iter, err, fi)

#Asignación de los valores del  contorno de la región rectangular de la placa 
 #lados horizontales 
  for i=1:n+2
    u(i,1)=uc;   #lado de abajo
    u(i,m+2)=ud; #lado de arriba
  endfor
  
  #lados verticales
  for j=1:m+2
    u(1,j)=ua;
    u(n+2,j)=ub;
  endfor
  
  #Hallar los puntos interiores 
  p=(ua+ub+uc+ud)/4;  #Formula para hallar el promedio 
  #bucle para hallar los puntos
  for i=2:n+1
    for j=2:m+1
      u(i,j)=p;
    endfor
  endfor
  
  #Calculo de Iteraciones por iteracion
  k=0; #inicializamos la variable (contar las iteraciones)
  conv=0; #convergencia (encontrar la solución con exactitud) 
 
  while k<iter & conv==0
    k=k+1;
    t=u;
    #bulce de actualizacion de los valores 
     for i=2:n+1
       for j=2:m+1
         u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1));  #fórmula 
       endfor
     endfor
     
     #verificación si encontramos la solución 
     if norm((u-t),inf)/norm(u,inf)<err #calculo error porcentual 
       conv=1;
     endif
     
  endwhile
  
  #impresion de resultados 
  if conv==1
    figure(fi)
    disp(u)
    disp(k)
    #Gráfica
    [x,y]=meshgrid(1:m+2,1:n+2);
    surf(x,y,u)
    shading flat  #comando para suavisar la superficie 
    
  else
    disp('no converge')
  endif
  
endfunction