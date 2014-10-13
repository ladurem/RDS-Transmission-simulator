%function [] = MAC_recepteur(bits_est)
groupe_0A  = [0 0 0 0 0];%Informations
groupe_2A  = [0 0 1 0 0];%radiotext
groupe_4A  = [0 1 0 0 0];%Horloge/date
groupe_10A = [1 0 1 0 0];%Nom programe
%Recuperation des infos communes a toutes les trames :
PI = dec2hex(bin2dec(num2str(bits_est(1:16))));
groupe = bits_est(17:21);
switch num2str(groupe)
    
case num2str(groupe_0A)
    TP = bits_est(22);TA = bits_est(28);
    PTY = bits_est(23:27);
    MS = bits_est(29);
    decod = bits_est(30:32);
    
        switch num2str(decod)%On recupere la premiere
                case num2str([0 0 0])%D3
                %On recoit la premeire trame :
                nb_freq_other = bi2de(bits_est(33:40));%=231
                Freq_base = bin2MHZ(bits_est(41:48));%88.9
                PSNS_bin(1:16) = bits_est(49:64);%RC
                case num2str([[0 0 1]])
                Freq_other(1) = bin2MHZ(bits_est(33:40));%Freq1
                Freq_other(2) = bin2MHZ(bits_est(41:48));%freq2
                PSNS_bin(17:32) = bits_est(49:64);%-- 
            case num2str([[1 1 0]])
                Freq_other(3) = bin2MHZ(bits_est(33:40));%Freq1
                Freq_other(4) = bin2MHZ(bits_est(41:48));%freq2
                PSNS_bin(33:48) = bits_est(49:64);%-- 
            case num2str([[1 1 1]])
                Freq_other(5) = bin2MHZ(bits_est(33:40));%Freq1
                Freq_other(6) = bin2MHZ(bits_est(41:48));%freq2
                PSNS_bin(49:64) = bits_est(49:64);%-- 
            otherwise
                sprintf('Unknow type @Mac_recepteur L36');
        end
            k=1;
            for i=1:8:length(PSNS_bin)
                if k==1
                    text_name_radio(k)=char(bi2de(fliplr(PSNS_bin(1:8))));
                else
                    text_name_radio(k)= char(bi2de(fliplr(PSNS_bin(i:i+7))));
                end
                k=k+1;
            end
        case num2str(groupe_2A)
            offset=num2str(bits_est(29:32));
            switch offset
            case '0  0  0  0'
                text_bin(1:32)=(bits_est(33:64));
            case '0  0  0  1'
                text_bin(33:64)=(bits_est(33:64));
            case '0  0  1  0'
                text_bin(65:96)=(bits_est(33:64));
            case '0  0  1  1'
                text_bin(97:128)=(bits_est(33:64));
            end
            k=1;
            i=1;
            for i=1:8:length(text_bin)
                if k==1
                    text_name_info(k)=char(bi2de(fliplr(text_bin(1:8))));
                else
                    text_name_info(k)= char(bi2de(fliplr(text_bin(i:i+7))));
                end
                k=k+1;
            end

        case num2str(groupe_4A)
            JMA=bi2de(bits_est(31:47));
            y_prime = floor((JMA-15078.2)/365.25);
            m_prime = floor((JMA-14956.1 - y_prime*365.25)/30.6001);
            jour = JMA -14956-floor(y_prime*365.25)-floor(m_prime*30.6001);
            if m_prime ==14 || m_prime==15
                k=1;
            else
                k=0;
            end
            Y = (y_prime+k)+1900;
            M=m_prime-1-k*12;
            clear y_prime m_prime k;
            heure=bi2de(bits_est(48:52));
            minutes=bi2de(bits_est(53:58));
            local_time=bits_est(59:64);
        case num2str(groupe_10A)
            c0=bits_est(32);
            switch c0
            case 0
                text_program_bin(1:32)=bits_est(33:64);
            case 1
                text_program_bin(33:64)=bits_est(33:64);
            otherwise
                error('Unknow type of message');
            end
            k=1;
                    for i=1:8:length(text_program_bin)
                if k==1
                    text_name_program(k)=char(bi2de(fliplr(text_program_bin(1:8))));
                else
                    text_name_program(k)=char(bi2de(fliplr(text_program_bin(i:i+7))));
                end
                k=k+1;
                    end

            
        otherwise
         sprintf('Erreur lors de la detection du type de groupe')
          
          
end


%end

