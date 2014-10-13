function [ x_r ] = r_porteuse( y_r )
%R_PORTEUSE
%   Permet le retour en bande de base sdu signal ayant traversé la canal
%   gaussien

global fe Te fp

t = Te:Te:length(y_r)*Te;
x_r = y_r.*sin(2*pi*fp*t);

%figure, plot(x_r);
end

