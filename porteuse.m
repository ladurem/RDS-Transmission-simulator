function [ y_t ] = porteuse( x_t )
%PORTEUSE 
%   Place le signal sur la fr�quence porteuse adapt�e aux exigences de la
%   norme RDS

global fe Te fp

t = 0:Te:length(x_t)*Te-Te;
y_t = x_t.*sin(2*pi*fp*t);

%figure, plot(y_t);
end

