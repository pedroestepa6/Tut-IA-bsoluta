# Tut-IA-bsoluta

## Este repositorio contiene:

### Dataset:

*13 Imágenes de plaga Tuta Absoluta o insecto del tomate.
*13 Imágenes de mariposas.

### Binario.m (función):
Descripción: carga una imagen devolviendo la matriz binaria de la imagen en resolución 500x500. 
-Input: Imagen en cualquier formato y resolución.
-Output: Imagen convertida a binario con resolución 500x500.

### ExtraerCaracteristicas.m (función):
Descripción: Devuelve un array con las características de la imagen. (extractLBPFeatures)
-Input: Imagen binaria 500x500.
Output: Array con las características de la imagen.

### Trainer.m
Descripción: Script que carga la base de datos de imagenes para crear un modelo de red neuronal convolucional que distinga entre varios tipos de insectos. El modelo se guarda en un fichero .mat en el directorio del proyecto.

### Tester.m 
Descripción: Se ejecuta el modelo entrenado para las imagenes de prueba.
