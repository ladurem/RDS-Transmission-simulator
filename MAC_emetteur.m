function [bits] = MAC_emetteur(step)
PI = [1 1 1 1 1 0 0 0 0 1 0 1 0 0 0 1];%Code PI RCF=F851
groupe_0A  = [0 0 0 0 0];%Informations
groupe_2A  = [0 0 1 0 0];%radiotext
groupe_4A  = [0 1 0 0 0];%Horloge/date
groupe_10A = [1 0 1 0 0];%Nom programe

PTY = [0 0 0 1 1];
%Type 0:
D0=1;D1=1;D2=0;D3=0;
TA=1;MS=1;TP=0;
%Stereo-Artificial Head-Not Compressed-StaticPTY
if(step>=1 && step<=4)
switch step
    case 1
        Decod = [D3 0 0];
        %On cherche p42, la valeur du code AF permettant de specifier 7 AF qui vont suivre: 231%
        AF_0 = double(dec2bin(231))-48;
        AF_1 = [0 0 0 0 1 1 1 0];%Frequence de base 88.9
        PSNS = [char2ascii('-') char2ascii('-')];%--
    case 2
        Decod = [D2 0 1];
        AF_0 = [0 1 0 0 0 1 1 1];%94.6
        AF_1 = [0 1 0 1 1 1 1 0];%96.9
        PSNS = [char2ascii('R') char2ascii('C')];%RC 
    case 3
        Decod = [D1 1 0];
        AF_0 = [0 0 0 0 0 1 0 1];%88.0
        AF_1 = [0 1 0 1 1 1 0 1];%96.8
        PSNS = [char2ascii('F') char2ascii('-')];%F -
    case 4
        Decod = [D0 1 1];
        AF_0 = [0 1 1 1 1 1 1 1];%100.2
        AF_1 = [0 0 0 1 1 1 1 0];%90.5
        PSNS = [char2ascii('-') char2ascii('-')];% - -
    
end
        bits=[PI groupe_0A TP PTY TA MS Decod AF_0 AF_1 PSNS];
elseif(step>=5 && step<=8)
        
        %%%%%%%%%% Groupe 2A
        switch step
            case 5
                offset = [0 0 0 0];
                TEXT = [char2ascii('M') char2ascii('U') char2ascii('Z') char2ascii('I')]; 
            case 6
                offset = [0 0 0 1];
                TEXT = [char2ascii('K') char2ascii('O') char2ascii('R') char2ascii('A')]; 
            case 7
                offset = [0 0 1 0];
                TEXT = [char2ascii('M') char2ascii('A') char2ascii(' ') char2ascii(' ')]; 
            case 8
                offset = [0 0 1 1];
                TEXT = [char2ascii('2') char2ascii('0') char2ascii('1') char2ascii('4')];      
        end
        bits=[PI groupe_2A TP PTY 0 offset TEXT];
        

elseif(step==9)
    
        Y=str2double(num2str(year(today)))-1900;%Nombres d'annees depuis 1900
        M=month(today);
        D=day(today);
        
        if (M==1 || M==2)
            L=1;
        else 
            L=0;
        end
        
        MJD =de2bi(14956+D+floor((Y-L)*365.25)+floor((M+1+(L*12))*30.6001),17);
        date = clock;
        heure = (de2bi(date(4),5));
        minute = (de2bi(date(5),6));

     local_time=[0 0 0 0 0 0]; %UTC +1
        bits=[PI groupe_4A TP PTY 0 0 0 MJD heure minute local_time];
elseif(step>=10 && step<=11)
    %Groupe10A
    %8 Caracteres
    %A/B flag a 0
    %on peut ecrire 2X4 caracteres
    if step ==10
       c0=0;
       text = [char2ascii('E') char2ascii('I') char2ascii('R') char2ascii('B')];
    else
        c0=1;
        text = [char2ascii('-') char2ascii('I') char2ascii('P') char2ascii('B')];
    end
    
    bits = [PI groupe_10A TP PTY 0 0 0 0 c0 text ];
else
    errordlg('Step out of range');
end
end