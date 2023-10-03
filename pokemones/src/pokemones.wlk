object ash {
	
	const property pokebola = [charizard, pikachu, psyduck, blastoise ]
	
	method sosGroso() = pokebola.all({unPokemon => unPokemon.nivel() > 100})
	
	method pokemonPreferido() = pokebola.max({unPokemon => unPokemon.potenciaAtaqueMasPotente()})
	
	method pokemonesPulenta() = pokebola.filter({unPokemon => unPokemon.sosPulenta()})
	
	}



object charizard {
	const property tipo = "fuego"
	var property ataque = lanzallamas
	method aprenderAtaque(unAtaque) {
		ataque = unAtaque
	}
	
	method nivel() = ataque.potencia()
	
	method potenciaAtaqueMasPotente() = self.nivel()

	method sosPulenta() = false	
	
}


object pikachu {

	const property tipo = "eléctrico"
	
	var property ataques = [agilidad, trueno, colaDeHierro]
	
	method nivel() = ataques.sum({unAtaque => unAtaque.potencia()})
	
	method potenciaAtaqueMasPotente() = ataques.max({unAtaque => unAtaque.potencia()}).potencia()
	
	method sosPulenta() = ataques.size() > 2

}

object agilidad {
	var property potencia = 10
}

object trueno  {
	var property potencia = 5
	
}


object colaDeHierro {
	var property potencia = 7
}

object psyduck {
	const property tipo = "agua"
	
	method nivel() = 0
	method potenciaAtaqueMasPotente() = self.nivel()
	
	method sosPulenta() = false
}


object blastoise {
	const property tipo  = "agua"
	var property ataquePrincipal = hidrobomba
	var property ataqueReserva = rayoDeHielo
	
	method nivel() = ataquePrincipal.potencia() + ataqueReserva.potencia()
	
	method potenciaAtaqueMasPotente() = ataquePrincipal.potencia().max(ataqueReserva.potencia())
 
 	method sosPulenta() = false
 }

object hidrobomba {
	var property potencia = 7
}

object rayoDeHielo {
	var property potencia = 1
}
object lanzallamas {
	var property potencia = 5
}