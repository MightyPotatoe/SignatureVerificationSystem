function [ W1po, W2po ] = ucz( W1przed, W2przed, P, T, n )
%  Uczenie sieci
   %W1przed, W2przed - macierze wag przed uczeniem
   %P - ciag uczacy - przyklady
   %T - ciag uczacy - zadane wyjscia
   %n - liczba epok
   
   %W1po, W2po - macierz wag po uczeniu
   
   liczbaPrzykladow = size(P, 2)
   wierW2 = size(W2przed,1);
   W1=W1przed;
   W2=W2przed;
   wspUcz=0.1;

   
   for i=1 : n;
       nrPrzykladu = ceil(rand(1)*liczbaPrzykladow);
       X = P(:,nrPrzykladu);
       [Y1, Y2]=dzialaj(W1,W2, X);
       X1=[-1; X];
       X2=[-1;Y1];
       
       D2=T(:,nrPrzykladu)-Y2;
       D1=W2(2:wierW2,:) * D2;
       dW1= wspUcz * X1 * D1';
       dW2= wspUcz * X2 * D2';
      
       
       W1=W1 +dW1;
       W2=W2 +dW2;
   end
   
   W1po=W1;
   W2po=W2;

end

