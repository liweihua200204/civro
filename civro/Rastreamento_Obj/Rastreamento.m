function [caracteristicasAtualizadas,numObjeto] = Rastreamento( caracteristicasAnterior,objetosIdentificadosCorrente,numObjeto,imagem)
%% Paramentros de entradas
%caracteristicasAnterior-> Caracteristicas do quadro I(n-1)
%objetosIdentificadosCorrente-> Caracteristicas do quadro I(n) ( corrente )
%% Paramentros de Saida
%caracteristicasAtualizadas = (caracteristicas) informações sobres os objetos identificados
% delay=10;
delay=10;
caracteristicasCorrente=extrairCaracteristicas(objetosIdentificadosCorrente);

if( (~isempty(caracteristicasAnterior(1).Area)) && (~isempty(caracteristicasCorrente(1).Area)))
    d(length(caracteristicasAnterior),length(caracteristicasCorrente))=0;
    for i=1:length(caracteristicasAnterior)
        menor=100;
        if(isempty(caracteristicasAnterior(i).Corresponde))
            if((isempty(caracteristicasAnterior(i).Time)))
                time= 1;
            else
                if(caracteristicasAnterior(i).Time>delay)
                    corresponde=numObjeto;
                    time=caracteristicasAnterior(i).Time+1;
                    numObjeto=numObjeto+1;
                else
                    time= caracteristicasAnterior(i).Time+1;
   
                end
            end
            
        else
            corresponde=caracteristicasAnterior(i).Corresponde;
            time=caracteristicasAnterior(i).Time+1;
        end
        for j=1:length(caracteristicasCorrente)
            d(i,j)= distancia( caracteristicasAnterior(i).Centroid,caracteristicasCorrente(j).Centroid);
            if(d(i,j)<menor)
                if(abs(caracteristicasAnterior(i).Centroid(1)-caracteristicasCorrente(j).Centroid(1))<=50 && abs(caracteristicasAnterior(i).Centroid(2)-caracteristicasCorrente(j).Centroid(2))<=50)
                    if(time>delay+1)
                        caracteristicasCorrente(j).Corresponde=corresponde;
                        caracteristicasCorrente(j).Time=time;
                        menor=d(i,j);
                    else
                        menor=d(i,j);
                        caracteristicasCorrente(j).Time=time;
                    end
                end
            end
        end
        %          corresponde=caracteristicasAnterior(i);
    end
    caracteristicasAtualizadas=caracteristicasCorrente;
    d;
else
    caracteristicasAtualizadas=caracteristicasCorrente;
end

end

function [ d ] = distancia( ponto_c1 , ponto_c2)
%ponto_c1(1) = x
%ponto_c1(2) = y
d = sqrt ( (ponto_c2(1)-ponto_c1(1))^2 + (ponto_c2(2) - ponto_c2(2)));
end


