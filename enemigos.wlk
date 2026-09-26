

class Enemigo {
  var vida = 15
  var image = "enemigo.png"
  const danio = 40

  method vida() = vida
  method danio() = danio
  const lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  const posicionInicial = game.at(lista.anyOne(), lista.anyOne())
  var posicionActual = posicionInicial

  method position() = posicionActual
  method image() = image

  method cambiarVida(vidaARestar){
    vida -= vidaARestar
  }
  method cambiarEnemigo(nuevoEnemigo) {
	image = nuevoEnemigo
  }

  method cambiarPosicion(x, y) {
    const xNueva = posicionActual.x() + x
    const yNueva = posicionActual.y() + y
		posicionActual = game.at(xNueva,yNueva)
	}

  method perseguir(personaje){
    if(self.position().x() > personaje.position().x()){
      self.cambiarPosicion(-1,0)
    }else{
      self.cambiarPosicion(1,0)
    }

    if(self.position().y() > personaje.position().y()){
      self.cambiarPosicion(0,-1)
    }else{
      self.cambiarPosicion(0,1)
    }
  }

}