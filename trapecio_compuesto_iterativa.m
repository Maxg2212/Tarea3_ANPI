function I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax)
    % f es la función a integrar
    % a y b son los límites de integración
    % tol es la tolerancia
    % iterMax es el número máximo de iteraciones

    % Inicialización
    h = b - a;
    I_prev = (feval(f, a) + feval(f, b)) * h / 2;
    iter = 1;

    % Iteraciones
    while iter <= iterMax
        % Puntos medios de los subintervalos
        x_i = a + h/2 : h : b - h/2;

        % Suma de los términos internos
        I = h * sum(feval(f, x_i));

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

    warning('La regla del trapecio compuesto no convergió en el número máximo de iteraciones.');
end

% Ejemplo de uso:
f = @(x) x.^2;  % Función a integrar
a = 0;          % Límite inferior
b = 2;          % Límite superior
tol = 1e-6;     % Tolerancia
iterMax = 100;   % Número máximo de iteraciones

I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax);
disp(['Aproximación numérica: ', num2str(I)]);

