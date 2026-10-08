import Nivel.*
class ArmaDeFuego {
    var danio
	var position = game.origin()
    const seMueveHorizontal = false
    const cantidadCasillasMovimiento = 1

	method image() = "bala.png"

    method modificarDanio(danioSumado) {
        danio += danioSumado
    }
	method danio() = danio
	method position() = position

	method cambiarPosicion(x, y) {
		position = game.at(x,y)
	}

    method mover(juego) {
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
    
    method chocarConElEnemigo(enemigo,juego) {
        enemigo.cambiarVida(self.danio())
        game.say(enemigo, "Auch")
        game.removeVisual(self)
        juego.eliminarBala(self)
    }
}
 