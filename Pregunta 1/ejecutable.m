% La función ejecutable calcula la aproximación de la integral definida de todas las funciones
% f en el intervalo [a, b] de la pregunta 1.
%
% Sintaxis de la función: ejecutable ()
%
% Parámetros de entrada:
% No posee parámetros de entrada
%
% Parámetros de salida:
% I = simpson(f,a,b);
% I = simpson_compuesto(f,a,b,n);
% I = simpson_compuesto_iterativa(f,a,b,tol, iterMax);
% I = trapecio(f,a,b);
% I = trapecio_compuesto(f,a,b,n);
% I = trapecio_compuesto_iterativa(f,a,b,tol, iterMax);
% I = cuad_gauss(f,a,b,m);
% I = gaussiana_compuesta(f,a,b,m,n);
% I = gaussiana_compuesta_iterativa(f,a,b,m,tol,iterMax);

function ejecutable ()
  clear;
  clc;

  a = 0.1;
  b = 0.9;
  n = 20;
  m = 10;
  f = "log(asin(x))/log(x);";
  tol = 10^-6;
  iterMax = 2500;

  I = simpson(f,a,b);
  disp("Imprime resultado de Simpson")
  disp(I)


  I = simpson_compuesto(f,a,b,n);
  disp("Imprime resultado de Simpson Compuesto")
  disp(I)

  I = simpson_compuesto_iterativa(f,a,b,tol, iterMax);
  disp("Imprime resultado de Simpson Compuesto Iterativa")
  disp(I)

  I = trapecio(f,a,b);
  disp("Imprime resultado de Trapecio")
  disp(I)

  I = trapecio_compuesto(f,a,b,n);
  disp("Imprime resultado de Trapecio Compuesto")
  disp(I)

  I = trapecio_compuesto_iterativa(f,a,b,tol, iterMax);
  disp("Imprime resultado de Trapecio Compuesto Iterativa")
  disp(I)


  f=@(x) log(asin(x))/log(x);
  I = cuad_gauss(f,a,b,m);
  disp("Imprime resultado de Cuadratura Gaussiana")
  disp(I)

  I = gaussiana_compuesta(f,a,b,m,n);
  disp("Imprime resultado de Cuadratura Gaussiana Compuesta")
  disp(I)

  I = gaussiana_compuesta_iterativa(f,a,b,m,tol,iterMax);
  disp("Imprime resultado de Cuadratura Gaussiana Compuesta Iterativa")
  disp(I)



endfunction
