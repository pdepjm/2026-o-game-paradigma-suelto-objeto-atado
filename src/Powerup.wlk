import wollok.game.*
import Administracion.administracionEntidades

class PowerUp {
    
    var property position = game.origin() 
    const image
    const tipo

    method image() = image
    
    method vida() = 0
    // Métodos abstractos
    method daño()

    method tipo() = tipo

    method serAgarradoPor(personaje) {
        personaje.agarrarPower(self)
    }

    method generarPosInicial() {
    position = game.at(1.randomUpTo(game.width()).roundDown(), 1.randomUpTo(game.height()).roundDown())
    }
}

// PowerUps

class PuaDeGuitarra inherits PowerUp(image = "pua.png",tipo = "pua") {
    override method daño() = 2
    
}

class Lentes inherits PowerUp(image = "lentes.png", tipo = "lentes") {
    override method vida() = 3
    override method daño() = 1
    
}