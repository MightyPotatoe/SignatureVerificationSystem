function [output] = features(Im)


loadIm = imread(Im);            %wczytanie obrazu
loadIm = rgb2gray(loadIm);      %konwersja do skali szarosci
loadIm = imadjust(loadIm);    %poprawienie kontrastu



%----zmienne polozenia krawedzi objektu
imSize = size(loadIm);
left = imSize(2);
bottom =0;
right = 0;
top = imSize(1);
%----------------------------------
%----kadrowanie obrazu
for i = 1:1:imSize(1)
    for j = 1:1:imSize(2)
        if(loadIm(i,j) < 200)
            if(i > bottom)
                bottom = i;
            end
            
            if(i < top)
                   top = i;
            end
            
            if(j > right)
                right = j;
            end
            
            if(j < left)
                left = j;
            end
        end
    end
end
loadIm = loadIm(top:bottom, left:right);

loadIm = im2bw(loadIm);
loadIm = odwroc(loadIm);

rozmiar = size(loadIm);

%--------HISTOGRAM PIONOWY----------
hist_poz = sum(loadIm);

max = 0;
for i = 1:1:rozmiar(2)
    if hist_poz(1,i) > max
        max = hist_poz(1,i);
        feature(1)= i;
    end
end


%--------HISTOGRAM PIONOWY----------
temp = loadIm';
hist_pion = sum(temp);

max = 0;
for i = 1:1:rozmiar(1)
    if hist_pion(1,i) > max
        max = hist_pion(1,i);
        feature(2)= i;
    end
end
%--------SRODEK MASY-----------
%dzielenie obrazu na 2 polowy
polowa = rozmiar(2)/2;
im1 = loadIm(:,1:polowa);
im2 = loadIm(:,polowa+1:rozmiar(2));

props = regionprops( double( im1 ), 'Centroid' );
feature(3) = props.Centroid(1);
feature(4) = props.Centroid(2);

props = regionprops( double( im2 ), 'Centroid' );
feature(5) = props.Centroid(1);
feature(6) = props.Centroid(2);

%---Rozmiar podpisu
props = regionprops( double( loadIm ));
feature(7) = (rozmiar(1) * rozmiar(2))/(props.BoundingBox(3)*props.BoundingBox(4));

%---stosunek szerokosci do dlugosci podpisu
feature(8) = rozmiar(1)/rozmiar(2);

%---Dzielenie obrazu na 3 czesci:
polowa = round(rozmiar(2)/3);
im1 = loadIm(:,1:polowa);
im2 = loadIm(:,polowa+1:2*polowa);
im3 = loadIm(:,2*polowa+1:rozmiar(2));
rozmiar_czesci1 = size(im1);
rozmiar_czesci2 = size(im2);
rozmiar_czesci3 = size(im3);
props = regionprops( double( im1 ));
feature(9) = (rozmiar_czesci1(1) * rozmiar_czesci1(2))/(props.BoundingBox(3)*props.BoundingBox(4));
props = regionprops( double( im2 ));
feature(10) = (rozmiar_czesci2(1) * rozmiar_czesci2(2))/(props.BoundingBox(3)*props.BoundingBox(4));
props = regionprops( double( im3 ));
feature(11) = (rozmiar_czesci3(1) * rozmiar_czesci3(2))/(props.BoundingBox(3)*props.BoundingBox(4));

