package pkg012;

import java.util.Scanner;


public class P012 {

    /*
    
        1.- Leer un numero por teclado, y mostrar la suma de los cuadrados de los anteriores incluidos el 1
        y el numero.
    
        2.- Leer numeros a introducir, leer los numeros e indicar elñ cubo de ellos.
    
        3.- Mostrar un marco como el de la figura con procesos repetitivos utilizando *.
    
        **********
        *        *
        *        *
        *        *
        *        *
        *        *
        *        *
        *        *
        *        *
        **********
        
        4.- Escrible un programa que pida el limite inferior y superior de un intervalo. Si el limite inferior es
        mayor que el superior lo tiene que volver a pedir.
        A continuacion se van introduciendo numeros hasta que introduzca el 0.
        Indicar cuantos numeros estan dentro del intervalo, cuantos numeros estan fuera del intervalo y
        cuantos coinciden con los limites del intervalo.
        
        5.- Crea una aplicación que dibuje una escalera de *. Nosotros le pasamos la altura de la escalera
        por teclado. Este es un ejemplo si insertamos un 5 de altura de escalera.
        
        *
        **
        ***
        ****
        *****
    
    */
    
    public static void main(String[] args) {
        int value = 0, num = 0, suma = 0, cuadrado = 0, num2 = 0, num3 = 0, fuera = 0, dentro = 0, igual = 0;
        Scanner rd = new Scanner(System.in);
        
        System.out.print("\nOpción --> ");
        value = rd.nextInt();
        
        switch (value) {
            case 1:
                System.out.println("Introduce un número:");
                num = rd.nextInt();
                
                for (int i = num; i >= 1; i--) {
                    suma = suma + (i*i);
                }
                System.out.println("La suma de los cuadrados anteriores es: "+suma);
                
                break;
            case 2:
                System.out.print("\n¿Cuantos números vas a intrroducir?: ");
                num = rd.nextInt();
                
                for(int i = 0 ; i < num ; i++){
                    System.out.print("\nIntroduce el número a elevar al cuadrado --> ");
                    num2 = rd.nextInt();
                    System.out.println("El cubo del número "+ num + " es ==> "+(Math.pow(num2, 3)));
                }
                
                break;
            case 3:
                //arriba
                for (int i = 0; i < 10; i++) {
                    System.out.print("* ");
                }
                //medio
                System.out.println("");
                for (int i = 0; i < 8; i++) {
                    System.out.print("*");
                    for (int j = 0; j < 8; j++) {
                        System.out.print("  ");
                    }
                    System.out.print(" ");
                    System.out.print("*\n");
                    
                }
                //abajo
                for (int i = 0; i < 10; i++) {
                    System.out.print("* ");
                }
                System.out.println("");
                
                break;
            case 4:
                do {
                    System.out.print("\nLimite inferior --> ");
                    num = rd.nextInt();
                    System.out.print("\nLimite Superior --> ");
                    num2 = rd.nextInt(); 
                } while ((num > num2) || (num <= 0));
                
                do { 
                    System.out.println("Introduce un número: ");
                    num3 = rd.nextInt();
                    if(((num3 < num) && (num3 != 0)) || (num3 > num2)){
                        fuera++;
                    } else if ((num3 > num) && (num3 < num2)){
                        dentro++;
                    } else if ((num3 == num) || (num3 == num2)){
                        igual++;
                    }
                } while ( num3 != 0);
                
                System.out.println("\nNúmeros Fuera del rango --> " + fuera + "\nNúmeros dentro del rango --> " + dentro 
                                 + "\nNúmero igualles a los intervalos --> "+igual);
                
                break;
            case 5:
                System.out.println("Introduce la altura: ");
                num = rd.nextInt();
                System.out.println("*");
                for (int i = 0; i < num-1; i++) {
                    System.out.print("*");
                    for (int j = 0; j < i+1; j++) {
                        System.out.print("*");
                    }
                    System.out.println("");
                }
                /*
                for ( int i = 0 ; i<=num ; i++){
                    for (int j = i ; j>=1 ; j--){
                        System.out.print("*");
                    }
                    System.out.print(" ");
                }
                */

                break;
            default:
                return;
        }
        
    }
    
}
