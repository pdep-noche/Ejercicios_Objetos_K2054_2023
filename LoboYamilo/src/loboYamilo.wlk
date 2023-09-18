object yamilo {
	
	var calorias = 100
	
	method calorias() = calorias
	
	method comerA(unAnimal) {
		calorias += (unAnimal.peso() /10)
	}
	
	method estasConSobrepeso() = calorias > 200	
	
	method estaSaludable() = calorias.between(20, 150)
	
	method correr(cantMinutos) {
		calorias -= cantMinutos*2
	}
		
	
}


object chanchito {
	var peso = 20
	
	method peso() = peso
}
