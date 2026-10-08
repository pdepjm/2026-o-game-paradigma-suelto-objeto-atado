import Enemigo.*


object nivel1 {
     method fondo() = ""//= pongan imagen 
     method enemigosPosibles()= [LoboSuelto] // agreguen los que quieran
     method tickAparicionEnemigos()=6000
     method cantidadEnemigosRonda()=5
     method siguienteNivel()= nivel2
     method esUltimoNivel() = false

}

object nivel2 {
    method fondo() = ""//=pongan imagen 
     method enemigosPosibles()= [LoboSuelto] // agreguen los que quieran
     method tickAparicionEnemigos()=4000
     method cantidadEnemigosRonda()=8
     method siguienteNivel()= nivel3
     method esUltimoNivel() = false
}

object nivel3{
    method fondo()= "" //= pongan imagen 
     method enemigosPosibles()= [LoboSuelto] // agreguen los que quieran
     method tickAparicionEnemigos()=2000
     method cantidadEnemigosRonda()=11
     method siguienteNivel()= nivel4 //yo hice hasta el 3 pero puedo hacer mas si quieren despues
     method esUltimoNivel() = true
}