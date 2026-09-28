import juego.juego

class Enemigo {
  var vida = 2
  var image = "enemigo.png"
  const danio = 1

  method vida() = vida
  method danio() = danio
  const lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  const posicionInicial = game.at(lista.anyOne(), lista.anyOne())
  var posicionActual = posicionInicial

  method position() = posicionActual
  method image() = image

  method cambiarVida(vidaARestar){
    vida -= vidaARestar
    if(vida <= 0) {
      juego.eliminarEnemigo(self)
      game.removeVisual(self)
    }
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

    // se compara la posicion del enemigo con la del personaje
    // se acerca al personaje priorizando el eje x, y si ya esta alineado en x, se mueve en y
    if(self.position().x() > personaje.position().x()){
      self.cambiarPosicion(-1,0)
    }else if(self.position().x() < personaje.position().x()){
      self.cambiarPosicion(1,0)
    }else{
      if(self.position().y() > personaje.position().y()){
        self.cambiarPosicion(0,-1)
      }else if(self.position().y() < personaje.position().y()){
        self.cambiarPosicion(0,1)
      }
    }

    //REVISAR QUE PASA CUANDO 2 ENEMIGOS SE CRUZAN (en este momento, se superponen y no se puede ver al enemigo que queda debajo)



  }

}