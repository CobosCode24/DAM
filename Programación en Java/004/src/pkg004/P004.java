package pkg004;

import java.util.Scanner;

public class P004 {

    /*
    
    Crea un programa que, pedida la altura por teclado, te haga una piramide como:
    
    altura = 5
    
         1
        212
       32123
      4321234
     543212345
    
    */
    
    public static void main(String[] args) {
        
        Scanner rd = new Scanner(System.in);
        int altura, espacios, fila;
        
        System.out.println("Introduce la altura: ");
        altura = rd.nextInt();
        
        espacios = (altura-1);
        fila = 1;
        
        for (int i = 1; i <= altura; i++) {
            
            // espacios
            for (int j = espacios ; j > 0; j--) {
                System.out.print(" ");
            }
            
            // numeros
            
            if (i == 1) {
                System.out.print("1");
            } else {
                
                for (int k = fila; k >= 1 ; k--) {
                    System.out.print(k);
                }
                for (int l = 2; l <= fila; l++) {
                    System.out.print(l);
                }
                
            }
            fila++;
            espacios--;
            System.out.println();
        }
        
    }
    
}
