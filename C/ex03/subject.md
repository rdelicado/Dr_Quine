• The executable must be named Sully.
• When executed the program writes in a file named Sully_X.c/Sully_X.s. The
X will be an interger given in the source. Once the file is created, the program
compiles this file and then runs the new program (which will have the name of its
source file).
• Stopping the program depends on the file name : the resulting program will be
executed only if the integer X is greater or equals than 0.
• An integer is therefore present in the source of your program and will have to
evolve by decrementing every time you create a source file from the execution of
the program.
• You have no constraints on the source code, apart from the integer that will be
set to 5 at first.

Creación de archivos:

El programa debe escribir su propio código fuente en un archivo llamado Sully_X.c, donde X es un entero que comienza en 5 y decrece con cada ejecución.
Compilación y ejecución:

Una vez que el programa genera el archivo fuente Sully_X.c, debe compilar este archivo en un ejecutable Sully_X y ejecutar dicho ejecutable.
Condición de parada:

El programa deja de ejecutarse cuando X es menor que 0. Esto evita un bucle infinito.
Modificación del entero:

El valor de X en el programa generado debe reflejar el decremento correspondiente. Por ejemplo:
El programa original tiene int i = 5;.
El archivo Sully_4.c tiene int i = 4;.