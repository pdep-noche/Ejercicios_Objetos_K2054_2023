class Aseguradora {
	
	method montoAPagarPor(siniestro, vehiculo) {
		self.validarParticipacionVehiculo(siniestro, vehiculo)
		vehiculo.cuantoCubrePoliza(siniestro)
	}
	
	method validarParticipacionVehiculo(siniestro, vehiculo) {
		if (!siniestro.participo(vehiculo)){
			throw new NoParticipoVehiculo(message = "vehiculo no 
participo en el siniestro")
		}
	}
}
	
	class NoParticipoVehiculo inherits DomainException {
		
	}
		

class Vehiculo {
	
	const property siniestros = []
	var property poliza
	
	method cuantoCubrePoliza(siniestro) {
		return poliza.cuantoCubreEn(siniestro, self)
	}
	
	method montoDaniosNoCubiertos(){
		return siniestros.sum({unSiniestro => poliza.montoNoCubierto(unSiniestro, self)})
	}
}

class Poliza {
	
	var property aseguradora
	
	method cuantoCubreEn(siniestro, vehiculo) {
		return self.daniosCubiertos(siniestro, vehiculo).sum({danio => danio.monto()})
	}
	
	method daniosCubiertos(sinistro, vehiculo)
}

class ContraTodoRiesgo inherits Poliza {
	
	method daniosCubiertos(siniestro, _) {
		return siniestro.danios()		
	}
	
	method montoNoCubierto(siniestro, _) = 0
	

}


class ContraTercero inherits Poliza {
	
	method daniosCubiertos(siniestro, vehiculo){
		return siniestro.danios().filter({unDanio => unDanio.involucrado() != vehiculo})
	}
	
	method montoNoCubierto(siniestro, vehiculo) {
		return siniestro.daniosPara(vehiculo)
		
	} 
}

class Siniestro {
	
	const property danios = []
	
	method participo(unInvolucrado) {
		return danios.any({unDanio => unDanio.involucrado() == unInvolucrado})
	}
	
	method daniosPara(vehiculo) {
		return self.buscarDanioVehiculo(vehiculo).monto()
	}
	
	
	method buscarDanioVehiculo(vehiculo){
		return danios.find({unDanio => unDanio.involucrado() == vehiculo})
	}
}

class Danio {
	
	var property monto
	var property involucrado
}