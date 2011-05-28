function [] = Exibir( fig_data,caracteristicas,bn,x)

imshow(bn);
set(0, 'CurrentFigure', fig_data);
hold on
%% Númeração do Frame x
text(10, 10, sprintf('%04d', x), 'Color', 'g', 'Fontsize', 15);
if( (~isempty(caracteristicas(1).Area)))
for n=1:length(caracteristicas)
    %% Retângulo Mínimo
     if(isempty(caracteristicas(n).Corresponde))
        rectangle('Position',caracteristicas(n).BoundingBox,'EdgeColor','r','LineWidth',2);
     else
       rectangle('Position',caracteristicas(n).BoundingBox,'EdgeColor','g','LineWidth',2);
    end
    %% Centro de Massa
    x=caracteristicas(n).Centroid(1);
    y=caracteristicas(n).Centroid(2); 
    %% Númeração do Objeto
     h=text(x, y,sprintf('%04d',caracteristicas(n).Corresponde), 'Color', 'b', 'Fontsize', 15);
end
hold on
%% Exibir bordas dos objetos
% B=bwboundaries(bn);
% for k = 1:length(B)
%     boundary = B{k};
%    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2);
% end
% hold on
end
end

