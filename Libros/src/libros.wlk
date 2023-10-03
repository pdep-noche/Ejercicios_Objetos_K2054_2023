object andy {
	
	const  property libros = [misterioPrincipeMestizo, lasDosTorres, elPrincipito,  juegosDelHambre, venasAbiertasDeAmericaLatina, rayuela]

	method recordarUltimoLibro() = libros.last()
	
	method recordarPrimerLibro() = libros.first()
	
	method cantidadLibrosLeidos() = libros.size()
	
	method olvidarPrimerLibroLeido() = libros.remove(self.recordarPrimerLibro())
	
	method olvidarLibro(unLibro) = libros.remove(unLibro)

	method mejorLibroLeido() = libros.max({unLibro => unLibro.valoracion()})
	
	method peorLibroLeido() = libros.min({unLibro => unLibro.valoracion()})
	
	method librosBuenos() = libros.filter({unLibro => unLibro.valoracion() > 12})
	
	method olvidarLibrosMalos() = libros.removeAllSuchThat({unLibro => unLibro.valoracion() < 7})
	
}


object misterioPrincipeMestizo {
	
	
	var property cantLectores = 10500156
	
	method valoracion() = cantLectores/ 1000000
}


object lasDosTorres {
	
	var property cantPaginas = 450
	
	method valoracion() = cantPaginas/45
	
	
}

object elPrincipito {
	
	method valoracion() = 50
}

object juegosDelHambre {
	
	var property votosPositivos = 1600200 
	var property votosNegativos = 300600
	
	method coeficiente() = votosPositivos - votosNegativos
	
	method valoracion() = 0.max(self.coeficiente())/100000
	
}

object venasAbiertasDeAmericaLatina {
	const property anioPublicacion = 1971
	
	method valoracion() = self.cantAniosPublicado()/3
	
	method cantAniosPublicado() {
		var hoy = new Date()
		return hoy.year() - anioPublicacion
	}
	
}


object rayuela {
	
	const titulo = "rayuela"
	
	method valoracion() = 2 * self.cantidadLetrasTitulo()
	
	method cantidadLetrasTitulo() = titulo.size()	

}