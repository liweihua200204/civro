function [ imagemSaida ] = converterEscalaCinza( imagem )

%% Mudan�a de Espa�os de cores
    if size(imagem,3)==3 %RGB imagem
       imagemSaida=rgb2gray(imagem);
       else
        imagemSaida=imagem;
    end 

end

