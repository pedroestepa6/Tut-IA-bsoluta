clear all;
clc;

% Load and extract features for Tuta Absoluta
tuta_images = {'1.jpg', '2.png', '3.jpg', '4.jpg', '5.PNG', '6.PNG', '7.jpg', '8.jpg', '9.jpg', '10.jpg', '11.jpg', '12.jpg', '13.jpg'};
tuta_features = [];
for i = 1:length(tuta_images)
    img = Binario(tuta_images{i});
    features = ExtraerCaracteristicas(img);
    tuta_features = [tuta_features; features];
end

% Load and extract features for other butterflies
mariposa_images = {'Tigre.png', 'ap2.png', 'ap3.png', 'u2.png', 'Azul_comun.png', 'Cebra.png', 'c2.png', 'c3.png', 'Monarca2.jpg', 'mo2.png', 'mo3.png', 'Morpho_azul.png', 'm2.png'};
mariposa_features = [];
for i = 1:length(mariposa_images)
    img = Binario(mariposa_images{i});
    features = ExtraerCaracteristicas(img);
    mariposa_features = [mariposa_features; features];
end

% Combine features and create labels
x = [tuta_features; mariposa_features];
labels = [ones(size(tuta_features, 1), 1); 5*ones(size(mariposa_features, 1), 1)];

% Transpose for network input
x2 = x';
labels = labels';

% Train the network
net = feedforwardnet(100); % More suitable for classification
net = train(net, x2, labels);

%Save the network
% Guarda la red en un archivo .mat
save('red_tuta_absoluta.mat', 'net');

y_tuta=[];
for i=1:length(tuta_images)
    pB=Binario(tuta_images{i});
    pC=ExtraerCaracteristicas(pB);
    w=pC';
    y = net(w);
    y_tuta = [y_tuta y];
end

y_mari=[];
for i=1:length(tuta_images)
    pB=Binario(mariposa_images{i});
    pC=ExtraerCaracteristicas(pB);
    w=pC';
    y = net(w);
    y_mari = [y_mari y];
end