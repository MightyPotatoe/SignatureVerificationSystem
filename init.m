function [ W1, W2] = init( S, K1, K2)
%   inicjalizacja sieci 2 warstwowej
%   wypelnia macierze wag wartosciami od -0.1 do 0.1

%   S - liczba wejsc do sieci
%   K1 - liczba neuronow w warstwie 1
%   K2 - liczba neuronow w warstwie 2 (wyjscia)


W1=rand(S+1,K1)*0.2-0.1;
W2=rand(K1+1,K2)*0.2-0.1;


end

