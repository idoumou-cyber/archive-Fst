function cond1 = Conditionnement1(A)
%CONDITIONNEMENT1 Calcule le nombre de condition de la matrice A dans la norme 1.
%   Renvoie le conditionnement de A en utilisant la norme 1.
cond1 = cond(A, 1);
end
