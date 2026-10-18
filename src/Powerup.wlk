import wollok.game.*
import Administracion.administracionEntidades

class PowerUp {
    var property position = game.origin() 
    const image

    method image() = image
    
    method vida() = 0
    // Métodos abstractos
    method daño()

    method serAgarradoPor(personaje) {
        personaje.agarrarPower(self)
      //  game.removeVisual(self)
    }

    method generarPosInicial() {
    position = game.at(1.randomUpTo(game.width()).roundDown(), 1.randomUpTo(game.height()).roundDown())
    }

    method otorgarA(personaje)

}

// PowerUps

class PuaDeGuitarra inherits PowerUp(image = "pua.png") {
    override method daño() = 2
    override method otorgarA(personaje) {
        personaje.recibirPua(self)
    }
}

class Lentes inherits PowerUp(image = "lentes.png") {
    override method vida() = 3
    override method daño() = 1
    override method otorgarA(personaje) {
        personaje.recibirLentes(self)
    }
}