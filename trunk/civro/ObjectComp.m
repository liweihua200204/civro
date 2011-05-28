function [X] = ObjectComp(tipo,caminho)
X=0; 
clear global;
global NE database numMovimento
numMovimento=1;
%% Inicialização
[fundo,B_atualizado,caracteristicasAnt,numObjeto,cdata]=Inicializacao(tipo,caminho);
x=2;%Frame corrente

%%
for n=1:1:NE
    %% Limpar marcações e Mostra nova imagem
    imagem=LerImagem(n);
    %% Segmentação
    % result = imagem segmentada
    % B_atualizado = atualização do plano de fundo
    [result,B_atualizado objetosIdentificadosCont]= SegmentacaoMovimento(fundo,imagem);
    fundo=B_atualizado;
    %% Rastrear Objetos
    [caracteristicasAtualizadas,numObjeto]=Rastreamento (caracteristicasAnt,objetosIdentificadosCont,numObjeto,imagem);
    caracteristicasAnt=codificador(caracteristicasAtualizadas,fundo,imagem,x);
%     Exibir(cdata,caracteristicasAtualizadas,imagem,x);
        %% Gerar Video
%     pause (0.0000000001);
%     F(x-1)=getframe(cdata);
    x=x+1;
end
save('compressao.mat','database');
%% Gerar Video
%  movie(F,x) % Play t
%  movie2avi (F,'teste.avi');
% X=F;
end

%% Inicialização
function [fundo,B_atualizado,caracteristicasAnt,numObjeto,cdata] = Inicializacao (tipo,caminho)
        CapturaImagem(tipo,caminho);
        fundo=LerImagem(1);
        [result,B_atualizado objetosIdentificadosAnt]= SegmentacaoMovimento(fundo,fundo);
        caracteristicasAnt=extrairCaracteristicas(objetosIdentificadosAnt);
        numObjeto=1;
        cdata=figure(1);
        set(cdata, 'WindowButtonDownFcn', 'store_pixel_coord(get(gca, ''CurrentPoint''))');
        imwrite(fundo,'fundo.jpg');
      %         Exibir(cdata,caracteristicasAnt,fundo,1);
    end

