package pkg006;

import java.util.Scanner;

public class P006 {

    /*
    Calcula el cuadrado de un número que sea par, y mayor que 110.
    */
    
    public static void main(String[] args) {

        
        Scanner rd = new Scanner(System.in);
        int numero;
        
        do {            
            System.out.println("Introduce un número:");
            numero = rd.nextInt();
        } while (((numero%2)==0) && (numero<0) && (numero<110));
        
        System.out.println("El cuadrado del numero " + numero + " es --> " + (numero*numero));
        
    }
    
}
