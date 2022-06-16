#include "utils.h"

// -----------------------CREACIÓN DE VARIABLES GLOBALES-----------------------
ut_tmrDelay_t miTimer = {.startValue = 0,
    .state = UT_TMR_DELAY_INIT};
//-----------------------------------------------------------------------------
void Delay_Esperar_USB_Configurado(uint16_t var) {
    int inicial = TMR2_SoftwareCounterGet();
    while ((TMR2_SoftwareCounterGet() - inicial) < var) { //Se puede pasar porque no es exacto
        // Realizamos la espera del tiempo necesario en un bucle hasta cumplirse la condicion de arriba.
    }
}

bool verificarCorrectoIngresoFecha(uint8_t dia, uint8_t mes, uint16_t anio, uint8_t hh, uint8_t mm, uint8_t ss) {
    bool correcto = false;
    if (hh >= 0 && hh <= 23 && mm >= 0 && mm <= 59 && ss >= 0 && ss <= 59) {
        correcto = true;
    }
    if (mes >= 1 && mes <= 12) {
        switch (mes) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                if (dia >= 1 && dia <= 31) {
                    correcto = true;
                };
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                if (dia >= 1 && dia <= 30) {
                    correcto = true;
                };
                break;
            case 2:
                //Si el año es bisiesto +1 día.
                if ((anio % 4 == 0) && (anio % 100 != 0) || (anio % 400 == 0)) {
                    if (dia >= 1 && dia <= 29) {
                        correcto = true;
                    };
                } else {
                    if (dia >= 1 && dia <= 28) {
                        correcto = true;
                    }
                }
                break;
        }
    }
    return correcto;
}