Algoritmo Bingo
	Definir matrizA,matrizB,matrizC,matrizD,inicio,vectorcantar,contadorGlobal Como Entero;
	contadorGlobal=0;//este contador sirve para controlar las veces se que canta un numero y que no sobrepase el tamano del vector
	Definir Gano Como Logico;// con esta variable controlo cuando se gana el juego 
	Gano=Falso;
	Dimension vectorcantar[75];//Dimension vector[75] para guardar los numeros de la tombola
	Dimension  matrizA[5,5];//defino los cartones de juego
	Dimension  matrizB[5,5];
	Dimension  matrizC[5,5];
	Dimension  matrizD[5,5];
		Repetir//es un menu para iniciar el programa
			Escribir "===============================================================";
			Escribir "=Desea iniciar el programa? digite (1) para si, (2) para salir=";
			Escribir "===============================================================";
			Leer inicio;
			si inicio=1
				Borrar Pantalla;
				Escribir "===========================================";
				Escribir "================= BINGO ===================";
				Escribir "===========================================";
				Escribir "";
				Escribir "    ==================================";
				Escribir "    = Presione [enter] para continuar=";
				Escribir "    ==================================";
				Esperar Tecla;
				Borrar Pantalla;			
				inicio=funcionmenu(matrizA,matrizB,matrizC,matrizD,inicio,contadorGlobal,Gano,vectorcantar);//llamo al menu interno
			SiNo
				si inicio=2//esto se muestra al salir del programa
					Limpiar Pantalla;				
					Escribir "===============================================================";
					Escribir "=Hecho por Jose Campos Chaves para Curso Programacion INA 2022=";
					Escribir "===============================================================";
					Escribir "          ==================================";
					Escribir "          = Presione [enter] para continuar=";
					Escribir "          ==================================";
					Esperar Tecla;
					Borrar Pantalla;
					Escribir "    ============================";
					Escribir "    =Gracias,Que tenga buen dia=";
					Escribir "    ============================";
				SiNo
					Limpiar Pantalla;//para evitar errores
					Escribir "    ======================================";
					Escribir "    =Opcion incorrecta intentelo de nuevo=";
					Escribir "    ======================================";
				FinSi			
			FinSi	
		Hasta Que inicio=2
//	Llenarmatriz(matrizA);
//	Llenarmatriz(matrizB);
//	Llenarmatriz(matrizC);
//	Llenarmatriz(matrizD);
//	diferentes(matrizA,matrizB,matrizC,matrizD);
//	llenarvectorcantar(vectorcantar);
//	MostrarMatriz(matrizA,matrizB,matrizC,matrizD);	
//	cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal);	
FinAlgoritmo
SubProceso Llenarmatriz(matriz) // este subproceso llena la matriz 
	definir numAleatorio,i, j, x,numazar como entero;
	definir bandera Como Logico;
	numazar=1;//para que no incluya el 0
	//Dimension vector[5];
	Para i=0 hasta 4 Hacer
		para j=0 hasta 4 Hacer
			Repetir
				bandera = falso;//se inicia la condicion
				numAleatorio = azar(15)+numazar;// [0]=(1-15),[1]=(16-30),[2]=(31-45),[3]=(46-60),[4]=(61-75) me cambia el valor de azar por columna
				si j>=1 Entonces//es asi para que no evalue la primera posicion [i,0]
					para x=0 hasta j-1 Hacer // la x aqui vuelve a evaluar la columna, la j es la cantidad de numeros que se evaluaran
						si matriz[x,i] == numAleatorio //se evalua si son iguales,se repite
							bandera = verdadero; //si es Verdadero entonces repite el ciclo
						FinSi
					FinPara
				FinSi
			Hasta Que bandera = falso// si el numero no es repetido sale de una vez
			matriz[j,i] = numAleatorio;//se guarda el dato en la matriz ya verificado
			//Escribir Sin Saltar,"|", matriz[i,j];
			//MostrarMatriz(matrizA,matrizB,matrizC,matrizD);
		FinPara
		numazar=numazar+15;//le sumamos 15 cada que cambia de columna Para poner los valores aleatorios de las columnas
	FinPara	
