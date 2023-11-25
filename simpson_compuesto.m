% La función simpson_compuesto implementa la regla compuesta de Simpson
% para aproximar la integral definida de una función f en el intervalo [a, b].
% Utiliza un número dado de subintervalos (N) para mejorar la precisión.
%
% Sintaxis de la función: simpson_compuesto(f, a, b, N)
%
% Parámetros de entrada:
% f = Función a integrar
% a = Límite inferior de integración
% b = Límite superior de integración
% N = Número de subintervalos
%
% Parámetro de salida:
% I = Aproximación de la integral definida

function I = simpson_compuesto (f, a, b, N)
  h = (b-a)/(N-1);
  xSoporte = a:h:b;
  I = 0;
  for i = 1 : N-1
    I = I + simpson(f,xSoporte(i),xSoporte(i+1));
  endfor

endfunction


