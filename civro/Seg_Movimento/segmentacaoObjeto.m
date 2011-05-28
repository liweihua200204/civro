function [result,B_atualizado] = segmentacaoObjeto(B,I,t)

%% Paramentros de Saida
    % result = imagem segmentada
    %B_atualizado = Corresponde ao novo modelo de fundo, aplicado
    % a equação .  Bt+1( i,j) = a * It ( i,j) + (a-1) * (Bt(i,j)
    
    
%% Mudança de Espaços de cores
       imFundo=converterEscalaCinza(B);
       imEntrada=converterEscalaCinza(I); 
%% Definicação do Limiar de corte 't'
t=(mean(mean(imFundo))/3);
%% Mudança de Espaços de cores
       result=(imabsdiff(imFundo,imEntrada)>t);
%% Atualizaçaão de Fundo
a=0 ;
B_atualizado = a*I + (1-a)*B;

% B_atualizado=imFundo;
% equivalente =subImagem=(imabsdiff(imFundo,imEntrada)>t);
% subImagem2=((imEntrada-imFundo)>t);
% result=(imFundo-imEntrada)>t;
% 


end

