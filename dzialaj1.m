function [ Y ] = dzialaj1( W, WEJSCIE )
%   symuluje dzialanie sieci 1 warstwowej
    %W1-W2 - macierze wag odpowiednich warstw
    %wejscie - wektor wejsciowy
    
    %Y1-Y2 - wektor sygnalow na wyjsciu odpowiedniej warstwy
    
    beta=5;
    X=[-1 ; WEJSCIE];
    U= W' * X;
    Y=1./(1+exp(-beta*U));
           

end

