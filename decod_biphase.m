function [ bits_cdr, x_r_filtered ] = decod_biphase( x_r )
%DECOD_BIPHASE
%   Filtre le signal issu du canal AWGN de mani�re adapt�e et d�code les
%   symboles BPSK

global Db td fe Te

pas = td/(Te);
j=1;

% Filtre adapt�
t = -2*td:Te:2*td-Te;
h_t = 2/td*(sinc(1/2+(4*t)/td) + sinc(-1/2+(4*t)/td));
h_adapt_t = h_t-2/td*(sinc(1/2+(4*(t-td/2))/td) + sinc(-1/2+(4*(t-td/2))/td));

h_t_flipped=fliplr(h_adapt_t);

x_r_filtered=conv(h_t_flipped,x_r);

% Sous-�chantillonnage
x_r_filtered_undersampled = x_r_filtered(length(h_adapt_t):pas:pas*104-pas+length(h_adapt_t));

% G�n�ration de symboles
bits_cdr = x_r_filtered_undersampled;
bits_cdr = pskdemod(bits_cdr, 2, 90);% A cause de la phase modifi�e lors de la modulation BPSK, place la phase � 90

%plot(real(bits_cdr));
end

