package pkg010;

import java.util.Scanner;


public class P010 {

    /*
    
    1. Pide tu nombre por teclado y muetralo completo en mayúsculas.
    2. Pide tu nombre por teclado y muetralo completo en minúsculas
    3. Pide tu nombre y apellidos por teclad, concatenalos y dime la longitud de la cadena completa.
    4. Pide tu dni por teclado y muestrame los numeros en un linea y la letra en otra linez
    5. Pide un string por teclado. A continuacion, debes quitar la ultima letra
       del string hasta llegar a la primera letra. Un ejemplo:
    
        input --> holassss
    
        output -->  holassss
                    holasss
                    holass
                    holas
                    hola
                    hol
                    ho
                    h
    
    */
    
    public static void main(String[] args) {
        Scanner rd = new Scanner(System.in);
        rd.useDelimiter("\n");
        int var = 0;
        String nombre = "", apellidos = "", dni ="";
        System.out.println("Introduce Opción:");
        var = rd.nextInt();
        
        switch (var) {
            case 1: 
                
                System.out.print("\nIntroduce tu nombre completo: ");
                nombre = rd.next();
                System.out.println(nombre.toUpperCase());
                
                break;
            case 2: 
                
                System.out.print("\nIntroduce tu nombre completo: ");
                nombre = rd.next();
                System.out.println(nombre.toLowerCase());
                
                break;
            case 3: 
                
                System.out.print("\nNombre: ");
                nombre = rd.next();
                System.out.print("\nApellidos: ");
                apellidos = rd.next();
                
                System.out.println("Tu nombre completo es --> " + (nombre+" "+apellidos));
                System.out.println("La longitud de la cadena de tu nombre es --> " + (nombre+apellidos).length());
                
                break;
            case 4: 
                
                System.out.println("dni:");
                dni = rd.next();
                System.out.println("LETRAS --> " + (dni.charAt(8)));
                System.out.print("\nNUMEROS --> "  + dni.substring(0, 8));

                System.out.println();
                
                break;
            case 5:
                System.out.println("Introduce la palabra:");
                String cadena = rd.next();
                for (int i = cadena.length(); i > 0; i--) {
                    System.out.println(cadena.substring(0, i));
                }
                
                break;
            default:
                return;
        }
    }   
}