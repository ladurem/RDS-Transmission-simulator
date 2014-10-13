function [ ascii ] = char2ascii(char )
ascii = fliplr(de2bi(double(char),8));
end