FinSubProceso
/////////////////////////////////////////////////////////////////////////////////////
SubProceso diferentes(matrizA,matrizB,matrizC,matrizD)//se verifica que los cartones sean diferentes 
	Definir i,j,A,B,C,D Como Entero;
	Definir MA,MB,MC,MD,SumaA,SumaB,SumaC,SumaD Como Caracter;
	para i=0 Hasta 4
		para j=0 Hasta 4 //se pasan todos los valores numericos de cada matriz a letras se concatenan para poder comparar los 4 y saber si son diferentes
			A=matrizA[i,j];
			MA=ConvertirATexto(A);
			SumaA=SumaA+MA;
			B=matrizB[i,j];
			MB=ConvertirATexto(B);
			SumaB=SumaB+MB;
			C=matrizC[i,j];
			MC=ConvertirATexto(C);
			SumaC=SumaC+MC;
			D=matrizD[i,j];
			MD=ConvertirATexto(D);
			SumaD=SumaD+MD;
		FinPara
	FinPara
	//	Escribir SumaA;
	//	Escribir SumaB;
	//	Escribir SumaC;
	//	Escribir SumaD;
	Si SumaA=SumaB o SumaA=SumaC o SumaA=SumaD o SumaB=SumaC o SumaB=SumaD o SumaC=SumaD // se hace la comparacion
		Escribir "!!!Los Cartones son iguales!!!";// si fueran iguales se vuelven a llenar los cartones
		Llenarmatriz(matrizA);
		Llenarmatriz(matrizB);
		Llenarmatriz(matrizC);
		Llenarmatriz(matrizD);		
	SiNo
		Escribir "Los Cartones son diferentes";// sino se sale 		
	FinSi
FinSubProceso
////////////////////////////////////////////////////////////////////////////////////
SubProceso MostrarMatriz(matrizA,matrizB,matrizC,matrizD)//subproceso para mostrar matrices visualmente
	definir i,j Como Entero;
	Escribir "| B| I| N| G| O|         | B| I| N| G| O|         | B| I| N| G| O|         | B| I| N| G| O|";//arreglo visual
	para i=0 Hasta 4 Hacer
		Para j=0 Hasta 4 Hacer
			si matrizA[i,j] < 10 Entonces
				Escribir Sin Saltar "| ", matrizA[i,j]; //alt+124
			SiNo
				Escribir Sin Saltar "|", matrizA[i,j];				
			FinSi						
		FinPara
		Escribir Sin Saltar "|";
		Escribir Sin Saltar"         ";
		Para j=0 Hasta 4 Hacer
			si matrizB[i,j] < 10 Entonces
				Escribir Sin Saltar "| ", matrizB[i,j]; //alt+124
			SiNo
				Escribir Sin Saltar "|", matrizB[i,j];				
			FinSi			
		FinPara
		Escribir Sin Saltar "|";
		Escribir Sin Saltar"         ";
		Para j=0 Hasta 4 Hacer
			si matrizC[i,j] < 10 Entonces
				Escribir Sin Saltar "| ", matrizC[i,j]; //alt+124
			SiNo
				Escribir Sin Saltar "|", matrizC[i,j];				
			FinSi		
		FinPara
		Escribir sin saltar "|";
		Escribir Sin Saltar"         ";
		Para j=0 Hasta 4 Hacer
			si matrizD[i,j] < 10 Entonces
				Escribir Sin Saltar "| ", matrizD[i,j]; //alt+124
			SiNo
				Escribir Sin Saltar "|", matrizD[i,j];				
			FinSi						
		FinPara
		Escribir "|";
	FinPara
