package pkg002;

import java.util.Scanner;


public class P002 {

    /*
    
    1.- Pide una frase por teclado y una letra por teclado. Calcula y muestra por
    pantalla cuantas veces aparece la letra en la frase.
    
    2.- Crea un array de 10 números pedidos por teclado. Muestra los elementos
    del array de menor a mayor. Vuelca los elementos de este array en otro de
    iguales dimensiones, de tal manera que el último pasa a ser el primero, el
    penúltimo el segundo y así sucesivamente. Por ultimo muestra los elementos
    de este segundo array de menor posición a mayor.
    
    3.- Desarrolla un programa java para ser usado por los camareros de un
    restaurante, que sirva para tomar nota de los menús que los clientes van a
    tomar.
    • Primer dato a introducir por el camarero es el número de comensales
    que tendrá que estar en el rango de 1-5, ya que no hay mesas de más
    de cinco comensales. El valor introducido debe asegurarse de que se
    encuentra en el rango definido.
    • Entonces el camarero tiene que introducir el menú seleccionado por
    cada cliente.
    • Tenemos tres menus: #1,#2 y #3. Puedes identificar cada menú por el
    número: menú 1, menú 2 o menú 3.
    • Una vez introducidos todos los datos, el programa imprimirá por
    pantalla los menús solicitados por cada comensal.
    • Tienes que emplear un array para registrar los menus que tomará cada
    comensal. Ten en cuenta que la dimensión de dicho array tendrá que
    definirse en ejecución, ya que no sabemos a priori cuantos comensales
    vamos a tener.
    
    4.- Pide por teclado la altura de N personas y calcular la altura media.
    Calcular cuántas personas tienen una altura superior a la media y cuántas
    tienen una altura inferior a la media. El valor de N se pide por teclado y debe
    ser entero positivo.
    
    5.- Pide 10 números por teclado y los almacenas en un array. Recorre el
    array y dime en qué posición se encuentra el mayor número y en que
    posición se encuentra el menor número.
    
    */
    
    public static void main(String[] args) {
        Scanner rd = new Scanner(System.in);
        int value;
        rd.useDelimiter("\n");
        System.out.println("Introduce una opción: ");
        value = rd.nextInt();
        
        switch (value) {
            case 1:

                int cont = 0;
                System.out.println("Introduce una frase: ");
                String frase = rd.next();
                System.out.println("Introduce un carácter: ");
                char caracter = rd.next().charAt(0);
                
                for (int i = 0; i < frase.length(); i++) {
                    if (frase.charAt(i) == caracter) {
                        cont++;
                    }
                }
                System.out.println("El carácter " + caracter + " aparece " + cont + ""
                        + " veces en la frase " + frase);
                
                break;
                
            case 2:
 
                int [] numeros = new int [10];
                for (int i = 0; i < numeros.length; i++) {
                    System.out.print("\nnº: ");
                    numeros [i] = rd.nextInt();
                }
                
                // menor --> mayor
                for (int i = 0; i < numeros.length; i++) {
                    System.out.print(" " + numeros[i]);
                }
                
                System.out.println();
                
                // ultimo --> primero ...
                int [] numeros_2 = new int [10];
                int j = 0;
                for (int i = numeros_2.length-1; i >= 0; i-- , j++) {
                    numeros_2 [j] = numeros [i];
                }
                
                // menor --> mayor
                for (int i = 0; i < numeros_2.length; i++) {
                    System.out.print(" " + numeros_2[i]);
                }
                
                break;
                
            case 3:
                
                int comensales = 0, menu_Option;
                do {                    
                    System.out.println("numero de comensales:");
                    comensales = rd.nextInt();
                } while (comensales < 1 || comensales > 5);
                
                int [] Array_Comensales = new int [comensales];
                
                for (int i = 0; i < Array_Comensales.length; i++) {
                    do {                        
                        System.out.println("Menu del comensal " + (i+1) + ":");
                        menu_Option = rd.nextInt();
                    } while (menu_Option < 1 || menu_Option > 3);
                    Array_Comensales [i] = menu_Option;
                }
                
                for (int i = 0; i < Array_Comensales.length; i++) {
                    System.out.println("Comensal " + (i+1) + " menú " + Array_Comensales[i]);
                }
                
                 break;
            case 4:
                
                int num_Personas, superior = 0, inferior = 0, media = 0, suma = 0;
                
                do {                    
                    System.out.println("numero de personas: ");
                    num_Personas = rd.nextInt();
                } while (num_Personas < 0);
                
                int personas [] = new int [num_Personas];
                
                for (int i = 0; i < num_Personas; i++) {
                    System.out.println("Introduce la altura: ");
                    personas [i] = rd.nextInt();
                }
                
                for (int i = 0; i < personas.length; i++) {
                    suma += personas[i];
                }
                media = (suma/personas.length);
                for (int i = 0; i < personas.length; i++) {
                    if (personas[i] > media) {
                        superior++;
                    } else if (personas[i] < media){
                        inferior++;
                    }
                }
                System.out.println("La media es " + media);
                System.out.println("Las superiores " + superior);
                System.out.println("Las inferiores " + inferior);
                
                break;
            case 5:
                
                int [] array_3 = new int [10];
                int mayor=0, menor=0, posicion_Mayor=0, posicion_Menor=0;
                
                for (int i = 0; i < array_3.length; i++) {
                    System.out.println("numero: ");
                    array_3 [i] = rd.nextInt();
                }
                mayor = array_3[0];
                menor = array_3[0];
                
                for (int i = 0; i < array_3.length; i++) {
                    if (array_3[i] > mayor) {
                        mayor = array_3[i];
                        posicion_Mayor = i;
                    } else if (array_3[i] < menor){
                        menor = array_3[i];
                        posicion_Menor = i;
                    }
                }
                
                System.out.println("El mayor numero esta en la posicion " + posicion_Mayor);
                System.out.println("El menor numero esta en la posicion " + posicion_Menor);
                
                break;
            default:
                throw new AssertionError();
        } 
    }
}