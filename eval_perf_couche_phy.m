function [  ] = eval_perf_couche_phy( x_t, x_r_filtered, SNRdB, erreurs_cd_cdr, erreurs_c_cr, erreurs_est, bpsk, i )
%EVAL_PREF_COUCHE_PHY constitue la partie exp�rimentale de la couche
%physique
    
global td Te

%% Filtre de mise en forme : allures temporelle et spectrale
t = -2*td:Te:2*td-Te;
h_t = 2/td*(sinc(1/2+(4*t)/td) + sinc(-1/2+(4*t)/td));
f = 0:2/td;
H_f = cos(pi*f*td/4);
figure;
subplot(2,1,1); plot(t, h_t); xlabel('Temps (s)'); ylabel('Amplitude h(t)'); ...
    title('Repr�sentation temporelle du filtre de mise en forme');
subplot(2,1,2); plot(f, H_f); xlabel('Fr�quence (Hz)'); ylabel('Amplitude H(f)'); ...
    title('Repr�sentation spectrale du filtre de mise en forme'); ylim([0 1.2]); xlim([0 2500])

% Allure temporelle et spectrale su signal RDS x(t) �mis en bande de base
% sur la dur�e d'une trame, sachant que les symboles g�n�r�s en sortie du
% modulateur BPSK seront superpos�es
figure;
plot(x_t, 'b'); xlabel('Temps (s)'); ylabel('Amplitude x(t)');
    title('Repr�sentation temporelle du signal RDS x(t) en bande de base sur la dur�e d''une trame');
    xlim([0 5.3*10^4]); ylim([-3500 +3500]);

scatterplot(x_t, 20); title(sprintf('Diagramme de dispersion des symboles g�n�r�s en sortie du modulateur BPSK avec Eb/N0 = %d', SNRdB));

% Diagramme de l'oeil du signal RDS �mis sur deux symboles td
eyediagram(x_t, td/Te, 2*td); title('Diagramme de l''oeil du signal RDS �mis sur deux symboles td');
xlabel('Temps (s)'); ylabel('Amplitude');

% % Performances de la chaine de transmission pour Eb/N0 variant de 0 � 10 dB
% % selon les recommandations de l'�nonc� : A TRACER SEUL (POUR QUE CE SOIT MOINS LONG), POUR UN SNRDB
% VARIANT DE 0 A 10
% BER_est = erreurs_est/(i*64);
% BER_c = erreurs_c_cr/(i*64);
% BER_cd = erreurs_cd_cdr/(i*64);
% hold on
% plot(SNRdB, BER_est, 'ro');
% plot(SNRdB, BER_c, 'b+');
% plot(SNRdB, BER_cd, 'mx');
% plot(SNRdB, 0.5*erfc(sqrt(SNRdB)), 'g');


%% Diagramme de l'oeil du signal RDS re�u apr�s filtrage adapt�
eyediagram(x_r_filtered, td/Te, 2*td); title(sprintf('Diagramme de l''oeil du signal RDS re�u apr�s filtrage adapt� avec Eb/N0 = %d', SNRdB));
xlabel('Temps (s)'); ylabel('Amplitude');

% Constellation des symboles re�us pour Eb/N0 = 10 dB
scatterplot(x_r_filtered, 1000, 0, 'r+'); %title(sprintf('Constellation des symboles re�us pour Eb/N0 = %d', SNRdB));


end

