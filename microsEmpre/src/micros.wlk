class Micro {
	
	var property cantSentados
	var property cantParados
	var property volumen
	const property pasajeros = []
	
	method capacidad() = cantSentados + cantParados	
	
	method subirA(unPasajero) {
		if (self.hayLugar() && unPasajero.aceptaSubir(self)) {
			pasajeros.add(unPasajero)
		} else {
			throw new DomainException(message = "No puede subir al 
										micro")
		}
	}
	
	method bajarA(unPasajero) {
		if (!self.estaPasajero(unPasajero)) {
			throw new DomainException(message = "no puede bajar el pasajero")
		}
		pasajeros.remove(unPasajero)
	}
	
	method estaPasajero(unPasajero) = pasajeros.contains(unPasajero)
	
	method hayLugar() = self.cantPasajeros() < self.capacidad()
	
	method cantPasajeros() = pasajeros.size()	
	
	method hayAsientosLibres() = cantSentados > self.cantPasajeros()
	
	method cantLugaresLibres() = self.capacidad() - self.cantPasajeros()
}


class Apurado {
	
	method aceptaSubir(_) = true
	
}

class Claustrofobico {
	method aceptaSubir(unMicro) = unMicro.volumen() > 120
		
	}

class Fiaca {
	method aceptaSubir(unMicro) = unMicro.hayAsientosLibres()
}

class Moderado  {
	var property cantLugaresLibres
	
	
	method aceptaSubir(unMicro) = unMicro.cantLugaresLibres() >= cantLugaresLibres
	
}