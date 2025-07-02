% Script pour etudier la perturbation du second membre b

% 1. Definir une matrice A bien conditionnee (exemple: matrice aleatoire)
n = 5;
A = rand(n);

% S'assurer qu'elle est bien conditionnee
cond_A = cond(A);
fprintf('Conditionnement de A: %f\n', cond_A);

% 2. Definir un vecteur solution exact
x_exact = ones(n, 1);

% 3. Calculer b
b_exact = A * x_exact;

% 4. Ajouter une perturbation a b
delta_norm = 1e-6; % Norme de la perturbation
delta = rand(n, 1);
delta = delta / norm(delta) * delta_norm; % Normaliser le vecteur de perturbation
b_perturbe = b_exact + delta;

% 5. Resoudre le systeme perturbe
x_perturbe = A \ b_perturbe;

% 6. Calculer l'erreur relative
err_rel = norm(x_perturbe - x_exact) / norm(x_exact);

fprintf('Norme de la perturbation sur b: %e\n', delta_norm);
fprintf('Erreur relative sur la solution x: %e\n', err_rel);
