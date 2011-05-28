function [caracteristicas] = codificador( caracteristicas,fundo,imagemAtual,numeroFrame)
global database numMovimento
        
if( (~isempty(caracteristicas(1).Area)))
    for i=1:length(caracteristicas)
        imagemObjeto=imcrop(imagemAtual,caracteristicas(i).BoundingBox);
        imagemFile=strcat('frame',num2str(numeroFrame),'ob',num2str(i),'.jpg');
        imwrite(imagemObjeto,imagemFile);
        caracteristicas(i).imagemFile=imagemFile;
    end
    database(numMovimento).frame=numeroFrame;
    database(numMovimento).objetos=caracteristicas;   
    database(numMovimento).fundo='fundo.jpg';
    numMovimento=numMovimento+1;
    
end
end

