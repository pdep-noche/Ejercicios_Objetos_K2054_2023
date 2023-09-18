object pepita {
	
	var energia = 100	
	
	
	method energia() = energia
	
	method vola(cantMetros){
		energia = energia - cantMetros
	}
	
	method comer(cantGramos){
		energia += cantGramos * 2
	}
	
	
	
	
}
