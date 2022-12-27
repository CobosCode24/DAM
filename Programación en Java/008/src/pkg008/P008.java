package pkg008;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.Buffer;
import java.util.Scanner;
import java.util.Arrays;

public class P008 {

    /*
    
    1.- Pide tu nombre(string) y tu edad(string) por teclado. Muéstralos por
    pantalla como string y comoentero.
    String str = "25";
    int number = Integer.valueOf(str);
    String str = "25";
    int number = Integer.parseInt(str);
    
    2.- Pide tu dni por teclado como string con la letra. Muestra la parte numérica como int y la letra
    como char.
    
    3.- Pide tu año de nacimiento por teclado como string. Muestralo como int por pantalla.
    int i=10;
    String s=String.valueOf(i);
    int i=10;
    String s=Integer.toString(i);
    
    4.- Pide las notas de la oposicion de Informática como tipo string. Transformala a tipo int. Muestra
    por pantalla si es insuficiente,suficiente, bien, notable o sobresaliente.
    
    5.- Pide un numero long por teclado y pasalo a int.
    long l=500;
    int i=(int)l;
    
    6.- Pide un numero float por teclado y pasalo a int.
    float a=8.61f;
    int b;
    b=(int)a;
    
    7.- Entrada de datos distinta de Scanner
    //Notar que readLine() nos obliga a declarar IOException
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    //Ya tenemos el "lector" System.out.println("Por favor ingrese su nombre");
    //Se pide un dato al usuario
    String nombre = br.readLine();
    //Se lee el nombre con readLine() que retorna un String con el dato
    System.out.println("Bienvenido " + nombre + ". Por favor ingrese su edad");
    //Se pide otro dato al usuario
    String entrada = br.readLine();
    //Se guarda la entrada (edad) en una variable
    //Nótese que readLine siempre retorna String y la clase BufferedReader...
    //no tiene un método para leer enteros, así que debemos convertirlo.
    int edad = Integer.parseInt(entrada);
    //Se transforma la entrada anterior en un entero
    //Si el usuario ingresó solo números funcionará bien, de lo contrario generará
    una excepción
    System.out.println("Gracias " + nombre + " en 10 años usted tendrá " + (edad +
    10) + " años.");
    //Operacion numerica con la edad
    
    8.- Pide por teclado el numero N de posiciones de tu vector. Crea el vector de N enteros pedidos por
    teclado con BufferedReader y muestralos de mayor posicion a menor posición.
    
    9.- Crea un array de 10 numeros pedidos por teclado. Ordena dicho
    array de numeros con el método de la burbuja.
    
    */
    
