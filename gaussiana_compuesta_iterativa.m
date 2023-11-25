function I = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)
    % f es la función a integrar
    % a y b son los límites de integración
    % M es el orden de la cuadratura (hasta 10 en este caso)
    % tol es la tolerancia
    % iterMax es el número máximo de iteraciones

    % Inicialización
    n = 1;  % Número inicial de nodos
    I_prev = gaussiana_compuesta(f, a, b, n, M);  % Primera aproximación
    iter = 1;

    % Iteraciones
    while iter <= iterMax
        % Doble el número de nodos
        n = 2 * n;
        I = gaussiana_compuesta(f, a, b, n, M);  % Aproximación nueva

        % Verificación de la tolerancia
        if abs(I - I_prev) < tol
            return;
        end

        % Actualización para la siguiente iteración
        I_prev = I;
        iter = iter + 1;
    end

    warning('La cuadratura gaussiana compuesta no convergió en el número máximo de iteraciones.');
end

function I = gaussiana_compuesta(f, a, b, n, M)
    % Calcula la cuadratura gaussiana compuesta con n nodos

    % Puntos y pesos de Gauss-Legendre
    [x, w] = gauss_legendre(M);

    % Escalamiento de los nodos al intervalo [a, b]
    x_scaled = (b - a) / 2 * x + (a + b) / 2;

    % Evaluación de la función en los nodos escalados
    f_values = feval(f, x_scaled);

    % Cuadratura gaussiana compuesta
    I = (b - a) / 2 * sum(w .* f_values);
end

% Función para obtener los nodos y pesos de Gauss-Legendre
function [x, w] = gauss_legendre(n)
    % Obtiene los nodos y pesos de Gauss-Legendre para n puntos

    % Calcula los nodos y pesos utilizando la función integrante
    [x, w] = lgwt(n, -1, 1);

    % Ordena los nodos en orden ascendente
    [x, idx] = sort(x);
    w = w(idx);
end

% Función para obtener los nodos y pesos utilizando Gauss-Legendre Weighted Transform
function [x, w] = lgwt(N, a, b)
    % Obtiene los nodos y pesos de Gauss-Legendre mediante la Transformada Ponderada

    % Función para calcular los nodos y pesos
    weight_func = @(x) 1 ./ sqrt(1 - x.^2);
    [x, w] = quadgk(weight_func, a, b, 'RelTol', 1e-12, 'AbsTol', 1e-12);

    % Escala los nodos al intervalo [a, b]
    x = (x - a) * 2 / (b - a) - 1;
    w = w * 2 / (b - a);
end

% Ejemplo de uso:
f = @(x) x.^2;  % Función a integrar
a = 0;          % Límite inferior
b = 2;          % Límite superior
M = 5;          % Orden de la cuadratura (hasta 10 en este caso)
tol = 1e-6;     % Tolerancia
iterMax = 100;   % Número máximo de iteraciones

I = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax);
disp(['Aproximación numérica: ', num2str(I)]);

