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

    method depositar(monto) {
        dineroEnCuenta += monto
    }

    method extraer(monto) {
        dineroEnCuenta -= monto
    }

    method saldo() {
        return(dineroEnCuenta)
    }
}

object cuentaGastosMantenimiento {
    var dineroEnCuenta = 0 
    var costoDeOperacion = 20
    
    method depositar(monto) {
        self.validarDeposito(monto)
        
        dineroEnCuenta += monto - costoDeOperacion    
    }

    method extraer(monto) {
        dineroEnCuenta -= monto
    }

    method validarDeposito(monto) {
        if (monto <= costoDeOperacion){
            self.error("Imposible depositar, dinero insuficiente")
        }
    }
}

object cuentaCombinada {
    var saldo = 0

    method depositar(monto){
        cuentaPrimaria.depositar(monto)
    }

    method saldo(){
        saldo = cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
        return (saldo)
    }
}

object cuentaPrimaria {
    var saldo = 0

    method depositar(monto){
        saldo += monto
    }

    method saldo(){
        return (saldo)
    }
}

object cuentaSecundaria {
    var saldo = 200

    method depositar(monto){
        
    }

    method saldo(){
        return (saldo)
    }
}