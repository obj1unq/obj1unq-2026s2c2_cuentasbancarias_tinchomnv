object casa {
    var cuentaPredeterminada = cuentaCombinada
    var gastosDelMes = 0 

    method gasto(monto) {
        cuentaPredeterminada.extraer(monto)
        gastosDelMes += monto
    }

    method cambioDeMes() {
        gastosDelMes = 0
    }
}

// Cuenta secundaria
object cuentaCorriente {
    var saldo = 300

    method depositar(monto) {
        saldo += monto
    }

    method extraer(monto) {
        saldo -= monto
    }

    method saldo() {
        return(saldo)
    }
}

// Cuenta Primaria
object cuentaGastosMantenimiento {  
    var saldo = 0 
    var costoDeOperacion = 20
    
    method depositar(monto) {
        self.validarDeposito(monto)
        saldo += monto - costoDeOperacion    
    }

    method extraer(monto) {
        saldo -= monto
    }

    method validarDeposito(monto) {
        if (monto <= costoDeOperacion){
            self.error("Imposible depositar, dinero insuficiente")
        }
    }

    method saldo() {
      return (saldo)
    }

    method montoQuePuedeExtraer(monto) {
        return 0.max(saldo).min(monto)
    }
}

object cuentaCombinada {
    var saldo = 0
    const cuentaPrimaria = cuentaGastosMantenimiento
    const cuentaSecundaria = cuentaCorriente

    method depositar(monto) {
        cuentaPrimaria.depositar(monto)
        saldo += self.saldo()
    }

    method saldo() {
        saldo = 0.max(cuentaPrimaria.saldo()) + 0.max(cuentaSecundaria.saldo())
        return (saldo)
    }

    method extraer(monto) {
        self.validarSaldoCombinado(monto)
        
        var dePrimaria = cuentaPrimaria.montoQuePuedeExtraer(monto)

        cuentaPrimaria.extraer(dePrimaria)
        cuentaSecundaria.extraer(monto - dePrimaria)
        self.saldo()
    }

    method validarSaldoCombinado(monto) {
        if (monto > self.saldo()){
            self.error("El monto a extraer es superior al saldo de la cuenta combinada")
        }
    }
}