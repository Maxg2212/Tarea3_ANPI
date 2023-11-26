% Funcion gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)
% f es la función a integrar
% a y b son los límites de integración
% m es el orden de la cuadratura (hasta 10 en este caso)
% tol es la tolerancia
% itermax es el número máximo de iteraciones
function I = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)

    % Inicialización
    n = 1;  % Número inicial de subintervalos
    I_prev = gaussiana_compuesta(f, a, b, M, n);  % Primera aproximación
    iter = 1;

    % Iteraciones
    while iter <= iterMax
        % Doble el número de subintervalos
        n = 2 * n;
        I = gaussiana_compuesta(f, a, b, M, n);  % Aproximación nueva

        % Verificación de la tolerancia
        if abs(I - I_prev) < tol
            return;
        endif

        % Actualización para la siguiente iteración
        I_prev = I;
        iter = iter + 1;
    endwhile

    warning('La cuadratura gaussiana compuesta no convergió en el número máximo de iteraciones.');
endfunction



