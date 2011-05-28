function [ caracteristicas ] = extrairCaracteristicas( objetosIdentificados )
%% Encontrar propiedades de la imagen
caracteristicas=regionprops(objetosIdentificados);
caracteristicas(1).Corresponde=[];
caracteristicas(1).Time=0;
caracteristicas(1).imagemFile=[];
end

