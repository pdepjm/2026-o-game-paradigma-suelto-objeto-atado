import src.Administracion.*
import juego.juego
import Arma.*
import Powerup.*


class Personaje {
    var vida = vidaInicial
    var vidaInicial
    const posicionInicial = game.center()
    const nombrePersonaje
    var direccion = "Derecha"
    var property position = posicionInicial
    var armaEnMano
    var balas = []
    const powerUpsConvenientes = []
    const boostPowerUp


    method vida() = vida

    method image() = nombrePersonaje + direccion + ".png"

    method aplicarBeneficio(vidaOtorgada,dañoOtorgado) {
        self.modificarVida(vidaOtorgada)
        armaEnMano.modificarDanio(dañoOtorgado)
    } 

    method agarrarPower(powerUp) {    
        const modificacionVida = powerUp.vida()
        const modificacionDaño = powerUp.daño()
        if(powerUpsConvenientes.contains(powerUp.tipo())) {
            self.boostearPowerUp(modificacionVida, modificacionDaño)
        }else {
            self.aplicarBeneficio(modificacionVida,modificacionDaño)
        }
        game.say(self,"powerUp agarrado")
        game.removeVisual(powerUp)
    }

    method boostearPowerUp(modificacionVida, modificacionDaño)
    

    method cambiarDireccion(nuevaDireccion) {
        direccion = nuevaDireccion
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

    method balas() = balas

    method dispararBala(imagen, esHorizontal, movimiento) {
	const bala = new ArmaDeFuego(danio = armaEnMano.danio(),seMueveHorizontal = esHorizontal,cantidadCasillasMovimiento = movimiento, image = imagen)
    
	if(esHorizontal) {
		bala.cambiarPosicion(self.position().x() + movimiento, self.position().y())
	}else {
		bala.cambiarPosicion(self.position().x(), self.position().y() + movimiento)
	}

	game.addVisual(bala)
	balas.add(bala)
  }
    method reiniciar() {
    vida = vidaInicial // o el valor de vida inicial que uses
    position = posicionInicial // la posición inicial donde arranca en el tablero
  }
}

object indio inherits Personaje(vidaInicial = 10,nombrePersonaje = "indio", armaEnMano = new ArmaDeFuego(danio = 2, cantidadCasillasMovimiento = 1), boostPowerUp = 2, powerUpsConvenientes = ["lentes"]) {
    
    
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const aumento = [1,2,3,4,5].anyOne()
        self.aplicarBeneficio(modificacionVida + aumento, modificacionDaño + aumento)
    }

}


object skay inherits Personaje(vidaInicial = 8, nombrePersonaje="skay" , armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1), boostPowerUp= 1, powerUpsConvenientes = ["pua"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const enemigos = administracionEntidades.getCantidadEnemigos()
        self.aplicarBeneficio(modificacionVida + (enemigos / 2).roundUp(), modificacionDaño + (enemigos / 2).roundUp())
    }
}

object semilla inherits Personaje(vidaInicial = 5,nombrePersonaje="semilla",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1), boostPowerUp = 2, powerUpsConvenientes = ["pua"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        
    }
}   

object walter inherits Personaje(vidaInicial = 5, nombrePersonaje="walter",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1), boostPowerUp= 3, powerUpsConvenientes = ["lentes", "pua"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        
    }
}

object sergio inherits Personaje(vidaInicial = 5, nombrePersonaje="sergio",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1), boostPowerUp = 5, powerUpsConvenientes = ["lentes"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        
    }
}
object personajeNulo {
    method cambiarDireccion(nuevadireccion){}
    method dispararBala(imagen,esHorizontal,movimiento) {}
}