xNazwisk = 3;
xPrzykladow =19;



ciagUczacy= [1:1:19];            %wiersz
ciagUczacy=ciagUczacy(:);          %kolumna


indexUcz=1;
%--------------Ladowanie przykladowych podpisow do wektora uczacego
    for i=1:1:19  %inkrementacja drugiego cz³onu nazwy
        baseFileName = 'szymaniak';
        fileName = [baseFileName, num2str(i),'.png'];
        data=features(fileName);
        data=data(:);
        ciagUczacy = cat(2, ciagUczacy, data);
                    
    end
    
        for i=1:1:19  %inkrementacja drugiego cz³onu nazwy
        baseFileName = 'lisiecka';
        fileName = [baseFileName, num2str(i),'.png'];
        data=features(fileName);
        data=data(:);
        ciagUczacy = cat(2, ciagUczacy, data);
                    
        end
    
            for i=1:1:19  %inkrementacja drugiego cz³onu nazwy
        baseFileName = 'ostapiak';
        fileName = [baseFileName, num2str(i),'.png'];
        data=features(fileName);
        data=data(:);
        ciagUczacy = cat(2, ciagUczacy, data);
                    
    end
    
    
    
    koniec = size(ciagUczacy);
    ciagUczacy = ciagUczacy(:, 2:koniec(2));
    ciagWyjsc = zeros(xNazwisk, xNazwisk*xPrzykladow); %inicjalizacja ciagu zadanych wyjsc (uzupelnienie zerami)
    
    %--------------tworzenie prawidlowego ciagu uczacego--
   ciagWyjsc = zeros(xNazwisk,xPrzykladow);
     for i = 1:1:xNazwisk
         ciagWyjsc(i, i*xPrzykladow - (xPrzykladow-1): i*xPrzykladow) = 1;
     end
    
   %-------------------------------------------------------