FinSubProceso
///////////////////////////////////////////////////////////////////////////////////////
SubProceso llenarvectorcantar(vectorcantar)	
	definir numAleatorio,i, j, x,a,b,numazar como entero;
	definir bandera Como Logico;	
	para j=0 hasta 74 Hacer //vector[75] el la tombola
		Repetir
			bandera = falso;//se inicia la condicion
			numAleatorio = azar(75)+1;
			si j>=1 Entonces//es asi para que no evalue la primera posicion [j,0]
				para x=0 hasta j-1 Hacer // la x aqui vuelve a evaluar la columna, la j es la cantidad de numeros que se evaluaran
					si vectorcantar[x] == numAleatorio //se evalua si son iguales,se repite
						bandera = verdadero; //si es Verdadero entonces repite el ciclo
					FinSi
				FinPara
			FinSi
		Hasta Que bandera = falso// si el numero no es repetido sale de una vez
		vectorcantar[j] = numAleatorio;//se guarda el dato en el vector ya verificado
		//Escribir Sin Saltar,"|", matriz[i,j];
		//MostrarMatriz(matrizA,matrizB,matrizC,matrizD);				
	FinPara
	//	Escribir "numeros cantados";
	//	Para i=0 Hasta 74
	//		Escribir Sin Saltar ,"|",vectorcantar[i];		
	//	FinPara
	//	Escribir "|";
	//	Escribir "";
	//	Escribir "";
FinSubProceso
////////////////////////////////////////////////////////////////////////////////////////////////
SubProceso cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal Por Referencia)//aqui comienza el proceso de cantar los numeros de la tombola
	Definir num,i,j Como Entero;	
	num=0;
	//Escribir Gano;
	si contadorGlobal<=74 o Gano=Falso //si se cumple no canta mas numeros		
		Escribir "                  =====================================================";
	    Escribir "                  =        Presione enter para cantar un numero:      =";
		Escribir "                  =====================================================";
		Escribir "                                       ===========";
	    Escribir "                                       = [enter] =";
		Escribir "                                       ===========";		
		Esperar Tecla;
		Escribir "                                ===========================";
		Escribir "                                = El numero cantado es:",vectorcantar[contadorGlobal]," =";
		Escribir "                                ===========================";
		Escribir "                                       ===========";
	    Escribir "                                       = [enter] =";
		Escribir "                                       ===========";
		Esperar Tecla;
		Borrar Pantalla;
		//Escribir Sin Saltar "|",vectorcantar[x],"|";
		num=vectorcantar[contadorGlobal];//los igualo a 0 para que sea mas facil, evaluar las posiciones despues				
		Para i=0 Hasta 4
			para j=0 Hasta 4
				si num = matrizA[i,j]
					matrizA[i,j]=0;					
				FinSi
				si num = matrizB[i,j]
					matrizB[i,j]=0;					
				FinSi
				si num = matrizC[i,j]
					matrizC[i,j]=0;					
				FinSi
				si num = matrizD[i,j]
					matrizD[i,j]=0;					
				FinSi
			FinPara
		FinPara		
		contadorGlobal=contadorGlobal+1;//aqui le sumo al contador para que se vueva la posicion del vector 
		MostrarMatriz(matrizA,matrizB,matrizC,matrizD);
	FinSi		
