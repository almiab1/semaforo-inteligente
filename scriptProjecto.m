%% -------------------------------------------------------------------------------------------------
%
% Projecto Practicas TDI
% Asignatura: Tratamiento de Imagen: Visi�n Artificial
% Autores: Alejandro Mira Abad y Brian Calabuig Chafer
% Descripci�n: Detecci�n de vehiculos y personas para cambiar el estado de un sem�foro
%
%% -------------------------------------------------------------------------------------------------
% Configuraci�n inicial de prueba
clear
close all

I = imread('imagPasoCebra2.jpg'); % Cargamos la imagen
detectorVehicle = vehicleDetectorACF('full-view'); % Cargamos el detector de vehiculos
detectorPeople = peopleDetectorACF('inria-100x41'); % Cargamos el detector de personas
%% -------------------------------------------------------------------------------------------------
% Deteccion vehiculos
[cajasVehiculos,puntuacionVehiculos] = detect(detectorVehicle,I); % Activamos el detector

p0 = puntuacionVehiculos;
for i = 1:size(puntuacionVehiculos)
    if ( p0(i) < 20)
        cajasVehiculos(i,:) = [];
        puntuacionVehiculos(i) = [];
    end
end

I = insertObjectAnnotation(I,'rectangle',cajasVehiculos,p0); % Insertamos loos contenedores con los valores 

figure
imshow(I)
title('Detecci�n de vehiculos y detecci�n de puntuaci�n')
%% -------------------------------------------------------------------------------------------------
% Deteccion personas
[cajasPersonas,puntuacionPersonas] = detect(detectorPeople,I);
if not (isempty(cajasPersonas))
I = insertObjectAnnotation(I,'rectangle',cajasPersonas,puntuacionPersonas);
end
figure
imshow(I)
title('Detecci�n de vehiculos y personas con su puntuaci�n')


