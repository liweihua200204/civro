function [ ] = decodificador( database )
cdata=figure(1);
fundo=imread('fundo.jpg');
[altura largura dimessao] = size(fundo);
for i=1:length(database)
    original=fundo;
    if(length(database(i).objetos)>0)
    for j=1:length(database(i).objetos)
        imagemObjeto=imread(database(i).objetos(j).imagemFile);
        x1= (database(i).objetos(j).BoundingBox(2));
        x2=(x1+database(i).objetos(j).BoundingBox(4));
        y1=(database(i).objetos(j).BoundingBox(1));
        y2=(y1+database(i).objetos(j).BoundingBox(3));
        if(x2>altura)
            x2=altura;
        end
        if(y2>largura)
            y2=largura;
        end
        database(i).objetos(j).imagemFile
        original(x1:x2,y1:y2,:)=imagemObjeto;
    end
    Exibir(cdata,database(i).objetos,original,i);
    pause(.00000000000001);
%     pause(.3);
    cla;
    end
    end
end

