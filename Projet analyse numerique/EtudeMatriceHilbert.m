function EtudeMatriceHilbert(n)
% ETUDEMATRICEHILBERT Étudie la matrice de Hilbert de taille n
% et affiche son conditionnement ainsi que l'erreur relative de la solution.

    

    % --- 1. Génération de la matrice de Hilbert ---
    H = hilb(n);  % Matrice de Hilbert de taille n

    % --- 2. Vecteur solution exacte ---
    x_exact = ones(n, 1);  % On suppose que la solution exacte est un vecteur de 1

    % --- 3. Calcul du second membre ---
    b = H * x_exact;

    % --- 4. Calcul des nombres de condition ---
    cond1_H   = Conditionnement1(H);      % Norme 1
    cond2_H   = Conditionnement2(H);      % Norme 2
    condInf_H = ConditionnementInf(H);    % Norme infini

    % --- 5. Affichage des résultats ---
    fprintf('--- Matrice de Hilbert de taille %d ---\n', n);
    fprintf('Conditionnement (norme 1)   : %e\n', cond1_H);
    fprintf('Conditionnement (norme 2)   : %e\n', cond2_H);
    fprintf('Conditionnement (norme inf) : %e\n', condInf_H);

    % --- 6. Calcul et affichage de l''erreur relative ---
    err_rel = ErreurRelative(H, b, x_exact);
    fprintf('Erreur relative (norme 1)   : %e\n\n', err_rel);
end
