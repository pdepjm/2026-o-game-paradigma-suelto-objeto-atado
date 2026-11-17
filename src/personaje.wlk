import src.Administracion.*
import juego.juego
import Arma.*
import Powerup.*


class Personaje {
    var vidaInicial
    var vida = vidaInicial
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
        game.sound("PowerUp.mp3").play()
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
        vidaJugador.actualizarVida(vida)
    }

    method chocarConElEnemigo(enemigo) {
        self.modificarVida(-(enemigo.danio()))
        game.sound("Danio.mp3").play()
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
    const disparo = game.sound("Disparo.mp3")
    disparo.volume(0.1)
    disparo.play()
	balas.add(bala)
  }
    method reiniciar() {
    vida = vidaInicial // o el valor de vida inicial que uses
    position = posicionInicial // la posición inicial donde arranca en el tablero
    direccion = "Derecha"
    balas.clear()
    armaEnMano.reiniciarDanio()
  }
}

object indio inherits Personaje(vidaInicial = 10,nombrePersonaje = "indio", armaEnMano = new ArmaDeFuego(danio = 2, cantidadCasillasMovimiento = 1), boostPowerUp = 2, powerUpsConvenientes = ["lentes","whisky"]) {
    
    
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const aumento = [1,2,3,4,5].anyOne()
        self.aplicarBeneficio(modificacionVida + aumento, modificacionDaño + aumento)
    }

}


object skay inherits Personaje(vidaInicial = 8, nombrePersonaje="skay" , armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1), boostPowerUp= 1, powerUpsConvenientes = ["pua","whisky","saxo"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const enemigos = administracionEntidades.getCantidadEnemigos()
        self.aplicarBeneficio(modificacionVida + (enemigos / 2).roundUp(), modificacionDaño + (enemigos / 2).roundUp())
    }
}

object semilla inherits Personaje(vidaInicial = 5,nombrePersonaje="semilla",armaEnMano = new ArmaDeFuego(danio = 4, cantidadCasillasMovimiento = 1), boostPowerUp = 2, powerUpsConvenientes = ["pua","whisky"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const bonusArte = juego.nivelActual().cantidadEnemigosRonda() * 0.5
        self.aplicarBeneficio(modificacionVida + bonusArte, modificacionDaño + 1)
    }
}   

object walter inherits Personaje(vidaInicial = 6, nombrePersonaje="walter",armaEnMano = new ArmaDeFuego(danio = 6, cantidadCasillasMovimiento = 1), boostPowerUp= 3, powerUpsConvenientes = ["lentes", "pua","whisky","palillos"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const bonusRitmico = [1, 2].anyOne()
        self.aplicarBeneficio(modificacionVida + bonusRitmico, modificacionDaño + bonusRitmico)
    }
}

object sergio inherits Personaje(vidaInicial = 10, nombrePersonaje="sergio",armaEnMano = new ArmaDeFuego(danio = 2, cantidadCasillasMovimiento = 1), boostPowerUp = 5, powerUpsConvenientes = ["lentes","whisky","saxo"]) {
    override method boostearPowerUp(modificacionVida, modificacionDaño) {
        const bonusRitmico = [4,2,6,8].anyOne()
        self.aplicarBeneficio(modificacionVida + bonusRitmico, modificacionDaño + bonusRitmico)
    }
}
object personajeNulo {
    const balas = []
    method balas() = balas
    method cambiarDireccion(nuevadireccion){}
    method dispararBala(imagen,esHorizontal,movimiento) {}
}