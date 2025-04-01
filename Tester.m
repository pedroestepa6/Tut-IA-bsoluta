% Carga la red pre-entrenada (sin volver a entrenar)
load('red_tuta_absoluta.mat', 'net');  

% Test on user input
img = input('Por favor ingrese la imágen a evaluar > ');
pB=Binario(img);
pC=ExtraerCaracteristicas(pB);
w=[pC'];
try
  
    % Classify
    y = net(w)
    if y<4
        disp('Me temo que su plantación está infectada con Tuta Absoluta');
        figure, imshow('plaga.jpg');
    else
        disp('Falsa alarma, era una mariposa :)');
        figure, imshow('negativo.jpg');
    end
catch
    disp('Error');
end