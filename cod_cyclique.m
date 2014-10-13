function [ bits_c ] = cod_cyclique( bits, i )
%COD_CYCLIQUE
%   Apporte de la redondance afin de pouvoir corriger un nombre
%   d'erreurs limit� dues au passage dans le canal AWGN

% Flag de sychronisation pour choisir l'offset entre C et C'.
% flag_C

% Matrice des offsets
A = [0 0 1 1 1 1 1 1 0 0];
B = [0 1 1 0 0 1 1 0 0 0];
C = [0 1 0 1 1 0 1 0 0 0];
C_prime = [1 1 0 1 0 1 0 0 0 0];
D = [0 1 1 0 1 1 0 1 0 0];

offsets = [A; B; C; C_prime; D];

% Matrice g�n�ratrice pour le codage cyclique G
G = [0 0 0 1 1 1 0 1 1 1;...
    1 0 1 1 1 0 0 1 1 1;...
    1 1 1 0 1 0 1 1 1 1;...
    1 1 0 0 0 0 1 0 1 1;...
    1 1 0 1 0 1 1 0 0 1;...
    1 1 0 1 1 1 0 0 0 0;...
    0 1 1 0 1 1 1 0 0 0;...
    0 0 1 1 0 1 1 1 0 0;...
    0 0 0 1 1 0 1 1 1 0;...
    0 0 0 0 1 1 0 1 1 1;...
    1 0 1 1 0 0 0 1 1 1;...
    1 1 1 0 1 1 1 1 1 1;...
    1 1 0 0 0 0 0 0 1 1;...
    1 1 0 1 0 1 1 1 0 1;...
    1 1 0 1 1 1 0 0 1 0;...
    0 1 1 0 1 1 1 0 0 1];
G = [eye(16) G];

tmp = zeros(4, 26); % Permettra de rajouter les offsets

tmp(1, :) = bitxor(mod(bits(1:16)*G, 2), [zeros(1, 16), offsets(1, :)]);
tmp(2, :) = bitxor(mod(bits(17:32)*G, 2), [zeros(1, 16), offsets(2, :)]);
tmp(3, :) = bitxor(mod(bits(33:48)*G, 2), [zeros(1, 16), offsets(3, :)]);
tmp(4, :) = bitxor(mod(bits(49:end)*G, 2), [zeros(1, 16), offsets(5, :)]);

% Message transmis
bits_c = [tmp(1, :), tmp(2, :), tmp(3, :), tmp(4, :)];

end
