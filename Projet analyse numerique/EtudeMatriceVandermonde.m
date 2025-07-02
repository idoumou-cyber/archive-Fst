function EtudeMatriceVandermonde(n)
%ETUDEMATRICEVANDERMONDE Etudie la matrice de Vandermonde de taille n.

% Generation de la matrice de Vandermonde
% Pour une matrice de Vandermonde, on a besoin d'un vecteur x pour la construire.
% Utilisons un vecteur simple pour l'exemple.
x_vander = 1:n;
V = vander(x_vander);

% Vecteur solution exacte
x_exact = ones(n, 1);

% Calcul du second membre
b = V * x_exact;

% Calcul des nombres de condition
cond1_V = Conditionnement1(V);
cond2_V = Conditionnement2(V);
condInf_V = ConditionnementInf(V);

% Affichage des nombres de condition
fprintf('Matrice de Vandermonde de taille %d:\n', n);
fprintf('Conditionnement (norme 1): %e\n', cond1_V);
fprintf('Conditionnement (norme 2): %e\n', cond2_V);
fprintf('Conditionnement (norme inf): %e\n', condInf_V);

% Calcul de l'erreur relative
err_rel_V = ErreurRelative(V, b, x_exact);

fprintf('Erreur relative (norme 1): %e\n\n', err_rel_V);

end