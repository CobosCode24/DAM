package pkg003;

import java.util.Scanner;


public class P003 {

    /*
    
    1.- Pide por teclado el DNI sin la letra. Para calcular la letra, se debe tomar el
    resto de dividir nuestro número de DNI entre 23. El resultado debe estar por
    tanto entre 0 y 22, y según éste busque en un array de caracteres la posición
    que corresponda a la letra. Esta es la tabla de caracteres
    
        Letra     T R W A G M Y F P D X  B  N  J  Z  S  Q  V  H  L  C  K  E
        Posicion  0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22
    Por ejemplo, si introducimos el DNI 20267079, el resto de dividirlo por 23
    sería 8, luego la letra sería la P, que es la que ocupa esa posicion en el
    vector de caracteres.
    
    2.- Pide 5 números por teclado mayor que 1 y metelos en un array. Muestra
    cada número del array diciemdo si es primo o no.
    
    3.- Crea un array con los años del 1980 a 2040. Muestralos por pantalla
    diciendo si son bisiesto o no
    
    */
    
    public static void main(String[] args) {
        Scanner rd = new Scanner(System.in);
        
        int var;
        System.out.println("Option:");
        var = rd.nextInt();
        
        switch (var) {
            case 1:
                
                char [] ni = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'};
                
                System.out.println("DNI: ");
                int dni = rd.nextInt();
                int resto = (dni%23);
                System.out.println("Su NIF es: " + (dni) + "" + ni[resto]);
                
                
                break;
            case 2:
                
                int numero = 0;
                int [] arrayNum = new int[5];
                
                for (int i = 0; i < 5; i++) {
                    do {                        
                        System.out.println("Introduce nº:");
                        numero = rd.nextInt();
                    } while (numero < 1);
                    arrayNum[i] = numero;
                }
                for (int i = 0; i < arrayNum.length; i++) {
                    
                    if ((arrayNum[i] % 2) == 0) {
                        System.out.println("El numero " + arrayNum[i] + " no es primo.");
                    } else {
                        System.out.println("El numero " + arrayNum[i] + " si es primo.");
                    }
                    
                }
                
                break;
            case 3:
                
                int [] anios = new int[2040-1980];
                int j = 0;
                
                for (int i = 1980; i < 2040; i++, j++) {
                    anios[j] = i;
                }
                for (int i = 0; i < anios.length; i++) {
                    if ((anios[i] % 4 )== 0) {
                        System.out.println("El año " + anios[i] + " si es bisiesto.");
                    } else {
                        System.out.println("El año " + anios[i] + " no es bisiesto.");
                    }
                }
                
                break;
            default:
                throw new AssertionError();
        }
        
        
    }
    
}
