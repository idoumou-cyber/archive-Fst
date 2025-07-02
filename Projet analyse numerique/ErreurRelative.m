function err_rel = ErreurRelative(A, b, x_exact)
%ERREURRELATIVE Resout Ax=b et renvoie l'erreur relative.
%   Calcule la solution numerique x_num et la compare a x_exact.
x_num = A\b;
err_rel = norm(x_num - x_exact, 1) / norm(x_exact, 1);
end
