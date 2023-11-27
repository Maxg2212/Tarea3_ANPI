% La función trapecio calcula la aproximación de la integral definida de una función
% f en el intervalo [a, b] utilizando la regla del trapecio.
%
% Sintaxis de la función: trapecio(f, a, b)
%
% Parámetros de entrada:
% f = Función a integrar (como cadena de caracteres)
% a = Límite inferior de integración
% b = Límite superior de integración
%
% Parámetro de salida:
% I = Aproximación de la integral definida
function I = trapecio (f, a, b)
  fnum=str2func(['@(x)' f]);
  I=(b-a)*(fnum(b)+fnum(a))/2;

endfunction
