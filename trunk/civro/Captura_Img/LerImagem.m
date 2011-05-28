function [ imagem ] = LerImagem(numFrame)
global FILEFOLDER FILENAME TIPO
switch TIPO
    case {'jpg','jpeg'}
        imagem=imread(strcat(FILEFOLDER,FILENAME{numFrame}));
    case {'avi','mpeg'}
        imagem=read(FILENAME,numFrame);
    case 'camera'
        imagem = getdata(FILENAME,1);      
        disp('tempoRealFile')
    otherwise
        disp('N�o Foi poss�vel Realizar a opera��o')
end
end

