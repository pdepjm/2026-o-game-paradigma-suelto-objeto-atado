import juego.*
import Administracion.administracionEntidades
import src.personaje.personajeNulo
import juego.juego
class Enemigo {
  var vida 
  var danio 
  var image 
  var posicionActual = 0
  var jugador = personajeNulo
  const vidaInicial = vida

  method vida() = vida
  method danio() = danio
  method text() = "" + vida + "/" + vidaInicial
  method textColor() = "009933FF"

  method generarPosInicial(){
    posicionActual = game.at(1.randomUpTo(game.width()).roundDown(), 1.randomUpTo(game.height()).roundDown())//hacer override en los
    //enemigos que se muevan solo en los bordes en un lugar especifico
    if(posicionActual.x() == jugador.position().x() && posicionActual.y() == jugador.position().y()) {
      posicionActual = game.at(posicionActual.x()+1,posicionActual.y()+1)
    }
  }

  method position() = posicionActual

  method image() = image

  method cambiarPersonaje(nuevoPersonaje) {
    jugador = nuevoPersonaje
  }

  method cambiarVida(vidaARestar) {
    vida -= vidaARestar
    if(vida <= 0) {
      administracionEntidades.eliminarEnemigo(self)
      game.removeVisual(self)
      }
  }

  //se utiliza solo en los test del movimiento de cada enemigo
  method posicionActual(x,y) {
    posicionActual = game.at(x,y)
  }

  method sumarAPosicionActual(x, y) {
    const xNueva = posicionActual.x() + x
    const yNueva = posicionActual.y() + y
		posicionActual = game.at(xNueva,yNueva)
	}

  method chocarConElEnemigo(enemigo) {
    
    self.generarPosInicial()
    //posible solucion a que dos enemigos se choquen
  }
  
  method moverse(personaje)
  
  method agarrarPower(powerUp) {
    // No hace nada
}

}

class LoboSuelto inherits Enemigo(vida = 10, danio = 2,image = "loboSuelto.png"){

  override method moverse(personaje) {
      if(self.position().x() > personaje.position().x()){
        self.sumarAPosicionActual(-1,0)
      }else if(self.position().x() < personaje.position().x()){
        self.sumarAPosicionActual(1,0)
      }else{
        if(self.position().y() > personaje.position().y()){
          self.sumarAPosicionActual(0,-1)
        }else if(self.position().y() < personaje.position().y()){
          self.sumarAPosicionActual(0,1)
        }
      }
   }
}
//ver de buscar forma más óptima de hacer las listas de ancho y largo
class BarbaAzul inherits Enemigo(vida = 7, danio = 3,image = "barbaAzul.png"){
  
  override method moverse(personaje) {
      if(self.position().x() > personaje.position().x()){
        image = "barbaAzulIzquierda.png"
        self.sumarAPosicionActual(-1,0)
      }else if(self.position().x() < personaje.position().x()){
        image = "barbaAzul.png"
        self.sumarAPosicionActual(1,0)
      }
  }
}

class CorderoAtado inherits Enemigo(vida = 12, danio = 10,image = "corderoAtado.png"){
  //en caso de que lleguemos a hacer enemigos que disparen, este dispararia. Por ahora es un cactus
  override method moverse(personaje) {}//Queda asi porque no se mueve este enemigo
  override method chocarConElEnemigo(enemigo) {
    //no hace nada, porque no se mueve
  }
}

class LuzBelito inherits Enemigo(vida = 7, danio = 3, image = "luzbelito.png"){
    override method moverse(personaje) {
      if(self.position().y() > personaje.position().y()){
        self.sumarAPosicionActual(0,-1)
      }else if(self.position().y() < personaje.position().y()){
        self.sumarAPosicionActual(0,1)
      }
  }
}

object bossFinal inherits Enemigo(vida=30, danio=20, image = "bossFinal.png", posicionActual = game.center()){
   override method moverse(personaje) {
    const distanciaX = (self.position().x() - personaje.position().x()).abs()
    
    if (distanciaX > 1) {
      // Si está a más de 1 cuadrado de distancia en X, se mueve 2 bloques hacia el personaje
      if (self.position().x() > personaje.position().x()) {
        self.sumarAPosicionActual(-2, 0)
      } else {
        self.sumarAPosicionActual(2, 0)
      }
    } else if (distanciaX == 1) {
      // Si está a 1 cuadrado, se mueve exactamente 1 bloque para alcanzarlo
      if (self.position().x() > personaje.position().x()) {
        self.sumarAPosicionActual(-1, 0)
      } else {
        self.sumarAPosicionActual(1, 0)
      }
    } else {
      // Si ya está alineado en X, hacemos lo mismo con el eje Y
      const distanciaY = (self.position().y() - personaje.position().y()).abs()
      
      if (distanciaY > 1) {
        if (self.position().y() > personaje.position().y()) {
          self.sumarAPosicionActual(0, -2)
        } else {
          self.sumarAPosicionActual(0, 2)
        }
      } else if (distanciaY == 1) {
        if (self.position().y() > personaje.position().y()) {
          self.sumarAPosicionActual(0, -1)
        } else {
          self.sumarAPosicionActual(0, 1)
        }
      }
    }
  }

  override method cambiarVida(vidaARestar) {
    vida -= vidaARestar
    if(vida <= 0) {
      administracionEntidades.eliminarEnemigo(self)
      game.removeVisual(self)
      juego.ganaste()
    }
  }
}