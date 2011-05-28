function [ ] = decodificadorM( database )
cdata=figure(1);
fundo=imread('fundo.jpg');
[altura largura dimessao] = size(fundo);
for i=1:length(database)
    original=fundo;
    if(length(database(i).objetos)>0)
    for j=1:length(database(i).objetos)
        database(i).objetos(j).imagemFile
        imagemObjeto=imread(database(i).objetos(j).imagemFile);
        teste=imresize(imagemObjeto,[database(i).objetos(j).BoundingBox(4)  database(i).objetos(j).BoundingBox(3)]);
        [a b c ] = size(teste);
        x1= (database(i).objetos(j).BoundingBox(2));
        x2=x1+a;
        y1=(database(i).objetos(j).BoundingBox(1));
        y2=(y1+b);

        if(x2>altura)
            x2=altura
        else
            x2=x2-1
        end
            
        if(y2>largura)
            y2=largura
        else
             y2=y2-1
        end
        
        [a b c ] = size(teste)
        database(i).objetos(j).imagemFile;
        original(x1:x2,y1:y2,:)=teste;        
    end
    Exibir(cdata,database(i).objetos,original,i);
%     pause(.00000000000001);
% %     pause(.3);
%     cla;
    end
end
     Exibir(cdata,database(i).objetos,original,i);
end


