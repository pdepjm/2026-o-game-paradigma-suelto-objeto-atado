class Bala {
	var danio = 10
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
    }
    
}