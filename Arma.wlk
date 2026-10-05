import Nivel.Juego
class ArmaDeFuego {
	var position = game.origin()
    const seMueveHorizontal = false
    const cantidadCasillasMovimiento = 1

	method image() = "bala.png"

	method danio() = 1
	method position() = position

	method cambiarPosicion(x, y) {
		position = game.at(x,y)
	}

    method mover() {
        if(seMueveHorizontal) {
            position = game.at(position.x()+cantidadCasillasMovimiento, position.y())
        }else {
            position = game.at(position.x(), position.y()+cantidadCasillasMovimiento)
        }
        
        if(position.x() > game.width() || position.x() < 0 || position.y() > game.height() || position.y() < 0){
            game.removeVisual(self)
            juego.eliminarBala(self)
        }
    }
    
    method chocarConElEnemigo(enemigo) {
        enemigo.cambiarVida(danio)
        game.say(enemigo, "Auch")
        game.removeVisual(self)
        juego.eliminarBala(self)
    }
}

object microfono inherits ArmaDeFuego {
  override method image() = "bala.png"
  override method danio() = 3
}

object guitarra inherits ArmaDeFuego {
    override method image() = "guitarra.png"
    override method danio() = 5
}