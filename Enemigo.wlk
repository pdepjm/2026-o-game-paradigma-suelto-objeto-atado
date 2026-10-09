import juego.*
import Administracion.administracionEntidades

class Enemigo {
  var vida 
  var danio 
  var image 
  var posicionActual = 0

  method vida() = vida
  method danio() = danio

  method generarPosInicial(){
    posicionActual = game.at(1.randomUpTo(game.width()).roundDown(), 1.randomUpTo(game.height()).roundDown())//hacer override en los
    //enemigos que se muevan solo en los bordes en un lugar especifico
    
  }

  method position() = posicionActual

  method image() = image

  method cambiarVida(vidaARestar) {
    vida -= vidaARestar
    if(vida <= 0) {
      administracionEntidades.eliminarEnemigo(self)
      game.removeVisual(self)
      }
  }


  method cambiarPosicion(x, y) {
    const xNueva = posicionActual.x() + x
    const yNueva = posicionActual.y() + y
		posicionActual = game.at(xNueva,yNueva)
	}

  //ver que no funciona, se siguen fusionando
  method chocarConElEnemigo(enemigo) {
    if(posicionActual.x() < game.width()) {
      self.cambiarPosicion(posicionActual.x()+1, posicionActual.y()) 
    }else if(posicionActual.y() < game.height()) {
      self.cambiarPosicion(posicionActual.x(), posicionActual.y()+1) 
    }
    //posible solucion a que dos enemigos se choquen
  }
  method moverse(personaje)
  

}

class LoboSuelto inherits Enemigo(vida = 10, danio = 2,image = "LoboSuelto.png"){

  override method moverse(personaje) {
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
   }
}
//ver de buscar forma más óptima de hacer las listas de ancho y largo
class BarbaAzul inherits Enemigo(vida = 7, danio = 3,image = "barbaAzul.png"){
  
  override method moverse(personaje) {
      if(self.position().x() > personaje.position().x()){
        self.cambiarPosicion(-1,0)
      }else if(self.position().x() < personaje.position().x()){
        self.cambiarPosicion(1,0)
      }
  }
}

class CorderoAtado inherits Enemigo(vida = 12, danio = 10,image = "corderoAtado.png"){
  //en caso de que lleguemos a hacer enemigos que disparen, este dispararia. Por ahora es un cactus
  override method moverse(personaje) {}//Queda asi porque no se mueve este enemigo
}

class Luzbelito inherits Enemigo(vida = 7, danio = 3, image = "luzbelito.png"){
    override method moverse(personaje) {
      if(self.position().y() > personaje.position().y()){
        self.cambiarPosicion(0,-1)
      }else if(self.position().y() < personaje.position().y()){
        self.cambiarPosicion(0,1)
      }
  }
}