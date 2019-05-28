function [ Wpo ] = ucz( Wprzed, P, T, n )
%  Uczenie sieci
   %W1przed, W2przed - macierze wag przed uczeniem
   %P - ciag uczacy - przyklady
   %T - ciag uczacy - zadane wyjscia
   %n - liczba epok
   
   %W1po, W2po - macierz wag po uczeniu
   
   liczbaPrzykladow = size(P, 2)
   W=Wprzed;
   wspUcz=0.1;

   
   for i=1 : n;
       los = randperm(liczbaPrzykladow);
       nrPrzykladu = los(1)
       
       X = P(:,nrPrzykladu);
       Y =dzialaj1(W, X);
       X=[-1; X];

       
       D=T(:,nrPrzykladu)-Y;
       
       dW= wspUcz * X * D';
      
       
       W=W +dW;

   end
   
   Wpo=W;

end

