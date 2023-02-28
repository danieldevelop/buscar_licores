subproceso llenarLicores(licor)
	// Tipo, nombre, grado
	licor(0,0) <- "Whisky";
	licor(0,1) <- "Johnnie Walwer";
	licor(0,2) <- "45°";
	
	licor(1,0) <- "Cerveza";
	licor(1,1) <- "Corona";
	licor(1,2) <- "18.7°";
	
	licor(2,0) <- "Vino";
	licor(2,1) <- "Carmener";
	licor(2,2) <- "1,5°";
FinSubProceso

subproceso listarLicor(licor, fila)
	definir i como entero;
	
	escribir("===== Licores =====");
	para i <- 0 hasta (fila - 1) con paso 1 hacer
		escribir("Tipo: "),licor(i,0);
		escribir("Nombre: "),licor(i,1);
		escribir("Alcohol: "),licor(i,2),(" grados");
		escribir("");
	FinPara
FinSubProceso

//De izquerda a derecha si se encuentra, devuelve el numero de la posicion del arreglo
//sino encuentra el dato en el arreglo, este devolvera un -1
//Sintaxis:
//	[variable_retornar] <- [nombre_funcion(parametros)] code... [fin_funcion]
subproceso resultado <- buscarPorNombre(nombre, licor, fila)
	definir resultado como entero;
	definir i como entero;
	
	resultado <- -1; // valor por defecto, cuando no encuentra un valor en el arreglo
	
	para i <- 0 hasta (fila - 1) con paso 1 hacer
		si (licor(i,1) = nombre) entonces
			resultado <- i;
		FinSi
	FinPara
FinSubProceso

SubProceso resultado <- indexUpperCase(producto)
	definir indexOf como caracter;
	definir lastOf como caracter;
	definir i como entero;
	
	para i <- 0 hasta Longitud(producto) con paso 1 Hacer
		indexOf = Mayusculas(Subcadena(producto, 0, 0));
		lastOf = Subcadena(producto, 1, i);
	FinPara
	
	resultado = indexOf + lastOf;
FinSubProceso



Algoritmo buscar_licores
	definir filas, columnas, isExisteLicor como real;
	definir licores como caracter;
	definir nombreProducto como caracter;
	
	filas <- 3;
	columnas <- 3;
	dimension licores(filas, columnas);
	
	// Inicializamos la matriz con los datos de la funcion llenarLicores
	llenarLicores(licores);
	//	listarLicor(licores, filas);

	escribir("INGRESE EL TRAGO A BUSCAR");
	leer nombreProducto;
	
	nombreProducto = indexUpperCase(nombreProducto);
	isExisteLicor = buscarPorNombre(nombreProducto, licores, filas);
	
	si (isExisteLicor <> -1) Entonces
		escribir("--- Producto ---");
		escribir("TIPO: "),licores[isExisteLicor, 0];
		escribir("NAME: "),licores[isExisteLicor, 1];
		escribir("GRADOS: "),licores[isExisteLicor, 2];
	SiNo
		escribir("El producto "),nombreProducto,(" no esta disponible!");
	FinSi
FinAlgoritmo
