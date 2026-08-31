object casa {
    var cuentaPredeterminada = cuentaCorriente
    var gastosDelMes = 0 

    method gasto(monto) {
        cuentaPredeterminada.extraer(monto)
        gastosDelMes += monto
    }

    method cambioDeMes() {
        gastosDelMes = 0
    }
}

object cuentaCorriente {
    var dineroEnCuenta = 300

    method depositar(cantidad) {
        dineroEnCuenta += cantidad
    }

    method extraer(cantidad) {
        dineroEnCuenta -= cantidad
    }

    method saldo() {
        return(dineroEnCuenta)
    }
}

object cuentaGastosMantenimiento {
    method name() {
      
    }
}