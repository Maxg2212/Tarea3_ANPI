% La función simpson calcula la aproximación de la integral definida de una función
% f en el intervalo [a, b] utilizando la regla de Simpson.
%
% Sintaxis de la función: simpson(f, a, b)
%
% Parámetros de entrada:
% f = Función a integrar (como cadena de caracteres)
% a = Límite inferior de integración
% b = Límite superior de integración
%
% Parámetro de salida:
% I = Aproximación de la integral definida
function I = simpson (f, a, b)
  fnum=str2func(['@(x)' f]);
  I = ((b-a)/6) * (fnum(a) + 4 * fnum((a+b)/2) + fnum(b));

endfunction
