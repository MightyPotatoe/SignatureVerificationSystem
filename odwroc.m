function [ wyjscie ] = odwroc( macierz )

rozmiar = size(macierz);
%ODWROC Summary of this function goes here
%   Zamienia 0 na 1
    for x=1: 1 : rozmiar(1)
        for y=1:1:rozmiar(2)
            if macierz(x,y) == 1
                macierz(x,y) = 0;
            else
                macierz(x,y)=1;
            end
        end
    end

        
    wyjscie = macierz;
end

