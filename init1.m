function [ W] = init1( S, K)
%   inicjalizacja sieci 1 warstwowej
%   wypelnia macierze wag wartosciami od -0.1 do 0.1

%   S - liczba wejsc do sieci
%   K1 - liczba neuronow w warstwie 1
%   K2 - liczba neuronow w warstwie 2 (wyjscia)


W=rand(S+1,K)*0.2-0.1;



end