FinSubProceso
////////////////////////////////////////////////////////////////////////////////////////////////
Funcion resultado=funcionmenu(matrizA,matrizB,matrizC,matrizD,inicio,contadorGlobal,Gano,vectorcantar Por Referencia)//menu interno
	Definir mododejuego,elijenumero,numeromatriz1,numeromatriz2,numeromatriz3,numeromatriz4 Como Entero;
	numeromatriz1=1;//con estos controlo que carton gana
	numeromatriz2=2;
	numeromatriz3=3;
	numeromatriz4=4;
	Repetir
		//instrucciones
		Escribir "======================================================================== ";
		Escribir "=     Elija el modo de juego digite el numero segun el modo:           = ";
		Escribir "=     (1).Una línea ya sea vertical, horizontal o diagonal             = ";
		Escribir "=     (2).La letra L ,(3).La letra U,(4).La letra C,(5).Cartón lleno   = ";		
		Escribir "=     Digite (10).para reiniciar o (99).para dejar de jugar            = ";
		Escribir "======================================================================== ";
		leer mododejuego;
		Segun mododejuego Hacer // la variable solo sirve para invocar procesos, cada numero lleva un modo de juego
			1://Lineas				
				contadorGlobal=0;
				Limpiar Pantalla;				
				Llenarmatriz(matrizA);
				Llenarmatriz(matrizB);
				Llenarmatriz(matrizC);
				Llenarmatriz(matrizD);
				diferentes(matrizA,matrizB,matrizC,matrizD);
				llenarvectorcantar(vectorcantar);
				MostrarMatriz(matrizA,matrizB,matrizC,matrizD);	
				Repetir					
					cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal);
					mododejuego=Lineas(matrizA,Gano,contadorGlobal,numeromatriz1,vectorcantar);
					mododejuego=Lineas(matrizB,Gano,contadorGlobal,numeromatriz2,vectorcantar);
					mododejuego=Lineas(matrizC,Gano,contadorGlobal,numeromatriz3,vectorcantar);
					mododejuego=Lineas(matrizD,Gano,contadorGlobal,numeromatriz4,vectorcantar);
					Escribir "Modo de juego: Lineas";					
				Hasta Que Gano=Verdadero // se repite para hasta que ganar sea Verdadero para asegurar que se juegue por completo el modo de juego
				Gano=Falso;//lo pongo en falso para poder volver a jugar si se desea hacerlo
				/////////////////////////////
			2://letra L
				contadorGlobal=0;
				Limpiar Pantalla;				
				Llenarmatriz(matrizA);
				Llenarmatriz(matrizB);
				Llenarmatriz(matrizC);
				Llenarmatriz(matrizD);
				diferentes(matrizA,matrizB,matrizC,matrizD);
				llenarvectorcantar(vectorcantar);
				MostrarMatriz(matrizA,matrizB,matrizC,matrizD);	
				Repetir					
					cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal);
					mododejuego=LetraL(MatrizA,Gano,contadorGlobal,numeromatriz1,vectorcantar);
					mododejuego=LetraL(MatrizB,Gano,contadorGlobal,numeromatriz2,vectorcantar);
					mododejuego=LetraL(MatrizC,Gano,contadorGlobal,numeromatriz3,vectorcantar);
					mododejuego=LetraL(MatrizD,Gano,contadorGlobal,numeromatriz4,vectorcantar);
					Escribir "Modo de juego: Letra L";
				Hasta Que contadorGlobal=74 o Gano=Verdadero
				Gano=Falso;//lo pongo en falso para poder volver a jugar si se desea hacerlo
				
			3://letra U
				contadorGlobal=0;
				Limpiar Pantalla;				
				Llenarmatriz(matrizA);
				Llenarmatriz(matrizB);
				Llenarmatriz(matrizC);
				Llenarmatriz(matrizD);
				diferentes(matrizA,matrizB,matrizC,matrizD);
				llenarvectorcantar(vectorcantar);
				MostrarMatriz(matrizA,matrizB,matrizC,matrizD);
				Repetir					
					cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal);
					mododejuego=LetraU(MatrizA,Gano,contadorGlobal,numeromatriz1,vectorcantar);
					mododejuego=LetraU(MatrizB,Gano,contadorGlobal,numeromatriz2,vectorcantar);
					mododejuego=LetraU(MatrizC,Gano,contadorGlobal,numeromatriz3,vectorcantar);
					mododejuego=LetraU(MatrizD,Gano,contadorGlobal,numeromatriz4,vectorcantar);
					Escribir "Modo de juego: Letra U";
				Hasta Que contadorGlobal=74 o Gano=Verdadero				
				Gano=Falso;//lo pongo en falso para poder volver a jugar si se desea hacerlo
				
			4://letra C
				contadorGlobal=0;
				Limpiar Pantalla;				
				Llenarmatriz(matrizA);
				Llenarmatriz(matrizB);
				Llenarmatriz(matrizC);
				Llenarmatriz(matrizD);
				diferentes(matrizA,matrizB,matrizC,matrizD);
				llenarvectorcantar(vectorcantar);
				MostrarMatriz(matrizA,matrizB,matrizC,matrizD);
				Repetir
					cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal);
					mododejuego=LetraC(MatrizA,Gano,contadorGlobal,numeromatriz1,vectorcantar);
					mododejuego=LetraC(MatrizB,Gano,contadorGlobal,numeromatriz2,vectorcantar);
					mododejuego=LetraC(MatrizC,Gano,contadorGlobal,numeromatriz3,vectorcantar);
					mododejuego=LetraC(MatrizD,Gano,contadorGlobal,numeromatriz4,vectorcantar);
					Escribir "Modo de juego: Letra C";
				Hasta Que contadorGlobal=74 o Gano=Verdadero
				Gano=Falso;//lo pongo en falso para poder volver a jugar si se desea hacerlo
				
			5://Carton lleno
				contadorGlobal=0;
				Limpiar Pantalla;				
				Llenarmatriz(matrizA);
				Llenarmatriz(matrizB);
				Llenarmatriz(matrizC);
				Llenarmatriz(matrizD);
				diferentes(matrizA,matrizB,matrizC,matrizD);
				llenarvectorcantar(vectorcantar);
				MostrarMatriz(matrizA,matrizB,matrizC,matrizD);
				Repetir
					cantar(matrizA,matrizB,matrizC,matrizD,vectorcantar,Gano,contadorGlobal);
					mododejuego=Cartonlleno(MatrizA,Gano,contadorGlobal,numeromatriz1,vectorcantar);
					mododejuego=Cartonlleno(MatrizB,Gano,contadorGlobal,numeromatriz2,vectorcantar);
					mododejuego=Cartonlleno(MatrizC,Gano,contadorGlobal,numeromatriz3,vectorcantar);
					mododejuego=Cartonlleno(MatrizD,Gano,contadorGlobal,numeromatriz4,vectorcantar);
					Escribir "Modo de juego: Carton Lleno";
				Hasta Que contadorGlobal=74 o Gano=Verdadero 
				Gano=Falso;//lo pongo en falso para poder volver a jugar si se desea hacerlo
				
				
			10://reiniciar
				Limpiar Pantalla;
				Llenarmatriz(matrizA);
				Llenarmatriz(matrizB);
				Llenarmatriz(matrizC);
				Llenarmatriz(matrizD);
				diferentes(matrizA,matrizB,matrizC,matrizD);
				llenarvectorcantar(vectorcantar);
				MostrarMatriz(matrizA,matrizB,matrizC,matrizD);
				contadorGlobal=0;
				Gano=Falso;//lo pongo en falso para poder volver a jugar si se desea hacerlo
			99://dejar de jugar	
			De Otro Modo:
				Escribir "Opcion incorrecta";
		Fin Segun
		si gano=Verdadero
			Escribir "Bingo";
		FinSi
	Hasta Que mododejuego=99	
