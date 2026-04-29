
/* Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
	- Knight Rider usa 1 bulto.
	- Knight Rider: en un accidente no hace nada.
*/
object knightRider {
	method accidente() {
		// No hace nada
	}
	method bulto(){return 1}
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

/* Arena a granel: el peso es variable, la peligrosidad es 1.
	- Arena a granel usa 1 bulto.
	- Arena a granel: agrega 20 kilos en un accidente.
*/
object arenaGranel {
	var property peso=0
	method accidente() { peso += 20	}
	method bulto(){return 1}
	method nivelPeligrosidad(){return 1}
}

/* Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 
	30 si está como robot.
	- Bumblebee usa 2 bultos.
- Bumblebee: cambia de modo en un accidente (si estaba en robot pasa a auto y viceversa).
*/
object bumblebee {
	var esRobot=false
	method esRobot(){return esRobot}
	method bulto(){return 2}
	method peso(){return 800}
	method transformarEnAuto(){esRobot=false}
	method transformarEnRobot(){esRobot=true}
	method accidente(){esRobot = !esRobot}
	method nivelPeligrosidad(){return
		if(esRobot){
			30
		} else 15
	}
}
/* Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. 
	La peligrosidad es 2.
	- Paquete de ladrillos usa 1 bulto hasta 100 ladrillos, 2 bultos si son de 101 a 
		300 ladrillos, 3 bultos si son 301 o más ladrillos.
- Paquete de ladrillos: en un accidente pierde hasta 12 ladrillos. 
		Si tenía menos de 12 queda en 0.
*/
object paqueteDeLadrillos {
  const pesoLadrillo=2
  var property cantidadLadrillos=0
	method accidente() {
		if(cantidadLadrillos <= 12){
			cantidadLadrillos = 0
		} else {
			cantidadLadrillos -= 12
		}
	}
	method bulto(){return 
		if(cantidadLadrillos <= 100){
			1
		} else if (cantidadLadrillos>100 && cantidadLadrillos <= 300){
			2
		} else {
			3	
		}
	}
	method peso(){return pesoLadrillo*cantidadLadrillos}
	method nivelPeligrosidad(){return 2}
}
/*  Batería antiaérea: el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a 
	la peligrosidad es 100 si está con los misiles y 0 en otro caso.
	- Batería antiaérea: usa 1 bulto si no tiene misiles, 2 si tiene.
	- Batería antiaérea: descarga los misiles en un accidente.
*/
object bateriaAntiaerea {
 var tieneMisiles=false
	method tieneMisiles() { return tieneMisiles }
	method accidente(){tieneMisiles=false}
	method bulto() {
	  return if(tieneMisiles){
		2
		} else {
			1
		}
	}
	method peso(){return 
		if(tieneMisiles){
		300
		} else 200		}

	method llevarMisiles(){tieneMisiles=true}
	method noLlevarMisiles(){tieneMisiles=false}

	method nivelPeligrosidad(){return
		if(tieneMisiles){
		100
		} else 0	}
}

/* Residuos radiactivos: el peso es variable y su peligrosidad es 200.
	Residuos radiactivos usa 1 bulto.
	- Residuos radiactivos: agrega 15 kilos en un accidente.
*/
object residuosRadiactivos {
  var property peso=0
	method accidente() { peso += 15 }
	method bulto(){return 1}
	method nivelPeligrosidad(){return 200}
}
/* Contenedor portuario: un contenedor puede tener otras cosas adentro. 
	El peso es 100 + la suma de todas las cosas que estén adentro. 
	Es tan peligroso como el objeto más peligroso que contiene. 
	Si está vacío, su peligrosidad es 0.
	- Contenedor portuario: usa 1 bulto más de la cantidad de 
		bultos que usan las cosas que tiene adentro.
- Contenedor portuario: en un accidente hace que reaccione cada una de las cosas que tiene 
adentro (por ejemplo, si llevaba a Bumblebee, éste queda en modo robot).
*/ 
object contenedorPortuario {
  const cosasAdentro = #{}
  const pesoBaseContenedor=100
	method accidente(){
		cosasAdentro.forEach({cosa => cosa.accidente()})
	}
	method bulto() {
	  return 1 + cosasAdentro.sum({cosa => cosa.bulto()})
	}
	method peso(){return pesoBaseContenedor + cosasAdentro.sum({cosa => cosa.peso()})}
	method nivelPeligrosidad(){return
		if(cosasAdentro.isEmpty()){
			0
		} else cosasAdentro.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}
	method guardarCosa(cosa){
		cosasAdentro.add(cosa)
	}

}

/*Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. 
	El peso es el peso de la cosa que tenga adentro. 
	El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.
	Embalaje de seguridad usa 2 bultos. 
	- Embalaje de seguridad:no hace nada en un accidente.
*/
object embalajeSeguridad {
	var cosaEmbalada = null
	method accidente(){
		// No hace nada
	}
	method bulto(){return 2}
	method peso(){return cosaEmbalada.peso()}
	method nivelPeligrosidad(){return cosaEmbalada.nivelPeligrosidad()/2}
	method envolverCosa(cosa){
		cosaEmbalada = cosa
	} 
}