%------
% props = regionprops( double( im1 ));
% srodek1 = round(props.Centroid(1));
% im1_1 = im1(1:srodek1,:);
% rozmiar_czesci1_1 = size(im1_1);
% im1_2 = im1(srodek1+1:rozmiar_czesci1(1),:);
% rozmiar_czesci1_2 = size(im1_2);
% props = regionprops( double( im1_1 ));
% feature(12) = (rozmiar_czesci1_1(1) * rozmiar_czesci1_1(2));
% props = regionprops( double( im1_2 ));
% feature(13) = (rozmiar_czesci1_2(1) * rozmiar_czesci1_2(2));
% 
% 
% props = regionprops( double( im2 ));
% srodek1 = round(props.Centroid(1));
% im2_1 = im2(1:srodek1,:);
% rozmiar_czesci2_1 = size(im2_1);
% im2_2 = im2(srodek1+1:rozmiar_czesci1(1),:);
% rozmiar_czesci2_2 = size(im2_2);
% props = regionprops( double( im2_1 ));
% feature(14) = (rozmiar_czesci2_1(1) * rozmiar_czesci2_1(2));
% props = regionprops( double( im2_2 ));
% feature(15) = (rozmiar_czesci2_2(1) * rozmiar_czesci2_2(2));
% 
% props = regionprops( double( im3 ));
% srodek1 = round(props.Centroid(1));
% im3_1 = im3(1:srodek1,:);
% rozmiar_czesci3_1 = size(im3_1);
% im3_2 = im3(srodek1+1:rozmiar_czesci1(1),:);
% rozmiar_czesci3_2 = size(im3_2);
% props = regionprops( double( im3_1 ));
% feature(16) = (rozmiar_czesci3_1(1) * rozmiar_czesci3_1(2));
% props = regionprops( double( im3_2 ));
% feature(17) = (rozmiar_czesci3_2(1) * rozmiar_czesci3_2(2));


%------------ czestotliwosc zmian wartosci z 0 na 1 na dlugosc, szerokosc,
%oraz liczba zmian

rozmiar = size(loadIm);
licznik = 0;
for i = 1:1:rozmiar(1)
    for j=2:1:rozmiar(2)
        if loadIm(i,j) == loadIm(i,j-1)
        else
            licznik = licznik +1;
        end   
    end
    srednia(i) = licznik/rozmiar(2);
    suma(i) = licznik;
end
feature(12) = mean(srednia);
feature(13) = mean(licznik);
licznik = 0;

for i=1:1:rozmiar(1)
    for j=rozmiar(2)-1:-1:1
        if loadIm(i,j) == loadIm(i,j+1)
        else
            licznik = licznik +1;
        end   
    end
    srednia(i) = licznik/rozmiar(2);
    suma(i) = licznik;
end
feature(14) = mean(srednia);
feature(15) = mean(licznik);

rozmiar = size(loadIm);
licznik = 0;
clear srednia;
clear suma;

for i = 1:1:rozmiar(2)
    for j=2:1:rozmiar(1)
        if loadIm(j,i) == loadIm(j-1,i)
        else
            licznik = licznik +1;
        end   
    end
    srednia(i) = licznik/rozmiar(2);
    suma(i) = licznik;
end
feature(16) = mean(srednia);
feature(17) = mean(licznik);
licznik = 0;

for i= 1:1:rozmiar(2)
    for j=rozmiar(1)-1:-1:1
        if loadIm(j,i) == loadIm(j+1,i)
        else
            licznik = licznik +1;
        end   
    end
    srednia(i) = licznik/rozmiar(2);
    suma(i) = licznik;
end

feature(18) = mean(srednia);
feature(19) = mean(licznik);



%feature
%1 - max histogram pion
%2 - max histogram poz
%3 - srodek masy pierwszej polowy x
%4 - srodek masy pierwszej polowy y
%5 - srodek masy drugiej polowy x
%6 - srodek masy drugiej polowy y
%7 - stosunek rozmiaru obrazu do rozmiaru obrazu w bounding box
%8 - stosunek szerokosci do dlugosci podpisu
%9,10,11 - tri-surface - podzielony obraz na 3 czesci i liczony stosunek czesci
%do bounding box.
%12,13,14,15,16,17 - z 3 fragmentow licze srodek masy, dziele kazdy
%wzgledem poziomej linii przechodzacej przez srodek masy i licze obszar
%podpisu (stosunek)

output = feature;
end

    