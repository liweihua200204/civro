function [ result objetosIdentificados] = posSegmentacao( imagem )

%% P�s-Segmenta��o
%Fechamento de Regi�es
se = strel('disk',10);
result = imclose(imagem,se); 
%Elimin��o de �rea menor que 30 pixels
result=bwareaopen(result,30);
%Identifica��o e Objetos
objetosIdentificados = identificarObjetos(result);
end

