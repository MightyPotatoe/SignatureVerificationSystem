function [ loadIm ] = loadImage( Im )

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
           
loadIm = imresize(loadIm, [50 50]);
loadIm = double(loadIm);
%----threshold
        for i=1:1:50
            for j=1:1:50
                if loadIm(i,j) > 200
                    loadIm(i,j) = 255;
                end
            end
        end  
end