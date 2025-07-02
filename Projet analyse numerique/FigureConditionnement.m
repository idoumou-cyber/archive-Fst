% Script pour visualiser et comparer le conditionnement de differentes matrices

% --- Initialisation ---
n = 10; % Taille des matrices
x_exact = ones(n, 1);
epsilon_values = logspace(-16, 0, 100);
matrix_types = {'Aleatoire', 'Hilbert', 'Diagonale'};

figure;
hold on;

% --- Boucle sur les types de matrices ---
for i = 1:length(matrix_types)
    type = matrix_types{i};
    erreurs = [];
    
    % 1. Generation de la matrice A
    switch type
        case 'Aleatoire'
            A = rand(n, n);
        case 'Hilbert'
            A = hilb(n);
        case 'Diagonale'
            % Matrice diagonale avec des valeurs tres espacees pour etre mal conditionnee
            A = diag(logspace(5, -5, n)); 
    end
    
    b = A * x_exact;
    B = rand(n, n); % Matrice de perturbation
    
    fprintf('Traitement de la matrice: %s (Cond = %e)\n', type, cond(A));

    % 2. Boucle sur les perturbations
    for epsilon = epsilon_values
        A_perturbe = A + epsilon * B;
        x_perturbe = A_perturbe \ b;
        err = norm(x_perturbe - x_exact) / norm(x_exact);
        erreurs = [erreurs, err];
    end
    
    % 3. Tracer la courbe pour ce type de matrice
    loglog(epsilon_values, erreurs, '-', 'LineWidth', 2);
end

% --- Finalisation du graphique ---
hold off;
title('Comparaison de l''erreur relative pour differents types de matrices');
xlabel('Magnitude de la perturbation (epsilon)');
ylabel('Erreur relative de la solution');
legend(matrix_types);
grid on;
axis([1e-16 1 1e-15 1e5]); % Ajuster les axes pour une meilleure visualisation