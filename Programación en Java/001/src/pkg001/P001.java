package pkg001;

import java.util.Scanner;


public class P001 {
    
    /*
    
    1.- Crea un array de 10 posiciones de números pedidos por teclado. Muestra por consola el indice
        de menor a mayor y el número en cuestión.
    
    2.- Crea un array de 5 posiciones de palabras pedidas por teclado. Muestra por consola el indice de
        mayor a menor y la palabra en cuestión.
    
    3.- Crea un array de números de 100 posiciones, que contendrá los números del 1 al 100. Obtén la
        suma de todos ellos y la media.
    
    4.- Del array anterior crea dos arrays de 50 posiciones, uno que almacene los pares y el otro los
        impares
    
    5.- Crea un array de 10 palabras pedidas por teclado. Cuenta cuantas palabras tienen mas de 6 letras,
        cuantas tienen 6 letras y cuantas tienen menos de 6 letras. 
    
    */
    
    public static void main(String[] args) {
        
        Scanner rd = new Scanner(System.in);
        int value;
        System.out.println("Introduce la opción:");
        value = rd.nextInt();
        
        
        switch (value) {
            case 1:
                
                int [] array_1;
                int number;
                array_1 = new int [10];
                
                for (int i = 0; i < (array_1.length); i++) {
                    System.out.print("\nIntroduce nº:");
                    number = rd.nextInt();
                    array_1[i] = number;
                }
                for (int i = 0; i < (array_1.length) ; i++) {
                    System.out.println("Posición " + i + " es el número " + array_1[i]);
                } 
                
                break;
            case 2:
                
                String [] array_2;
                String words;
                array_2 = new String [5];
                
                for (int i = 0; i < (array_2.length); i++) {
                    System.out.print("\nIntroduce palabra:");
                    words = rd.next();
                    array_2[i] = words;
                }
                for (int i = 0; i < (array_2.length) ; i++) {
                    System.out.println("Posición " + i + " es el número " + array_2[i]);
                } 
                
                break;
            case 3:
                
                int [] array_3;
                int suma = 0, media = 0;
                array_3 = new int [100];
                
                for (int i = 0; i < array_3.length; i++) {
                    array_3 [i] = (i+1);
                }
                for (int i = 0; i < array_3.length; i++) {
                    suma += array_3[i];
                }
                System.out.println("La suma de todos los numeros del vector es: " + suma + " y su media es: " + (suma/array_3.length));
                
                break;
            case 4:

                int [] array_4, array_4_par, array_4_impar;
                array_4 = new int [100];
                array_4_par = new int [50];
                array_4_impar = new int [50];
                int j = 0, k = 0;
                
                /* GENERAR LOS NUMEROS */
                for (int i = 0; i < array_4.length; i++) {
                    array_4 [i] = i;
                }
                
                /* CONTADOR PARES IMPARES */
                for (int i = 0; i < array_4.length; i++) {
                    
                    if ((array_4[i])%2 == 0) {
                        array_4_par[j] = array_4[i];
                        j++;
                        
                    } else {
                        array_4_impar[k] = array_4[i];
                        k++;
                    }
                    
                }
                
                /* MOSTRAR LOS NÚMEROS */
                System.out.println("PARES");
                for (int i = 0; i < array_4_par.length; i++) {
                    System.out.print(" " + array_4_par[i]);
                }
                System.out.println("\nIMPARES");
                for (int i = 0; i < array_4_impar.length; i++) {
                    System.out.print(" " + array_4_impar[i]);
                }
                
                break;
            case 5:
                
                String [] array_5;
                array_5 = new String [10];
                String palabra = "";
                int mas = 0, menos = 0, igual = 0;
                
                for (int i = 0; i < array_5.length; i++) {
                    System.out.println("Introduce palabra: ");
                    palabra = rd.next();
                    array_5 [i] = palabra;
                }
                
                for (int i = 0; i < array_5.length; i++) {
                    
                    palabra = array_5[i];
                    
                    if (palabra.length() == 6) {
                        igual++;
                    } else if (palabra.length() > 6) {
                        mas++;
                    } else if (palabra.length() < 6) {
                        menos++;
                    }
                    
                }
                System.out.println(" nº = 6 --> " + igual);
                System.out.println(" nº > 6 --> " + mas);
                System.out.println(" nº < 6 --> " + menos);
                
                break;
            default:
                return;
        }
  
        
    }
    
}
