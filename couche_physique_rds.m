% Simulation d'un émetteur / récepteur RDS - PROJET TS 226 2013/2014
clear all; close all; clc;

global M Db td Dg fe Te fp

for SNRdB = 0:2

M = 2; % Nombre de symboles
Db = 1187.5; % Débit des symboles BPSK
td = 1/Db;
Dg = 87.6*10^(-3); % Durée d'un groupe
fe = 570*10^3; % Fréquence d'échantillonnage
Te = 1/fe; % Période d'échantillonnage
fp = 57*10^3; % Fréquence de la porteuse

nb_erreurs=100;
erreurs_est = 0;
erreurs_c_cr = 0;
erreurs_cd_cdr = 0;
i=0;
length_group = 104;

while erreurs_est < nb_erreurs
    bits = [randi([0 1], 1, 16), randi([0 1], 1, 16) , randi([0 1], 1, 16), randi([0 1], 1, 16)];
    
    [ bits_c ] = cod_cyclique( bits, i );
    [ bits_cd ] = cod_diff( bits_c );
    [ x_t, bpsk ] = biphase_gen( bits_cd );
    [ y_t ] = porteuse( x_t );
    [ y_r ] = canal( y_t, SNRdB, length_group );
    [ x_r ] = r_porteuse( y_r );
    [ bits_cdr, x_r_filtered ] = decod_biphase( x_r );
    [bits_cr] = decod_diff(bits_cdr);
    [ bits_est ] = decod_cycl(bits_cr);
    
    erreurs_cd_cdr = erreurs_cd_cdr + sum(sum(xor(bits_cd,bits_cdr)))
    erreurs_c_cr = erreurs_c_cr + sum(sum(xor(bits_c,bits_cr)))
    erreurs_est = erreurs_est + sum(sum(xor(bits,bits_est)))

    i=i+1
end
fprintf('Avec un SNRdB de %d, il faut envoyer %d bits pour atteindre %d erreurs.', SNRdB, i*64, nb_erreurs);
i
eval_perf_couche_phy(x_t, x_r_filtered, SNRdB, erreurs_cd_cdr, erreurs_c_cr, erreurs_est, bpsk, i);
end
