% Simulation d'un �metteur / r�cepteur RDS - PROJET TS 226 2013/2014
function [bits_est] = couche_physique_main(bits)

global M Db td Dg fe Te fp

M = 2; % Nombre de symboles
Db = 1187.5; % D�bit des symboles BPSK
td = 1/Db;
Dg = 87.6*10^(-3); % Dur�e d'un groupe
fe = 570*10^3; % Fr�quence d'�chantillonnage
Te = 1/fe; % P�riode d'�chantillonnage
fp = 57*10^3; % Fr�quence de la porteuse

erreurs_est = 0;
erreurs_c_cr = 0;
erreurs_cd_cdr = 0;
i=0;
SNRdB = 15;

length_group = 104;

    
    [ bits_c ] = cod_cyclique( bits, i );
    [ bits_cd ] = cod_diff( bits_c );
    [ x_t, bpsk ] = biphase_gen( bits_cd );
    [ y_t ] = porteuse( x_t );
    [ y_r ] = canal( y_t, SNRdB, length_group );
    [ x_r ] = r_porteuse( y_r );
    [ bits_cdr, x_r_filtered ] = decod_biphase( x_r );
    [bits_cr] = decod_diff(bits_cdr);
    [ bits_est ] = decod_cycl(bits_cr);
    
    erreurs_cd_cdr = erreurs_cd_cdr + sum(sum(xor(bits_cd,bits_cdr)));
    erreurs_c_cr = erreurs_c_cr + sum(sum(xor(bits_c,bits_cr)));
    erreurs_est = erreurs_est + sum(sum(xor(bits,bits_est)));
    
    
end