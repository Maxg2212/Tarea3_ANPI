% Funcion I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax)
% f es la función a integrar
% a y b son los límites de integración
% tol es la tolerancia
% iterMax es el número máximo de iteraciones
function I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax)

    % Inicialización
    n = 1;  % Número inicial de subintervalos
    I_prev = trapecio_compuesto(f, a, b, n);  % Primera aproximación
    iter = 1;

    % Iteraciones
    while iter <= iterMax
        % Doble el número de subintervalos
        n = 2 * n;
        I = trapecio_compuesto(f, a, b, n);  % Aproximación nueva

        % Verificación de la tolerancia
        if abs(I - I_prev) < tol
            return;
        endif

        % Actualización para la siguiente iteración
        I_prev = I;
        iter = iter + 1;
    endwhile

    warning('La regla del trapecio compuesto no convergió en el número máximo de iteraciones.');
endfunction

