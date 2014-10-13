function [ bits_est ] = decod_cycl( bits_cr )
%DECOD_CYCL
%   Décode à l'aide de l'algorithme du syndrome (décodage BCH) le signal en
%   entrée. Corrige les erreurs dans le cadre de la recommandation.
%   Renvoie le signal finalement obtenu par l'utilisateur. Sur chaque bloc
%   (26 bits), les 16 premiers sont ceux que l'on espère avoir envoyé et
%   les 10 derniers sont l'influence de la redondance introduite par les
%   offsets.

A = [0 0 1 1 1 1 1 1 0 0];
B = [0 1 1 0 0 1 1 0 0 0];
C = [0 1 0 1 1 0 1 0 0 0];
C_prime = [1 1 0 1 0 1 0 0 0 0];
D = [0 1 1 0 1 1 0 1 0 0];

H = [1 0 1 1 0 1 1 1 0 0;...
    0 1 0 1 1 0 1 1 1 0;...
    0 0 1 0 1 1 0 1 1 1;...
    1 0 1 0 0 0 0 1 1 1;...
    1 1 1 0 0 1 1 1 1 1;...
    1 1 0 0 0 1 0 0 1 1;...
    1 1 0 1 0 1 0 1 0 1;...
    1 1 0 1 1 1 0 1 1 0;...
    0 1 1 0 1 1 1 0 1 1;...
    1 0 0 0 0 0 0 0 0 1;...
    1 1 1 1 0 1 1 1 0 0;...
    0 1 1 1 1 0 1 1 1 0;...
    0 0 1 1 1 1 0 1 1 1;...
    1 0 1 0 1 0 0 1 1 1;...
    1 1 1 0 0 0 1 1 1 1;...
    1 1 0 0 0 1 1 0 1 1];

H = [eye(10); H];

A_offset = [zeros(1, 16) A];
B_offset = [zeros(1, 16) B];
C_offset = [zeros(1, 16) C];
C_prime_offset = [zeros(1, 16) C_prime];
D_offset = [zeros(1, 16) D];

% Création de la table de syndrômes pour la correction des erreurs
type_of_error = zeros(75, 26);

TOE1 = eye(26); % Repère une seule erreur sur 26 bits

TOE2 = zeros(25, 25); % Repère 2 erreurs consécutives sur 26 bits
for i=1:25
    TOE2(i, i) = 1;
    TOE2(i, i+1) = 1;
end

TOE3 = zeros(24, 24); % Repère 3 erreurs consécutives sur 26 bits
for i=1:24
    TOE3(i, i) = 1;
    TOE3(i, i+1) = 1;
    TOE3(i, i+2) = 1;
end

TOE4 = zeros(23, 23); % Repère 4 erreurs consécutives sur 26 bits
for i=1:23
    TOE4(i, i) = 1;
    TOE4(i, i+1) = 1;
    TOE4(i, i+2) = 1;
    TOE4(i, i+3) = 1;
end

TOE5 = zeros(22, 22); % Repère 5 erreurs consécutives sur 26 bits
for i=1:22
    TOE5(i, i) = 1;
    TOE5(i, i+1) = 1;
    TOE5(i, i+2) = 1;
    TOE5(i, i+3) = 1;
    TOE5(i, i+4) = 1;
end

type_of_error = [TOE1; TOE2; TOE3; TOE4; TOE5];
syndromes = mod(type_of_error*H, 2);
[HS LS] = size(syndromes);

% Corrections des erreurs pouvant être déterminées grâce aux tables de
% syndrômes
tmp = zeros(4, 26);
tmp(1, :) = bits_cr(1:26);
tmp(2, :) = bits_cr(27:52);
tmp(3, :) = bits_cr(53:78);
tmp(4, :) = bits_cr(79:104);

tmpH = zeros(4, 10);
% tmpH(1, :) = bits_cr(1:26)*H;
% tmpH(2, :) = bits_cr(27:52)*H;
% tmpH(3, :) = bits_cr(53:78)*H;
% tmpH(4, :) = bits_cr(79:104)*H;
tmpH(1, :) = bitxor(bits_cr(1:26), A_offset)*H;
tmpH(2, :) = bitxor(bits_cr(27:52), B_offset)*H;
tmpH(3, :) = bitxor(bits_cr(53:78), C_offset)*H;
tmpH(4, :) = bitxor(bits_cr(79:104), D_offset)*H;


bits_cr_corrige = zeros(4, 26);
for i=1:4
    for j=1:HS
        if isequal(tmpH(i, :), syndromes(j, :))
            bits_cr_corrige(i, :) = bitxor(tmp(i, :), syndromes(j, :));
        else
            bits_cr_corrige(i, :) = tmp(i, :);
        end
    end
end

% On ne garde que les 16 premiers bits sur chaque trame de 26 tout juste
% corrigée
block_1 = bits_cr_corrige(1, 1:16);
block_2 = bits_cr_corrige(2, 1:16);
block_3 = bits_cr_corrige(3, 1:16);
block_4 = bits_cr_corrige(4, 1:16);

bits_est = [block_1 block_2 block_3 block_4];

end

