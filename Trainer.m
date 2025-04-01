clear all;
clc;

%% Cargar las imagenes de la Tuta Absoluta y extraer características.

%%% Carga Imagenes en celda %%%
directorio = fullfile(pwd, 'database'); % Directorio dentro del workspace donde se encuentran las imágenes
archivos = dir(fullfile(directorio, '*.*')); % Obtener la lista de archivos en el directorio
extensiones = {'.jpg', '.png', '.JPG', '.PNG'}; % Filtrar solo las imágenes
tuta_images = {};

for i = 1:length(archivos)
    [~, ~, ext] = fileparts(archivos(i).name);
    if ismember(ext, extensiones)
        tuta_images{end+1} = fullfile(directorio, archivos(i).name); % Agregar la ruta completa del archivo a la lista
    end
end

%%% Extrae características %%%
tuta_features = [];
for i = 1:length(tuta_images)
    img = Binario(tuta_images{i});
    features = ExtraerCaracteristicas(img);
    tuta_features = [tuta_features; features];
end

%% Cargar las imagenes de la Tuta Absoluta y extraer características. TODO: CAMBIAR POR FOTOS MÁS REALISTAS.

%%% Carga Imagenes en celda %%%
directorio = fullfile(pwd, 'database2'); % Directorio dentro del workspace donde se encuentran las imágenes
archivos = dir(fullfile(directorio, '*.*'));% Obtener la lista de archivos en el directorio
mariposa_images = {};

for i = 1:length(archivos)
    [~, ~, ext] = fileparts(archivos(i).name);
    if ismember(ext, extensiones)
        mariposa_images{end+1} = fullfile(directorio, archivos(i).name); % Agregar la ruta completa del archivo a la lista
    end
end

%%% Extrae características %%%
mariposa_features = [];
for i = 1:length(mariposa_images)
    img = Binario(mariposa_images{i});
    features = ExtraerCaracteristicas(img);
    mariposa_features = [mariposa_features; features];
end

%% Creación del modelo de red neuronal.

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

%% Prueba de inferencia del modelo. 
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