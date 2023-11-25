function I = simpson_compuesto_iterativa(f, a, b, tol, iterMax)
    % f es la función a integrar
    % a y b son los límites de integración
    % tol es la tolerancia
    % iterMax es el número máximo de iteraciones

    % Inicialización
    h = (b - a) / 2;
    I_prev = (feval(f, a) + 4 * feval(f, (a + b) / 2) + feval(f, b)) * h / 3;
    iter = 1;

    % Iteraciones
    while iter <= iterMax
        % Puntos medios de los subintervalos
        x_i = a + h/2 : h : b - h/2;

        % Suma de los términos internos
        I = h * (feval(f, a) + 4 * sum(feval(f, x_i)) + feval(f, b)) / 3;

        % Aproximación nueva
        I = (I + I_prev) / 2;

        % Verificación de la tolerancia
        if abs(I - I_prev) < tol
            return;
        end

        % Actualización para la siguiente iteración
        I_prev = I;
        h = h / 2;
        iter = iter + 1;
    end

    warning('La regla de Simpson compuesto no convergió en el número máximo de iteraciones.');
end


