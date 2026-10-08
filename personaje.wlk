import juego.juego
import Arma.*

// de momento solo hay un personaje, pero si se quisiera agregar mas personajes, 
// se podria hacer una clase personaje y que cada uno tenga su propia vida, posicion, etc

class Personaje {
    var vida = 5
    const posicionInicial = game.center()
    var property position = posicionInicial
    var armaEnMano
    var balas = []

    const powerUpBoost = [] 
    const image
    
    method vida() = vida

    method image() = image

    //funcion que si el powerUp que agarra es alguna de la lista de powerUps
    //buenas le aplica un beneficio que tiene cada personaje
    method aplicarBeneficio(vidaOtorgada,dañoOtorgado) {
        self.modificarVida(vidaOtorgada)
        armaEnMano.modificarDanio(dañoOtorgado)
    } 
    
   method agarrarPower(powerUp) {
        if (powerUpBoost.contains(powerUp)) {
            // Usa los multiplicadores que cada personaje define a su manera
            const vidaOtorgada = self.multiplicadorVidaBoost(powerUp.vida())
            const dañoOtorgado = self.multiplicadorDanioBoost(powerUp.daño())
            self.aplicarBeneficio(vidaOtorgada, dañoOtorgado)
        } else {
            // Si no está en su lista copada, recibe el beneficio normal
            self.aplicarBeneficio(powerUp.vida(), powerUp.daño())
        }
    }

    // Métodos por defecto (por si un personaje estándar no multiplica nada)
    method multiplicadorVidaBoost(vidaPower)
    method multiplicadorDanioBoost(danioPower)
    
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

    method balas() = balas

    method dispararBala(imagen, esHorizontal, movimiento) {
	const bala = new ArmaDeFuego(danio = armaEnMano.danio(),seMueveHorizontal = esHorizontal,cantidadCasillasMovimiento = movimiento)

	if(esHorizontal) {
		bala.cambiarPosicion(self.position().x() + movimiento, self.position().y())
	}else {
		bala.cambiarPosicion(self.position().x(), self.position().y() + movimiento)
	}

	game.addVisual(bala)
	balas.add(bala)
  }
    
}

object indio inherits Personaje(vida = 10, image = "indio.png", powerUpBoost = [], armaEnMano = new ArmaDeFuego(danio = 2, cantidadCasillasMovimiento = 1)) {
    
    //Hacer logica para los powerUps que los boostean
    override method multiplicadorVidaBoost(vidaPower){
        return vidaPower * 7
    }
    override method multiplicadorDanioBoost(danioPower){
        return danioPower * 8
    }

}


object skay inherits Personaje(vida = 8, image = "skay.png", powerUpBoost = [], armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1)) {
    
    //Hacer logica para los powerUps que los boostean
    override method multiplicadorVidaBoost(vidaPower){
        return vidaPower * 2
    }
    override method multiplicadorDanioBoost(danioPower){
        return danioPower * 2
    }

}
