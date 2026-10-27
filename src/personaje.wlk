import juego.juego
import Arma.*
import Powerup.*


class Personaje {
    var vida = vidaInicial
    var vidaInicial
    const posicionInicial = game.center()
    const nombrePersonaje
    var direccion = "Derecha"
    var property position = posicionInicial
    var armaEnMano
    var balas = []


    method vida() = vida

    method image() = nombrePersonaje + direccion + ".png"

    method aplicarBeneficio(vidaOtorgada,dañoOtorgado) {
        self.modificarVida(vidaOtorgada)
        armaEnMano.modificarDanio(dañoOtorgado)
    } 

    method agarrarPower(powerUp) {    
        powerUp.otorgarA(self)
        game.say(self,"powerUp agarrado")
        game.removeVisual(powerUp)
    /*
        ---------------------------
        hay un problema con la version anterior de agarrarPower. lo que pasaba es:
        en la lista de powerups por personaje, se guardaban bloques de codigo. 
        agarrarPower hacía powerUpBoost.contains(powerUp) para decidir si el power-up era "afín".

        la lista guardaba bloques, no powerUps. contains comparaba un bloque contra una instancia de Lentes,
        que son cosas de distinto tipo, por lo que siempre daba false.

        y si la lista guardaba instancias, se comparaban distintas instancias, que se toman como distintos objetos,
        terminando tambien en false.
        ---------------------------
        la nueva version funciona:
        a la clase personaje, se le aplica de igual manera el efecto de cada powerUp (por cada powerUp: un recibirItem(item)), 
        lo que cambia es en los personajes concretos, sobrescribiendo el metodo recibirItem(item), agregandole la mejora.

        esta version hace que tengamos que agregar un recibirItem(item) por cada nuevo item, generando un leve acoplamiento
        ya que tenemos que modificar personaje al agregar un item. 

    */
    
    }

    method recibirLentes(lentes) {
        self.aplicarBeneficio(lentes.vida(),lentes.daño())
    }

    method recibirPua(pua) {
        self.aplicarBeneficio(pua.vida(), pua.daño())
    }  

    method cambiarDireccion(nuevaDireccion) {
        direccion = nuevaDireccion
    }

    method modificarVida(valor) {
        vida += valor
        if(vida <= 0 ) {
            game.say(self, "Perdi")
            juego.perder()
        }
    }

    method chocarConElEnemigo(enemigo) {
        self.modificarVida(-(enemigo.danio()))
        game.say(self, "Dolor")
    }

    method balas() = balas

    method dispararBala(imagen, esHorizontal, movimiento) {
	const bala = new ArmaDeFuego(danio = armaEnMano.danio(),seMueveHorizontal = esHorizontal,cantidadCasillasMovimiento = movimiento, image = imagen)
    
	if(esHorizontal) {
		bala.cambiarPosicion(self.position().x() + movimiento, self.position().y())
	}else {
		bala.cambiarPosicion(self.position().x(), self.position().y() + movimiento)
	}

	game.addVisual(bala)
	balas.add(bala)
  }
    method reiniciar() {
    vida = vidaInicial // o el valor de vida inicial que uses
    position = posicionInicial // la posición inicial donde arranca en el tablero
  }
}

object indio inherits Personaje(vidaInicial = 10,nombrePersonaje = "indio", armaEnMano = new ArmaDeFuego(danio = 2, cantidadCasillasMovimiento = 1)) {

    override method recibirLentes(lentes) {
        self.aplicarBeneficio(lentes.vida() * 7, lentes.daño() * 8)
    }
}


object skay inherits Personaje(vidaInicial = 8, nombrePersonaje="skay" , armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1)) {

    override method recibirPua(pua) {
        self.aplicarBeneficio(pua.vida() * 2, pua.daño() * 2)
    }

}

object semilla inherits Personaje(vidaInicial = 5,nombrePersonaje="semilla",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1)) {
    
}

object walter inherits Personaje(vidaInicial = 5, nombrePersonaje="walter",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1)) {
    
}

object sergio inherits Personaje(vidaInicial = 5, nombrePersonaje="sergio",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1)) {
    
}
object personajeNulo {
    method cambiarDirecccion(nuevadireccion){}
    method dispararBala(imagen,esHorizontal,movimiento) {}
}