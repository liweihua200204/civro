function [ imagemSaida ] = converterEscalaCinza( imagem )

%% Mudança de Espaços de cores
    if size(imagem,3)==3 %RGB imagem
       imagemSaida=rgb2gray(imagem);
       else
        imagemSaida=imagem;
    end 

end

