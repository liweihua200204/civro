function [result B_atualizado objetosIdentificados] = SegmentacaoMovimento( B,I)
%% Paramentros de entradas
    %B -> Modelo corrente do fundo
    %I -> Quadro de entrada corrente
%% Paramentros de Saida
    % result = imagem segmentada
    %B_atualizado = Corresponde ao novo modelo de fundo   
%% Segmentação de Objetos
[result B_atualizado]=segmentacaoObjeto(B,I);
% imwrite(result,'resultadoSegementacao.jpg');
%% Pós-Segmentação
[result objetosIdentificados]=posSegmentacao(result);
% imwrite(objetosIdentificados,'resultadoPosSegmentacao.jpg');
end