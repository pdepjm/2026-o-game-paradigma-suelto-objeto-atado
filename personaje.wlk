import juego.Juego
import arma.ArmaDeFuego

// de momento solo hay un personaje, pero si se quisiera agregar mas personajes, 
// se podria hacer una clase personaje y que cada uno tenga su propia vida, posicion, etc

class Personaje {
    var vida = 5
    var posicionInicial = game.center()
    var property position = posicionInicial
    var arma = new ArmaDeFuego(seMueveHorizontal = false, cantidadCasillasMovimiento = 1)
    var balas = []
    
    method vida() = vida

    method image() = "indio.png"

    method modificarVida(valor) {
        vida += valor
        if(vida <= 0 ) {
            game.say(self, "Perdi")
            Juego.perder()
        }
    }

    method chocarConElEnemigo(enemigo) {
        self.modificarVida(-(enemigo.danio()))
        game.say(self, "Dolor")
    }

    method dispararBala(imagen, esHorizontal, movimiento) {
	const bala = new ArmaDeFuego(seMueveHorizontal = esHorizontal,cantidadCasillasMovimiento = movimiento)

	if(esHorizontal) {
		bala.cambiarPosicion(self.position().x() + movimiento, self.position().y())
	}else {
		bala.cambiarPosicion(self.position().x(), self.position().y() + movimiento)
	}

	game.addVisual(bala)
	balas.add(bala)
  }
    
}

object indio inherits Personaje {

  override method vida() = 10
  override method image() = "indio.png"
  
}

object skay inherits Personaje {
    override method vida() = 8
    override method image() = "skay.png"
}