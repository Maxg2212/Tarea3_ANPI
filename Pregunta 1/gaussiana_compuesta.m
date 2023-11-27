% function I=gaussiana_compuesta(f,a,b,m,n)
% f funcion a aproximar
% a limite inferior de la cuadratura
% b limite superior de la cuadratura
% m orden de la cuadratura Gaussiana
% n cantidad de divisiones
% Aproxima el valor de la integral de f por medio del metodo de cuadraturas Gaussianas compuestas
% Acepta cualquier valor para a y b dentro de R
% I valor de la aproximacion
% return I

function I = gaussiana_compuesta (f, a, b, m, n)
  step=(b-a)/n;
  a_i=a;
  b_i=a_i+step;
  I=0;
  for i=1:n
    I=I+cuad_gauss(f,a_i,b_i,m);
    a_i=b_i;
    b_i=a_i+step;
  end

endfunction
