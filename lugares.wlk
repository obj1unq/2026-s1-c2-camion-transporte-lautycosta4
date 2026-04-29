import cosas.*
//destinos

object almacen{
    const cosasAlmacenadas = #{}
    method cosasAlmacenadas(){return cosasAlmacenadas}
    method almacenar(unaCosa){
        cosasAlmacenadas.add(unaCosa)
    }
    method almacenarCosas(cosasAlmacenar){
        cosasAlmacenar.forEach({cosa => self.almacenar(cosa)})
    }   
}

 
//caminos
/*
* La ruta 9 soporta viajes según el requerimiento "puede circular en ruta" 
    (resuelto anteriormente) con un nivel de peligrosidad de 20.
* Los caminos vecinales soportan viajes de vehículos que no superen el peso 
    máximo permitido, el cual es configurable.     
*/
object ruta9{
    method puedeCircular(transporte){
        return transporte.puedeCircularRuta(20)
    }
    method validarCamino(transporte){
        if(!self.puedeCircular(transporte)){
            self.error("No puede circular por peligrosidad.")
        }
    }
}
object caminoVecinal{
    var property pesoPermitido=0
    method puedeCircular(transporte){
        return transporte.pesoTotalCamion() <= pesoPermitido}
    method validarCamino(transporte){
        if(!self.puedeCircular(transporte)){
            self.error("No puede circular por exceso de peso.")
        }
    }
}