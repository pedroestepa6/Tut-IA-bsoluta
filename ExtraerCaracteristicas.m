function [x]=ExtraerCaracteristicas(imagen)
    caracteristicas = extractLBPFeatures(imagen,'CellSize',[150 150],'Normalization','None');
    x=caracteristicas;
end