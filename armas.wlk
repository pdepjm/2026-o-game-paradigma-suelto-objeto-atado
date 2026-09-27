import juego.juego
class Bala {
	var danio = 1
	var position = game.origin()
	var image
    const seMueveHorizontal
    const cantidadCasillasMovimiento

	method image() = image

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