function [x]=Binario(imagen)
    Original=imread(imagen);
    I = imresize(Original,[150,150]);
    %figure, imshow(I)
    Grises=im2gray(I);
    II = imresize(Grises,[150,150]);
    %figure, imshow(II)
    Binario=imbinarize(II);
    III = imresize(Binario,[150,150]);
    %figure, imshow(BBB);
    x=III;
end