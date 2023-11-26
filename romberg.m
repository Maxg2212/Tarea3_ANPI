% La funcion romberg utiliza el metodo de Romberg para aproximar el valor de una integral definida con funcion f(x)
% Sintaxis de la funcion: R = romberg(func,a,b,n)
% Parametros de entrada:
%         func = funcion f(x) que se utiliza en la integral a evaluar
%         a = limite inferior de la integral
%         b = limite superior de la integral
%         n = tamano de la matriz R para caclular la aproximacioin de la integral
% Parometros de salida:
%         aprox = aproximacioin de la integral evaluada
function aprox = romberg(func,a,b,n)

  R = zeros(n,n);
  h = b-a;
  R(1,1) = (h/2)*(func(a)+func(b));
  display(R(1,1));
  for i=2:n

    sumAux = 0;
    for k=1:2^(i-2)
      sumAux = sumAux + func(a+(k-0.5)*h);
    end

    R(i,1) = (1/2) * (R(i-1,1) + h * sumAux);

    for j=2:i
      R(i,j) = R(i,j-1) + (R(i,j-1)-R(i-1,j-1))/(4^(j-1) - 1);
    end

    h = h/2;

  end
  aprox = R(n,n);

end
