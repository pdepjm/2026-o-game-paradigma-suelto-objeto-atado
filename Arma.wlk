import Nivel.*
import juego.*
import Administracion.administracionEntidades
class ArmaDeFuego {
    var danio
    var image = ""
	var position = game.origin()
    const seMueveHorizontal = false
    const cantidadCasillasMovimiento = 1

	method image() = image

    method modificarDanio(danioSumado) {
        danio += danioSumado
    }
	method danio() = danio
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
            administracionEntidades.eliminarBala(self)
        }
    }
    
    method chocarConElEnemigo(enemigo) {
        enemigo.cambiarVida(self.danio())
        game.say(enemigo, "Auch")
        game.removeVisual(self)
        administracionEntidades.eliminarBala(self)
    }
}
 