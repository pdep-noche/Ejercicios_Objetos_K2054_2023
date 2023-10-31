class EspacioUrbano {
	
	var property nombre
	var property superficie
	var property tieneVallado
	var property valuacion
	
	const property trabajosRealizados = []
	
	method esGrande() {
		return superficie  > 50 && self.cumpleCondicionesEsGrande() 
	}
	method esEspacioVerde() = false
	method cumpleCondicionesEsGrande() 
	
	method esLimpiable() = false
	
	method incrementarValuacion(cantidad){
		valuacion += cantidad
	}
	
	method agregarTrabajo(unTrabajo) {
		trabajosRealizados.add(unTrabajo)
	}
	
}
class Plaza inherits EspacioUrbano {
	
	var property cantCanchas
	var property espacioEsparcimiento
	
	method cumpleCondicionesEsGrande() = cantCanchas > 2
	
	override method esEspacioVerde() = cantCanchas == 0
	override method esLimpiable() = true
}

class Plazoleta inherits EspacioUrbano {
	var property procer
	method cumpleCondicionesEsGrande() {
		return	procer == "San Martin" && tieneVallado
	}
}
	
class Anfiteatro inherits EspacioUrbano {
	
	var property capacidad
	var property tamanioEscenario
	
	method cumpleCondicionesEsGrande() = capacidad > 500
	
	override method esLimpiable() = self.esGrande()
}

class Multiespacio inherits EspacioUrbano {
	const property espaciosUrbanos = []
	method cumpleCondicionesEsGrande()  {
		return espaciosUrbanos.all({unEspacio => unEspacio.cumpleCondicionesEsGrande()})
	}
	
	override method esEspacioVerde() = espaciosUrbanos.size() > 3
	}
	
class Trabajador  {
	var property profesion
	
	method trabajaEn(espacioUrbano) {
		profesion.trabajaEn(espacioUrbano, self)
}
}

class Profesion {
	var property valorHora = 1000
	
	method trabajarEn(espacioUrbano, trabajador){
		self.validarTrabajoEn(espacioUrbano)
		self.producirEfectoEn(espacioUrbano)
		self.registrarTrabajo(espacioUrbano, trabajador)
	}
	
	
	method puedeTrabajarEn(espacioUrbano)
	method producirEfectoEn(espacioUrbano) 
	method duracionTrabajo(_)
	
	method validarTrabajoEn(espacioUrbano) {
		if (!self.puedeTrabajarEn(espacioUrbano)) {
			throw new TrabajoIrrealizable(message = "No puede
				realizar el trabajo")
		}
	}
	
	method registrarTrabajo(espacioUrbano, trabajador){
		espacioUrbano.agregarTrabajo(new TrabajoRealizado(persona = trabajador, costo = self.montoTrabajo(espacioUrbano), duracion = self.duracionTrabajo(espacioUrbano), fecha = new Date()))
	}
	
	
	method montoTrabajo(espacioUrbano) = valorHora * self.duracionTrabajo(espacioUrbano)
	
}
	
	class TrabajoIrrealizable inherits DomainException {}

object cerrajero inherits Profesion{
	method puedeTrabajarEn(espacioUrbano) {
		return !espacioUrbano.tieneVallado()
	}
	
	method duracionTrabajo(espacioUrbano) {
		if ( espacioUrbano.esGrande()) {
			return 5
		}
		return 3
	}
	
	override method producirEfectoEn(espacioUrbano) {
		espacioUrbano.tieneVallado(true)
	}
}

object jardinero inherits Profesion {
	method puedeTrabajarEn(espacioUrbano) {
		return espacioUrbano.esEspacioVerde()
	}
	
	method duracionTrabajo(espacioUrbano) {
		return espacioUrbano.superficie() /10
	}
	
	override method producirEfectoEn(espacioUrbano) {
		espacioUrbano.incrementarValuacion(espacioUrbano.valuacion() * 0.1)
	}
}
object encargado inherits Profesion {
	
	method puedeTrabajarEn(espacioUrbano) {
		return espacioUrbano.esLimpiable()
	}
	
	method duracionTrabajo(_) = 8	
	
	override method producirEfectoEn(espacioUrbano) {
		espacioUrbano.incrementarValuacion(5000)
	}
	
}

class TrabajoRealizado {
	var property persona
	var property fecha
	var property duracion
	var property costo
}


