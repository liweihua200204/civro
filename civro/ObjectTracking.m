function [ X ] = ObjectTracking(tipo,caminho)
X=0; 
global NE 

%% Inicialização
[fundo,B_atualizado,caracteristicasAnt,numObjeto,cdata]=Inicializacao(tipo,caminho);
x=2;%Frame corrente
%%
for n=0:1:NE
    imagem=LerImagem(n);
    %% Segmentação
    % result = imagem segmentada
    % B_atualizado = atualização do plano de fundo
    [result,B_atualizado objetosIdentificadosCont]= SegmentacaoMovimento(fundo,imagem);
    fundo=B_atualizado;
    %% Rastrear Objetos
    [caracteristicasAtualizadas,numObjeto]=Rastreamento (caracteristicasAnt,objetosIdentificadosCont,numObjeto,imagem);
    caracteristicasAnt=caracteristicasAtualizadas;
    Exibir(cdata,caracteristicasAtualizadas,imagem,x);
    %% Gerar Video
    pause (0.0000000001);
    F(x-1)=getframe(cdata);
    x=x+1;
end
    %% Gerar Video
  movie(F,x) % Play t
  movie2avi (F,'teste.avi');
  X=F;
end

%% Inicialização
function [fundo,B_atualizado,caracteristicasAnt,numObjeto,cdata] = Inicializacao (tipo,caminho)
        CapturaImagem(tipo,caminho);
        fundo=LerImagem(1);
        imshow(fundo);
        [result,B_atualizado objetosIdentificadosAnt]= SegmentacaoMovimento(fundo,fundo);
        caracteristicasAnt=extrairCaracteristicas(objetosIdentificadosAnt);
        numObjeto=1;
        cdata=figure(1);
        set(cdata, 'WindowButtonDownFcn', 'store_pixel_coord(get(gca, ''CurrentPoint''))');
        Exibir(cdata,caracteristicasAnt,fundo,1);
    end

