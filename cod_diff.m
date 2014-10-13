function [bits_cd] = cod_diff(bits_c)
%COD_DIFF
%   Cod_diff est le codeur différentiel qui fait suite au codeur cyclique.
%   Il prend en argument le vecteur sorti du codeur cyclique et apporte de
%   la redondance entre les bits reçus avant de les envoyer au codeur
%   biphase

len_c = length(bits_c);
bits_cd=zeros(1,len_c);
bits_cd(1, 1) = bits_c(1, 1);
for i=2:len_c
    bits_cd(1,i) = xor(bits_cd(1,i-1),bits_c(1,i));
    %sprintf('Verification de XOR(%d,%d)=%d',bits_c(i-1),bits_c(i), xor_bit)
end
end


