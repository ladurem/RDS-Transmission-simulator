function [ x_t, bpsk ] = biphase_gen( bits_cd )
%BIPHASE_GEN 
%   G�n�re les symboles BPSK, apporte de la redondance et filtre de mani�re
%   adapt�e avant d'envoyer les bits dans le canal AWGN

global Db td Dg fe Te

% G�n�ration des symboles BPSK
x_t_ = 2*bits_cd-1;
bpsk = x_t_;

% Sur�chantillonnage
x_t = upsample(x_t_, 2);%/2

% Chaque 0 prend la valeur oppos�e � la valeur le pr�c�dant
x_t(1,2:2:end) = -x_t_(1,:);%h_t-h_t(t-td)

% Filtre de mise en forme
t = -2*td:Te:2*td-Te;
x_t = upsample(x_t, 240); % Voir photo pour explications du 240
h_t = 2/td*(sinc(1/2+(4*t)/td) + sinc(-1/2+(4*t)/td));
x_t = conv(x_t, h_t);
end





