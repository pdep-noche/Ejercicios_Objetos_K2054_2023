object tom {
	
	var energia = 20
	
	var posicion = 30
	
	method puedeAtraparA(unRaton) = self.velocidad() > unRaton.velocidad()
	
	method velocidad() = 5 + (energia/10)
	
	method energia(cantidad) {
		energia = cantidad
	}
	
	method correrA(unRaton) {
		energia -= self.tiempoParaAlcanzar(unRaton)
		posicion = unRaton.posicion()
		
	}
	
	method posicion() = posicion
	
	method tiempoParaAlcanzar(unRaton) = 
	0.5 * self.velocidad()*self.distanciaA(unRaton)
	
	method distanciaA(unRaton) = ( posicion - unRaton.posicion()).abs()
	 
	method energia() = energia
	
	
}


object jerry {
	var peso  = 4
	var posicion = 34
		
	method velocidad() = 10 - peso
	
	method posicion() = posicion
	
}

object robotRaton {
	
	var posicion = 32
	method velocidad() = 8 
	
	method posicion() = posicion
	
	
}









