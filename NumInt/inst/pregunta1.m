%% @documentencoding UTF-8
%% @defun pregunta1()
%% Pregunta que aproxima una matriz ya definida, la cosa es que una prueba
%% @strong{Note on Terminology}: Esta funcion hace algo, jaja saludos
function pregunta1()
  clc; clear;
  A = [12 -2 6 -2; -2 5 2 1; 6 2 9 -2; -2 1 -2 1] + (i*[6 2 7 2; 2 7 1 1; 7 1 9 0; 2 1 0 10]);
  b = [9;-7;-5;7] + (i*[12;-4;17;-2]);
  x0 = [0; 0; 0; 0];
  iterMax = 1000;
  tol = 1e-12;

  HSS(A, b, x0, iterMax, tol);

end


%% @documentencoding UTF-8
%% @defun pregunta1()
%% Pregunta que aproxima una matriz ya definida, la cosa es que una prueba
%% @strong{Note on Terminology}: Esta funcion hace algo, jaja saludos
function HSS(A, b, x0, iterMax, tol)
    n = size(A);
    %Matrices

    W = real(A);
    T = imag(A);
    I = eye(n, n);

    %Solucion inicial
    x=x0;

    %Iterar hasta que se cumpla el criterio de parada o el maximo de iteraciones.
    for k=1:iterMax
      %z = (inv(I + W) * (I - i*T) * x) + (inv(I + W) * b);
      %x = ((inv(I + i*T) * (I - W) * z) + (inv(I + i*T) * b));

      inv_I_W = (I+W)\I;
      inv_I_iT = (I+i*T)\I;
      z = (inv_I_W * (I - i*T) * x) + (inv_I_W * b);
      x = ((inv_I_iT * (I - W) * z) + (inv_I_iT * b));

      error=norm(A*x-b);
      if abs(error)<=tol;
        display(k);
        display(abs(error));
        display(x);
        break;
      end
    end
    error=norm(A*x-b);

    display(iterMax);
    display(abs(error));
    display(x);

 end


