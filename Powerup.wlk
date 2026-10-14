import wollok.game.*
import Administracion.administracionEntidades

class PowerUp {
    var property position = game.origin() 
    const image

    method image() = image
    
    // Métodos abstractos
    method vida()
    method daño()
    method tipo()

    method serAgarradoPor(personaje) {
        personaje.agarrarPower(self)
        
    }

    method generarPosInicial() {
    position = game.at(1.randomUpTo(game.width()).roundDown(), 1.randomUpTo(game.height()).roundDown())
    }

}

// PowerUps

class PuaDeGuitarra inherits PowerUp(image = "pua.png") {
    override method tipo() = "Arma"
    override method vida() = 0
    override method daño() = 2
}

class Lentes inherits PowerUp(image = "lentes.png") {
    override method tipo() = "Defensa"
    override method vida() = 3
    override method daño() = 1
}