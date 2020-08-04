# Péndulo invertido

Este es un modelo de un **péndulo invertido sobre una plataforma móvil**. 
Este modelo exhibe cuatro ecuaciones diferenciales que representan las dinámicas de los **cuatro estados** del sistema. 
Se realiza la simulación numérica de las ecuaciones diferenciales 
tanto para el modelo no lineal como para su versión linealizada.

Para simular un sistema no lineal controlado, se
requieren dos programas que llamaremos el *programa de
simulación* y el *sistema de control* (o `function`).
El programa de simulación permite definir los lineamientos
básicos de la simulación: tiempo de simulación (inicial y
final), condiciones iniciales y tipo de algoritmo de simulación,
inclusive podemos definir los parámetros del sistema controlado
y hasta graficar los resultados de la simulación.

El programa `spend.m` permite simular el modelo no lineal,
`mpend.m` contiene el modelo no lineal del sistema y
`lpend.m` genera la comparación entre el modelo lineal
y el modelo no lineal. Nota: el símbolo `%` al comienzo de
una línea indica los comentarios que se hacen en pro de claridad.

Ejecútelos en este orden:
```
> spend
> lpend
```


## Para ir más allá
Una versión más elaborada de este ejemplo, incluyendo una animación usando [ImageMagick](http://www.imagemagick.org/script/convert.php)
y su control por realimentación del vector de estados, 
se consigue en esta 
[entrada de mi blog](https://www.controldesistemasnolineales.com/2015/02/13/animacion-del-control-de-un-pendulo-invertido/). 
