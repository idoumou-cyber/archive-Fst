% Script pour comparer la résolution directe (A\b) et la factorisation LU

% --- Cas 1: Matrice bien conditionnée ---
fprintf('--- Cas 1: Matrice aléatoire bien conditionnée ---\n');
n_bien = 100;
A_bien = rand(n_bien);
x_exact_bien = ones(n_bien, 1);
b_bien = A_bien * x_exact_bien;

% Méthode directe
tic;
x_direct_bien = A_bien \ b_bien;
temps_direct_bien = toc;
err_direct_bien = norm(x_direct_bien - x_exact_bien) / norm(x_exact_bien);

fprintf('Méthode directe (A\\b):\n');
fprintf('  Temps: %f secondes\n', temps_direct_bien);
fprintf('  Erreur relative: %e\n', err_direct_bien);

% Méthode LU
tic;
[L_bien, U_bien, P_bien] = lu(A_bien);
y_bien = L_bien \ (P_bien * b_bien);
x_lu_bien = U_bien \ y_bien;
temps_lu_bien = toc;
err_lu_bien = norm(x_lu_bien - x_exact_bien) / norm(x_exact_bien);

fprintf('Méthode de factorisation LU:\n');
fprintf('  Temps: %f secondes\n', temps_lu_bien);
fprintf('  Erreur relative: %e\n\n', err_lu_bien);

% --- Cas 2: Matrice mal conditionnée (Hilbert) ---
fprintf('--- Cas 2: Matrice de Hilbert mal conditionnée ---\n');
n_mal = 15;
A_mal = hilb(n_mal);
x_exact_mal = ones(n_mal, 1);
b_mal = A_mal * x_exact_mal;
fprintf('Conditionnement de la matrice de Hilbert: %e\n', cond(A_mal));

% Méthode directe
tic;
x_direct_mal = A_mal \ b_mal;
temps_direct_mal = toc;
err_direct_mal = norm(x_direct_mal - x_exact_mal) / norm(x_exact_mal);

fprintf('Méthode directe (A\\b):\n');
fprintf('  Temps: %f secondes\n', temps_direct_mal);
fprintf('  Erreur relative: %e\n', err_direct_mal);

% Méthode LU
tic;
[L_mal, U_mal, P_mal] = lu(A_mal);
y_mal = L_mal \ (P_mal * b_mal);
x_lu_mal = U_mal \ y_mal;
temps_lu_mal = toc;
err_lu_mal = norm(x_lu_mal - x_exact_mal) / norm(x_exact_mal);

fprintf('Méthode de factorisation LU:\n');
fprintf('  Temps: %f secondes\n', temps_lu_mal);
fprintf('  Erreur relative: %e\n', err_lu_mal);

% --- Affichage d'un graphique comparatif pour le cas Hilbert ---
figure;
bar([err_direct_mal, err_lu_mal]);
set(gca, 'XTickLabel', {'Directe', 'LU'});
title('Erreur relative - Matrice Hilbert (mal conditionnée)');
ylabel('Erreur relative');