FinFuncion	
//////////////////////////////////////////////////////////////////
Funcion resultado=Lineas(Matriz,Gano Por Referencia,contadorGlobal Por Referencia,numeromatriz,vectorcantar Por Referencia)//condiciones para ganar el modo lineas	
	si contadorGlobal<=74 o Gano=Falso
		//lineas
		si matriz[0,0]=0 y matriz[0,1]=0 y matriz[0,2]=0 y matriz[0,3]=0 y matriz[0,4]=0
			Gano=Verdadero;
			Escribir "Gano  el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[1,0]=0 y matriz[1,1]=0 y matriz[1,2]=0 y matriz[1,3]=0 y matriz[1,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[2,0]=0 y matriz[2,1]=0 y matriz[2,2]=0 y matriz[2,3]=0 y matriz[2,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[3,0]=0 y matriz[3,1]=0 y matriz[3,2]=0 y matriz[3,3]=0 y matriz[3,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[4,0]=0 y matriz[4,1]=0 y matriz[4,2]=0 y matriz[4,3]=0 y matriz[4,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		//columnas
		si matriz[0,0]=0 y matriz[1,0]=0 y matriz[2,0]=0 y matriz[3,0]=0 y matriz[4,0]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[0,1]=0 y matriz[1,1]=0 y matriz[2,1]=0 y matriz[3,1]=0 y matriz[4,1]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[0,2]=0 y matriz[1,2]=0 y matriz[2,2]=0 y matriz[3,2]=0 y matriz[4,2]=0
			Gano=Verdadero;
			Escribir "Gano carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[0,3]=0 y matriz[1,3]=0 y matriz[2,3]=0 y matriz[3,3]=0 y matriz[4,3]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[0,4]=0 y matriz[1,4]=0 y matriz[2,4]=0 y matriz[3,4]=0 y matriz[4,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		//diagonales
		si matriz[4,0]=0 y matriz[3,1]=0 y matriz[2,2]=0 y matriz[1,3]=0 y matriz[0,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
		si matriz[0,0]=0 y matriz[1,1]=0 y matriz[2,2]=0 y matriz[3,3]=0 y matriz[4,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
	FinSi
	//Escribir Gano;
FinFuncion
/////////////////////////////////////////////////////////////////////////////////////////////////
Funcion resultado=LetraL(Matriz,Gano Por Referencia,contadorGlobal Por Referencia,numeromatriz,vectorcantar Por Referencia)//condiciones para ganar el modo L
	si contadorGlobal<=74 o Gano=Falso
		si matriz[0,0]=0 y matriz[1,0]=0 y matriz[2,0]=0 y matriz[3,0]=0 y matriz[4,0]=0 y matriz[4,0]=0 y matriz[4,1]=0 y matriz[4,2]=0 y matriz[4,3]=0 y matriz[4,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
	FinSi		
FinFuncion
////////////////////////////////////////////////////////////////////////////////////////////////////
Funcion resultado=LetraU(Matriz,Gano Por Referencia,contadorGlobal Por Referencia,numeromatriz,vectorcantar Por Referencia)//condiciones para ganar el modo U
	si contadorGlobal<=74 o Gano=Falso
		si matriz[0,0]=0 y matriz[1,0]=0 y matriz[2,0]=0 y matriz[3,0]=0 y matriz[4,0]=0 y matriz[4,0]=0 y matriz[4,1]=0 y matriz[4,2]=0 y matriz[4,3]=0 y matriz[4,4]=0 y matriz[0,4]=0 y matriz[1,4]=0 y matriz[2,4]=0 y matriz[3,4]=0 y matriz[4,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
	FinSi		
FinFuncion
////////////////////////////////////////////////////////////////////////////////////////////////////
Funcion resultado=LetraC(Matriz,Gano Por Referencia,contadorGlobal Por Referencia,numeromatriz,vectorcantar Por Referencia)//condiciones para ganar el modo C
	si contadorGlobal<=74 o Gano=Falso
		si matriz[0,0]=0 y matriz[1,0]=0 y matriz[2,0]=0 y matriz[3,0]=0 y matriz[4,0]=0 y matriz[4,0]=0 y matriz[4,1]=0 y matriz[4,2]=0 y matriz[4,3]=0 y matriz[4,4]=0 y matriz[0,0]=0 y matriz[0,1]=0 y matriz[0,2]=0 y matriz[0,3]=0 y matriz[0,4]=0
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi
	FinSi	
FinFuncion
//////////////////////////////////////////////////////////////////////////////////////////////////////	
Funcion resultado=Cartonlleno(Matriz,Gano Por Referencia,contadorGlobal Por Referencia,numeromatriz,vectorcantar Por Referencia)//condiciones para ganar el modo Carton lleno
	Definir i,j,cont Como Entero;
	si contadorGlobal<=74 o Gano=Falso
		cont=0;
		Para i=0 Hasta 4
			para j=0 Hasta 4
				si matriz[i,j]=0
					cont=cont+1;
				FinSi
			FinPara
		FinPara
		si cont=25
			Gano=Verdadero;
			Escribir "Gano el carton numero: ",numeromatriz;
			numerosganadores(contadorGlobal,vectorcantar);
		FinSi	
	FinSi		
FinFuncion
///////////////////////////////////////////////////////////////////////////////////////////
SubProceso numerosganadores(contadorGlobal,vectorcantar)// aqui muestro los numeros con los que se gano el juego usando la cantidad que tenga contadorglobal
	Definir i Como Entero;
	Escribir "Los numeros con los que gano son:";	
	Para i=0 Hasta contadorGlobal
		Escribir Sin Saltar "|",vectorcantar[i];		
	FinPara
	Escribir "|";
FinSubProceso
/////////////////////////////////////////////////////////////////////////////////////
	