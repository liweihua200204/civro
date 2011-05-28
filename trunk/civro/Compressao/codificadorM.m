function [caracteristicas] = codificadorM( caracteristicas,fundo,imagemAtual,numeroFrame)
global database numMovimento
        
if( (~isempty(caracteristicas(1).Area)))
    for i=1:length(caracteristicas)
        if( (isempty(caracteristicas(i).imagemFile)))
        imagemObjeto=imcrop(imagemAtual,caracteristicas(i).BoundingBox);
        imagemFile=strcat('frame',num2str(numeroFrame),'ob',num2str(i),'.jpg');
        imwrite(imagemObjeto,imagemFile);
        caracteristicas(i).imagemFile=imagemFile;
        else
        caracteristicas(i).imagemFile=caracteristicas(i).imagemFile;
        end       
    end
    database(numMovimento).frame=numeroFrame;
    database(numMovimento).objetos=caracteristicas;   
    database(numMovimento).fundo='fundo.jpg';
    numMovimento=numMovimento+1;
    end
end

