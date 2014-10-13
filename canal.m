function [ y_r ] = canal( y_t, SNRdB, nb_bits_en )
%AWGN 
%   Simule le passage du signal dans un canal gaussien qui peut �tre
%   mod�lis� par l'utilisateur via son SNR en dB

global M

mu=0;

% �nergie du filtre
E_filtre = sum(y_t.^2)/nb_bits_en;

% Sigma :
Eb = E_filtre/log2(M);
No = Eb./(10.^(SNRdB/10));
sigma = sqrt(No/2);

% Bruit
WGN = sigma*randn(1,length(y_t)) + mu;

% Signal bruit� :
y_r = y_t + WGN;

%figure, plot(y_r);
end

