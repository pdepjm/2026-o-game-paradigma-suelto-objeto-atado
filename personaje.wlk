import juego.juego

// de momento solo hay un personaje, pero si se quisiera agregar mas personajes, 
// se podria hacer una clase personaje y que cada uno tenga su propia vida, posicion, etc

object personaje {
    var vida = 5
    var image = "indio.png"
    var posicionInicial = game.center()
    var property position = posicionInicial
    
    method vida() = vida

    method image() = image

    method cambiarPersonaje(nuevoPersonaje) {
        image = nuevoPersonaje
    }

    method modificarVida(valor) {
        vida += valor
        if(vida <= 0 ) {
            game.say(self, "Perdi")
            juego.perder()
        }
    }

    method chocarConElEnemigo(enemigo) {
        self.modificarVida(-(enemigo.danio()))
        game.say(self, "Dolor")
    }
    
}
