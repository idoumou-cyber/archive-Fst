
function condInf = ConditionnementInf(A)
%CONDITIONNEMENTINF Calcule le nombre de condition de la matrice A dans la norme infinie.
%   Renvoie le conditionnement de A en utilisant la norme infinie.
condInf = cond(A, inf);
end