    public static void main(String[] args) throws IOException {
        
        int var;
        Scanner rd = new Scanner(System.in);
        
        var = rd.nextInt();
        
        switch (var) {
            case 1:
                System.out.println("Introduce tu edad:");
                String edadSTR = rd.next();
                System.out.println("Introduce tu nombre:");
                String nombre = rd.next();
                
                int edadINT = Integer.parseInt(edadSTR);
                
                System.out.println(nombre + "Tu edad es --> " + edadINT);
                
                break;
            
            case 2:
                System.out.println("Introduce tu DNI completo: ");
                String dniSTR = rd.next();
                //int dniNumerosINT = Integer.parseInt(dniSTR.substring(0, 8));
                char dniLetraChar = dniSTR.charAt(8);
                
                int dniNUmerosINT = 0;
                String strCopia = "";
                for (int i = 0; i < dniSTR.length()-1; i++) {
                    strCopia += dniSTR.charAt(i);
                }
                dniNUmerosINT = Integer.parseInt(strCopia);
                
                System.out.println("Tus numeros son: " + dniNUmerosINT + " y tu letra es : " + dniLetraChar);
                
                break;
                
            case 3:
                System.out.println("Introduce tu año de nacimiento: ");
                int anioNacimientoINT = rd.nextInt();
                String anioNacimientoSTR = Integer.toString(anioNacimientoINT);
                
                System.out.println("TU año de nacimiento es --> " + (anioNacimientoSTR));
                
                break;
                
            case 4:
                String notaSTR = "";
                int notaINT;
                int i = 0;
                System.out.println("Introduce el numero de notas a introducir: ");
                int numNotas = rd.nextInt();
                
                while (i <= numNotas) {
                    System.out.println("Introduce la nota :");
                    notaSTR = rd.next();
                    notaINT = Integer.parseInt(notaSTR);
                    if (notaINT < 5) {
                        System.out.println("Suspenso");
                    } else if (notaINT >= 5){
                        System.out.println("Aprobado");
                    }
                    i++;
                }
                break;
                
            case 5:
                System.out.println("Introduce un numero long: ");
                long longL = rd.nextLong();
                
                int entero = (int)longL;
                
                break;
                
            case 6:
                System.out.println("Introduce un numero long: ");
                float floatF = rd.nextLong();
                
                int entero_6 = (int)floatF;
                
                break;
                
            case 7:
                
                //Notar que readLine() nos obliga a declarar IOException
                BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
                
                //Ya tenemos el "lector" System.out.println("Por favor ingrese su nombre");
                //Se pide un dato al usuario
                String nombre_7 = br.readLine();
                
                //Se lee el nombre con readLine() que retorna un String con el dato
                System.out.println("Bienvenido " + nombre_7 + ". Por favor ingrese su edad");
                
                //Se pide otro dato al usuario
                String entrada = br.readLine();
                
                //Se guarda la entrada (edad) en una variable
                //Nótese que readLine siempre retorna String y la clase BufferedReader...
                //no tiene un método para leer enteros, así que debemos convertirlo.
                int edad = Integer.parseInt(entrada);
                
                //Se transforma la entrada anterior en un entero
                //Si el usuario ingresó solo números funcionará bien, de lo contrario generará una excepción
                System.out.println("Gracias " + nombre_7 + " en 10 años usted tendrá " + (edad + 10) + " años.");  //Operacion numerica con la edad
                
                break;

            case 8:
                BufferedReader brd = new BufferedReader(new InputStreamReader(System.in));
                
                System.out.println("numero de posiciones: ");
                int pos = Integer.parseInt(brd.readLine());
                int [] vec_8 = new int[pos];
                int value = 0;
                
                // input vec_8
                for (int j = 0; j < vec_8.length; j++) {
                    System.out.println("Introduce numero de la posicion " + j);
                    value = Integer.parseInt(brd.readLine());
                    vec_8[j] = value;
                }
                
                System.out.println();
                // mostrar mayor pos --> menor pos
                for (int j = vec_8.length-1; j >= 0; j--) {
                    System.out.print(vec_8[j]);
                }
                
                break;
            case 9:
                
                /*########## Opción de ordenacion 1 ##########*/
                
                int [] array_9 = new int [10];
                for (int j = 0; j < array_9.length; j++) {
                    System.out.println("Numero: ");
                    array_9 [j] = rd.nextInt();
                }
                
                // ORDENACIÓN
                boolean finalizado = false;
                int aux = 0;
                int veces_9 = 0;
                int cont = 0;
                
                    
                while (veces_9 <= array_9.length) {
                    for (int j = 0; j < array_9.length-1; j++) {
                            if (array_9 [j] > array_9[j+1]) {
                                aux = array_9[j];
                                array_9 [j] = array_9 [j+1];
                                array_9 [j+1] = aux;
                            }
                    }
                    veces_9++;
                }
                
                // Mostrar array ordenado.
                for (int j = 0; j < array_9.length; j++) {
                    System.out.print(" " + array_9[j]);
                }
                
                /*########## Opción de ordenacion 2 ##########*/
                /*
                
                    int [] vec_10 = new int [10];

                    for (int j = 0; j < vec_10.length; j++) {
                        System.out.println("Numero: ");
                        vec_10 [j] = rd.nextInt();
                    }

                    // se encarga de ordenar el array.
                    Arrays.sort(vec_10);

                    // Mostrar array ordenado.
                    for (int j = 0; j < vec_10.length; j++) {
                        System.out.print(" " + vec_10[j]);
                    }

                */
                
                break;
             default:
                throw new AssertionError();
        } 
    }   
}