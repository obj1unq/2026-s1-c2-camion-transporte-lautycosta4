// Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

// Arena a granel: el peso es variable, la peligrosidad es 1.
object arenaGranel {
	var property peso=0
//	method peso(_peso){peso=_peso}
//	method peso(){return peso}

	method nivelPeligrosidad(){return 1}
}

// Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 
//30 si está como robot.
object bumblebee {
	var esRobot=false
	method peso(){return 800}
	method transformarEnAuto(){esRobot=false}
	method transformarEnRobot(){esRobot=true}

	method nivelPeligrosidad(){return
		if(esRobot){
			30
		} else 15
	}
}
// Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. 
//La peligrosidad es 2.
object paqueteDeLadrillos {
  const pesoLadrillo=2
  var property cantidadLadrillos=0
 // method cantidadLadrillos(_cantidadLadrillos){cantidadLadrillos=_cantidadLadrillos}
	method peso(){return pesoLadrillo*cantidadLadrillos}
	method nivelPeligrosidad(){return 2}
}

// Batería antiaérea: el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a 
//la peligrosidad es 100 si está con los misiles y 0 en otro caso.
object bateriaAntiaerea {
 var tieneMisiles=false
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

// Residuos radiactivos: el peso es variable y su peligrosidad es 200.
object residuosRadiactivos {
  var property peso=0
//	method peso(_peso){peso=_peso}
//	method peso(){return peso}

	method nivelPeligrosidad(){return 200}
}
