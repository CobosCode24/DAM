package pkg011;

import java.util.Scanner;


public class P011 {

    /*
    
    1.- Crea una aplicación que dibuje una escalera inversa de *. Nosotros le pasamos la altura de la
    escalera por teclado. Este es un ejemplo si insertamos un 5 de altura de escalera.
    *****
    ****
    ***
    **
    *
    
    2.- Crea una aplicación que dibuje una piramide de *. Nosotros le pasamos la altura de la piramide
    por teclado. Este es un ejemplo si insertamos un 5 de altura de la piramide.
         *
        ***
       *****
      *******
     *********
    
    3.- Crea una aplicación que dibuje una piramide invertida de *. Nosotros le pasamos la altura de la
    piramide invertida por teclado. Este es un ejemplo si insertamos un 5 de altura de la piramide
    invertida
     *********
      *******
       *****
        ***
         *
    
    4.- Introducir una nota del 1 al 10 y mostrar por pantalla el texto correspondiente.
    1→ Insuficiente
    2→ Insuficiente
    3→ Insuficiente
    4→ Insuficiente
    5→ Suficiente
    6→ Bien
    7→ Notable
    8→ Notable
    9→ Sobresaliente
    10→  Sobresaliente
    
    5.- Calcular cuantos numeros multiplos de 3 hay entre 1 y 100.
    
    */
    
    public static void main(String[] args) {
        Scanner rd = new Scanner(System.in);
        int var = 0, num=0;
        System.out.println("Introduce una opción:");
        var = rd.nextInt();
         
        switch (var) {
            case 1:
                System.out.println("Introduce num: ");
                num = rd.nextInt();
                for ( int i = num ; i>=1 ; i--){
                    for (int j = i; j >= 1; j--) {
                        System.out.print("*");
                    }
                    System.out.println("");
                }
                
                break;
            case 2:
                
                System.out.print("Introduce el numero de filas: ");
                int numFilas = rd.nextInt();
            
            for(int altura = 1; altura<=numFilas; altura++){
                //Espacios en blanco
                for(int blancos = 1; blancos<=numFilas-altura; blancos++){
                    System.out.print(" ");
                }
 
                //Asteriscos
                for(int asteriscos=1; asteriscos<=(altura*2)-1; asteriscos++){
                    System.out.print("*");
                }
                System.out.println();
            }
                
                
                break;
            case 3:
                
            numFilas = rd.nextInt();
            rd.close();
            System.out.println();
            for(int numBlancos = 0, numAsteriscos = (numFilas*2)-1; numAsteriscos>0; numBlancos++, numAsteriscos -= 2){

                //Espacios en blanco
                for(int i=0; i < numBlancos; i++){
                    System.out.print(" ");
                }

                //Asteriscos
                for(int j=numAsteriscos; j > 0; j--){
                    System.out.print("*");
                }
                System.out.println();
            }

                
                break;
            case 4:
                
                String notas[] = {"","Insuficiente", "Insuficiente", "Insuficiente", "Insuficiente", "Insuficiente", "Suficiente", "Bien", "Notable", "Notable", "Sobresaliente", "Sobresaliente"};
                num = rd.nextInt();
                if(num >0 && num <=10){
                    System.out.println(notas[num]);
                }
                
                break;
            case 5: //    5.- Calcular cuantos numeros multiplos de 3 hay entre 1 y 100.
                int total = 0;
                for (int i = 3; i < 100; i+=3) {
                    System.out.print(" " + i);
                    total++;
                }
                System.out.println("\n"+total);
                
                break;

            default:
                return;
        }
        
    }
}