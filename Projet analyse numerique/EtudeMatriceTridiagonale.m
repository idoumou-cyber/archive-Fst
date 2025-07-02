function EtudeMatriceTridiagonale(n)
%ETUDEMATRICETRIDAGONALE Etudie la matrice tridiagonale de taille n.

% 1. Generation de la matrice tridiagonale
% Une matrice tridiagonale simple avec des 1 sur la diagonale principale
% et les diagonales adjacentes.
A_tridiag = diag(ones(n, 1)) + diag(ones(n-1, 1), 1) + diag(ones(n-1, 1), -1);

% Vecteur solution exacte
x_exact = ones(n, 1);

% Calcul du second membre
b = A_tridiag * x_exact;

% Calcul des nombres de condition
cond1_T = Conditionnement1(A_tridiag);
cond2_T = Conditionnement2(A_tridiag);
condInf_T = ConditionnementInf(A_tridiag);

% Affichage des nombres de condition
fprintf('Matrice Tridiagonale de taille %d:\n', n);
fprintf('Conditionnement (norme 1): %e\n', cond1_T);
fprintf('Conditionnement (norme 2): %e\n', cond2_T);
fprintf('Conditionnement (norme inf): %e\n', condInf_T);

% Calcul de l'erreur relative
err_rel_T = ErreurRelative(A_tridiag, b, x_exact);

fprintf('Erreur relative (norme 1): %e\n\n', err_rel_T);

end