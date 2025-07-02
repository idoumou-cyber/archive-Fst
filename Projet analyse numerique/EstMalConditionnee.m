function est_mal = EstMalConditionnee(A, seuil)
%ESTMALCONDITIONNEE Verifie si une matrice est mal conditionnee.
%   Renvoie vrai si le conditionnement (norme 2) de A depasse un seuil.
if cond(A, 2) > seuil
    est_mal = true;
else
    est_mal = false;
end
end
