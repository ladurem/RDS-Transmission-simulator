function [ freq_dec ] = bin2MHZ(freq_bin)
       switch(num2str(freq_bin))
           
         case num2str([0 0 0 0 1 1 1 0])%Frequence de base 88.9
             freq_dec = 88.9;
         case num2str([0 1 0 0 0 1 1 1])%94.6
             freq_dec = 94.6;
         case num2str([0 1 0 1 1 1 1 0])%96.9
             freq_dec = 96.9;
         case num2str([0 0 0 0 0 1 0 1])%88.0
             freq_dec = 88.0;
         case num2str([0 1 0 1 1 1 0 1])%96.8
             freq_dec = 96.8;
         case num2str([0 1 1 1 1 1 1 1])%100.2
             freq_dec = 100.2;
        case num2str([0 0 0 1 1 1 1 0])%90.5
             freq_dec = 90.5;
           otherwise
                 freq_dec = 'Unknow';
       end
end

