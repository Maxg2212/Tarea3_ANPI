% function I=cuad_gauss(f,a,b,n)
% f funcion a aproximar
% a limite inferior de la cuadratura
% b limite superior de la cuadratura
% n orden de la cuadratura Gaussiana
% Aproxima el valor de la integral de f por medio del metodo de cuadraturas Gaussianas
% Acepta cualquier valor para a y b dentro de R
% I valor de la aproximacion
% return I

function I = cuad_gauss (f, a, b, n)
  g=@(x) ((b-a)/2)*f((b-a)/2*x+(b+a)/2);
  [x,w]=pesos(n);
  I=0;
  for i=1:n
    I=I+w(i)*g(x(i));
  end

endfunction
