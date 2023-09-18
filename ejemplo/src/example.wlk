/** First Wollok example */
object yamilo {
	var calorias = 80
	
	method calorias(cantidad) {
		calorias = cantidad
	}
	
	method calorias() {
		return calorias
	}
	
	method comer(chanchito) {
		calorias += (chanchito.peso()/10)
	}	
	
	method estaConSobrepeso() {
		return calorias > 200
	}
	
	method estaSaludable() {
		return calorias.between(20, 150)
	}
	
	method correr(tiempo) {
		calorias -= tiempo *2
	}
	
}

object chanchitoCasaDePaja {
	var peso = 90
	
	
	method peso() {
		return peso
	}
	
	
	method peso(unPeso) {
		peso = unPeso
	}
}