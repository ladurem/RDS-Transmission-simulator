function [bits_cr] = decod_diff(bits_cdr)
%DECOD_DIFF
%   Effectue les opération inverses à cod_diff

len_c = length(bits_cdr);
bits_cr=zeros(1,len_c);
bits_cr(1, 1) = bits_cdr(1, 1);
for i=2:len_c
    bits_cr(1,i) = xor(bits_cdr(1,i-1),bits_cdr(1,i));
end
end


