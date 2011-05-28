function [ result objetosIdentificados] = posSegmentacao( imagem )

%% Pós-Segmentação
%Fechamento de Regiões
se = strel('disk',10);
result = imclose(imagem,se); 
%Eliminção de Área menor que 30 pixels
result=bwareaopen(result,30);
%Identificação e Objetos
objetosIdentificados = identificarObjetos(result);
end

