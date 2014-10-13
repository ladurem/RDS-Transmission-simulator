function [ pty_string ] = ptytochar(pty_bin)
%PTYTOCHAR Summary of this function goes here
%   Detailed explanation goes here
switch bin2dec(num2str(pty_bin))
    case 1
        pty_string='News';
    case 2
        pty_string='Affaires courantes';
    case 3 
        pty_string='Informations';
    case 4 
        pty_string='Sports';
    case 5
        pty_string='Education';
    case 6
        pty_string='Drames';
    case 7 
        pty_string='Culture';
    case 8
        pty_string='Sciences';
    case 9 
        pty_string = 'Varié';
    case 10 
        pty_string = 'Pop Music';
    case 11 
        pty_string = 'Rock Music';
    case 12 
        pty_string = 'Musique facile';
    case 13 
        pty_string = 'Classique';
    case 14 
        pty_string = 'Classique serieux';
    case 15 
        pty_string = 'Autres';
     
    otherwise
          pty_string='Inconnu';  
    
    
end

end

