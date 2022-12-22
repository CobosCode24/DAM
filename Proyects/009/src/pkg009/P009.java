package pkg009;

import java.util.Scanner;


public class P009 {

    /*
    
    Crea una aplicación en java con un menu de 5 opciones detalladas a continuación:
    
    1.- Dado un array de números de 5 posiciones con los siguiente valores {1,2,3,4,5},
    guardar los valores de este array en otro array distinto pero con los valores invertidos,
    es decir, que el segundo array debera tener los valores {5,4,3,2,1}.Muestra el contenido
    de ambos arrays uno debajo del otro 
    
    2.- Pide por teclado un numero N por teclado. Pide el peso de cada persona e introdúcelo
    en el array de N personas. Calcula el peso medio de las personas y crea otro array donde 
    este el peso de las personas cuyo peso sea superior al peso medio 
    
    3.- Crea un array de números de 25 posiciones, que contendrá los números del 70 al 94. 
    Obtén la media y pon a 0 los valores debajo de la media. 
    
    4.- Crea un array de 5 palabras pedidas por teclado. Cuenta cuantas palabras tienen mas
    de 4 letras, cuantas tienen 4 letras o 3 letras y cuantas tienen menos de 3 letras. 
    
    5.- Crea un array de 8 números positivos, pares y mayores que 14. Muestra el numero 
    mayor y el numero menor por pantalla. 
    
    */
    
    public static void main(String[] args) {
        
        Scanner rd = new Scanner(System.in);
        rd.useDelimiter("\n");
        int value;
        System.out.println("Introduce Opción: ");
        value = rd.nextInt();
        
        switch (value) {
            case 1:
                
                int [] array_1 = {1, 2, 3, 4, 5};
                int [] array_1_inverso = new int[5];
                int j = array_1_inverso.length-1;
                
                for (int i = 0; i < array_1.length; i++) {
                    array_1_inverso [i] = array_1 [j];
                    j--;
                }
                
                for (int i = 0; i < array_1_inverso.length; i++) {
                    System.out.print(" " + array_1_inverso [i]);
                }
                
                break;
                
            case 2:
                
                int media = 0, suma = 0;
                
                System.out.println("Introduce un numero: ");
                int numero = rd.nextInt();
                
                int [] array_2 = new int[numero];
                int [] array_2_sup = new int [numero];
                
                
                // Pedir Datos
                for (int i = 0; i < array_2.length; i++) {
                    System.out.println("Introduce el peso de la persona " + (i+1) + ":");
                    array_2 [i] = rd.nextInt();
                }
                
                // Calcular Media
                for (int i = 0; i < array_2.length; i++) {
                    suma += array_2 [i];
                }
                media = (suma/array_2.length);
                
                
                // Comprobar Si es superior a la media.
                for (int i = 0; i < array_2.length; i++) {
                    if (array_2 [i] > media) {
                        array_2_sup [i]  = array_2 [i];
                    }
                }
                
                break;
            case 3:
                
                int [] array_3 = new int[25];
                int k = 0, suma_3 = 0, media_3 = 0;
                
                // Rellenar array_3
                for (int i = 70; i <= 94; i++) {
                    array_3 [k] = i;
                    k++;
                }
                
                // Calcular media del array_3
                for (int i = 0; i < array_3.length; i++) {
                     suma_3 += array_3[i];
                }
                media_3 = (suma_3/array_3.length);
        
                
                // Poner a 0 los valores inferiores a la media.
                for (int i = 0; i < array_3.length; i++) {
                    if (array_3[i] < media_3) {
                        array_3 [i] = 0;
                    }
                }
                
                break;
            case 4:
               
                String palabra = "";
                String [] array_4 = new String[5];
                int mas_4_ = 0, igual_4_o_3_ = 0, menos_3_ = 0; 
                
                // Pedir la frase
                for (int i = 0; i < 5; i++) {
                    System.out.println("Frase " + (i+1) + ":");
                    palabra = rd.next();
                    array_4 [i] = palabra;
                }
                
                // Comprobar su longitud
                for (int i = 0; i < array_4.length; i++) {
                    if (array_4 [i].length() > 4) {
                        mas_4_++;
                    } else if ((array_4 [i].length() == 4) || (array_4 [i].length() == 3)){
                        igual_4_o_3_++;
                    } else if (array_4 [i].length() < 3){
                        menos_3_++;
                    }
                }
                
                break;
            case 5:
                
                int [] array_5 = new int[8];
                int numero_5 = 0, mayor, menor;
                
                // Pedir y comprobar los numeros.
                for (int i = 0; i < array_5.length; i++) {
                    do {                    
                        System.out.println("Introduce el numero " + (i+1) + ":");
                        numero_5 = rd.nextInt();
                        array_5 [i] = numero_5;
                    } while ((numero_5 < 14) || ((numero_5%2) != 0));
                }
                
                mayor = array_5 [0];
                menor = array_5 [0];
                
                // Comprobar mayor y menor
                for (int i = 0; i < array_5.length; i++) {
                    if (array_5 [i] > mayor) {
                        mayor = array_5 [i];
                    } else if (array_5[i] < menor){
                        menor = array_5 [i];
                    }
                }
                
                break;
            default:
                return;
        }       
    }   
}