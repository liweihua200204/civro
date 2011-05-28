function [ objetosIdentificados ] = identificarObjetos(imagem)
%% Paramentros de entradas
    %imagem-> Quadro de entrada corrente segmentado
%% Paramentros de Saida
    %saida = (objetosIdentificados) informações sobres os objetos identificados
bn=imagem;
%% Eliminar áreas menores a 300 pixels
bn=bwareaopen(bn,300);
%imshow(bn)
%% Identificar Objetos Conectados
[L Ne]=bwlabel(bn);
objetosIdentificados=L;
% imshow(label2rgb(L));
end

