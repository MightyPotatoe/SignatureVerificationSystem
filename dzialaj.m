function [ Y1, Y2] = dzialaj( W1, W2, WEJSCIE )
%   symuluje dzialanie sieci 2 warstwowej
    %W1-W2 - macierze wag odpowiednich warstw
    %wejscie - wektor wejsciowy
    
    %Y1-Y2 - wektor sygnalow na wyjsciu odpowiedniej warstwy
    
    beta=5;
    X1=[-1 ; WEJSCIE];
    U1=W1' * X1;
    Y1=1./(1+exp(-beta*U1));
    
    X2=[-1 ; Y1];
    U2=W2' * X2;
    Y2=1./(1+exp(-beta*U2));
           

end

