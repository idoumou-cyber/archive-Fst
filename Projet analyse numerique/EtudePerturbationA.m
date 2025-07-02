% Script pour �tudier la perturbation de la matrice A
% 1. Initialisation
n = 10;
A = rand(n);
x_exact = ones(n, 1);
b = A * x_exact;

% Matrice de perturbation al�atoire B
B = rand(n);

% 2. It�ration sur epsilon
epsilon_values = logspace(-12, 0, 100); % 100 valeurs de 10^-12 � 10^0
erreurs = [];
conditions = [];

for epsilon = epsilon_values
    % 3. Cr�er la matrice perturb�e
    A_perturbe = A + epsilon * B;
    
    % 4. R�soudre le syst�me
    try
        x_perturbe = A_perturbe \ b;
    catch ME
        warning('Erreur de r�solution pour epsilon = %.2e: %s', epsilon, ME.message);
        continue; % Passer � la prochaine valeur d'epsilon
    end
    
    % 5. Stocker l'erreur et le conditionnement
    err = norm(x_perturbe - x_exact) / norm(x_exact);
    erreurs = [erreurs, err];
    
    cond_A_p = cond(A_perturbe);
    conditions = [conditions, cond_A_p];
end

% 6. Tracer les r�sultats
figure;

% Erreur relative en fonction de epsilon
subplot(2, 1, 1);
loglog(epsilon_values, erreurs, 'b-o', 'MarkerFaceColor', 'b');
title('�volution de l''erreur relative en fonction de \epsilon');
xlabel('\epsilon');
ylabel('Erreur relative');
grid on;
xlim([1e-12 1]);
ylim([1e-16 1e2]);

% Conditionnement en fonction de epsilon
subplot(2, 1, 2);
loglog(epsilon_values, conditions, 'r-o', 'MarkerFaceColor', 'r');
title('�volution du conditionnement en fonction de \epsilon');
xlabel('\epsilon');
ylabel('Conditionnement');
grid on;
xlim([1e-12 1]);
ylim([1 1e4]);