import cosas.*

object camion {
	const property cosas = #{}
//Poder cargar una cosa, y también descargar una cosa.  
//No se puede cargar algo ya cargado ni descargar lo que no contiene el camión.		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method validarCarga(unaCosa){ return
		if(cosas.contains(unaCosa)){
			self.error(unaCosa.toString() + " ya esta en el camion")
		}
	}
	method descargar(unaCosa){
		self.validarDescarga(unaCosa)  
		cosas.remove(unaCosa)
	}
	method validarDescarga(unaCosa){ return
		if (!cosas.contains(unaCosa)){
			self.error(unaCosa.toString() + " no esta en el camion")
		}
	}
//Saber si el peso de cada uno de los objetos cargados es un número par.
	method sonPares(){
		 return cosas.all({cosa => self.esPar(cosa)})
	}
	method esPar(unaCosa){
		return unaCosa.peso().even()
	}

//Saber si el camión tiene alguna cosa que pesa exactamente una cantidad de kilogramos dada.
	method tieneCosaQuePesa(pesoIgualar){
		return cosas.any({cosa => cosa.peso() == pesoIgualar})
	}
/*Saber el peso total del camión, que es la suma del peso del camión vacío (tara) y su carga. 
La tara del camión es de 1000 kilos.
El camión se encuentra excedido de peso si el peso total es superior al peso máximo aceptable, 
que es de 2500 kilos.*/
const pesoTara= 1000
const pesoMaximoAceptable=2500
	method pesoTotalCamion() {
		return pesoTara + cosas.sum({cosa=> cosa.peso()})
	}
	method estaExcedido(){
		return self.pesoTotalCamion() > pesoMaximoAceptable
	}

}
