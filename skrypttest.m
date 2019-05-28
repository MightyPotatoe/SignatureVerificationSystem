        data = imread('szymaniak2.png')
        data = rgb2gray(data);
            for i=1:1:50
                for j=1:1:50
                    if data(i,j) > 100
                        data(i,j) = 255;
                    end
                end
            end
        imshow(data)