#include "utils.h"

// -----------------------CREACIÓN DE VARIABLES GLOBALES-----------------------
ut_tmrDelay_t miTimer = {.startValue = 0,
    .state = UT_TMR_DELAY_INIT};
respuestaUsuario miHercules = MOSTRAR_MENU;
opcionSeleccionada usuarioEleccion = INGRESO_MENU;
char textoAPonerEnHercules[255];

uint16_t contador = 0;
bool estaPrendido = false;
bool inicioDePrograma = true; // Flag que será utilizado para poder mostrar el menú luego de que se haya terminado alguna función.
bool flagPoderElegirOpcion = true; // Flag que será utilizado para poder especificar sea ha de seleccionar una opcion. De esta manera el usuario no podrá ingrear a otra opción sin antes pasar por el menú.
uint8_t numBytes;
uint8_t buffer[64];
char textoAPonerEnHercules[255];
struct tm tiempoIngresadoUsuario; // Será el tiempo que seteará el usuario.
app_register_t ultimaActualizacionUsuario; // Registro que se guardará luego de cada actualización de un led.
//-----------------------------------------------------------------------------
void Delay_Esperar_USB_Configurado(uint16_t var) {
    int inicial = TMR2_SoftwareCounterGet();
    while ((TMR2_SoftwareCounterGet() - inicial) < var) { //Se puede pasar porque no es exacto
        // Realizamos la espera del tiempo necesario en un bucle hasta cumplirse la condicion de arriba.
    }
}

void ControladorRespuestasUsuario(opcionSeleccionada* eleccionUsuario, respuestaUsuario* controlarHercules, char* cosasAPonerEnHercules2, uint8_t* ingresoHercules,
        struct tm* fechaIngresadaUsuario) {
    char hh[3];
    char min[3];
    char ss[3];
    char dd[3];
    char mm[3];
    char aaaa[5];
    char ledElegido[2];
    char colorElegido[2];
    switch (*eleccionUsuario) {
        case INGRESO_MENU:
            if (*ingresoHercules == '1') { //Cambiar a switch luego
                *eleccionUsuario = INGRESO_FECHA;
                strcpy(cosasAPonerEnHercules2, "\nIngrese fecha con el formato dd/mm/aaaa y la hora formato hh:mm:ss. Ej: 20/02/2000-14:34:55\n");
            } else if (*ingresoHercules == '2') {
                *eleccionUsuario = INGRESO_COLOR_LED;
                strcpy(cosasAPonerEnHercules2, "\nIngrese led a prender y color con el formato led_a_prender-color_led. Ej: 4-3\n"
                        "Existen 8 leds, que se enumeran del 0 al 7.\n Los colores son: 0=ROJO 1=VERDE 2=AZUL 3=BLANCO 4=APAGADO\n");
            } else if (*ingresoHercules == '3') {
                *eleccionUsuario = DAR_RESULTADO_ULTIMO_LED_MODIFICADO;
            } else {
                strcpy(cosasAPonerEnHercules2, "\nIngreso incorrecto, vuelva a leer instrucciones\n");
            }
            *controlarHercules = ENVIANDO_RESPUESTA;
            break;
        case INGRESO_FECHA:
            memcpy(hh, &buffer[11], 2); // Separo la hora.
            memcpy(min, &buffer[14], 2); // Separo los minutos.
            memcpy(ss, &buffer[17], 2); // Separo los segundos.
            ss[2] = '\0'; // Se agrega '\0' para poder determinarlo como string y poder utilizar correctamente la función 'atio'.
            min[2] = '\0';
            hh[2] = '\0';
            memcpy(dd, &buffer[0], 2); // Separo el día.
            memcpy(mm, &buffer[3], 2); // Separo el mes.
            memcpy(aaaa, &buffer[6], 4); // Separo el año.
            dd[2] = '\0'; // Se agrega '\0' para poder determinarlo como string y poder utilizar correctamente la función 'atio'.
            mm[2] = '\0';
            aaaa[4] = '\0';
            if (verificarCorrectoIngresoFecha(atoi(dd), atoi(mm), atoi(aaaa), atoi(hh), atoi(min), atoi(ss))) {
                tiempoIngresadoUsuario.tm_hour = atoi(hh);
                tiempoIngresadoUsuario.tm_min = atoi(min);
                tiempoIngresadoUsuario.tm_sec = atoi(ss);
                tiempoIngresadoUsuario.tm_mday = atoi(dd);
                tiempoIngresadoUsuario.tm_mon = atoi(mm);
                tiempoIngresadoUsuario.tm_year = atoi(aaaa);
                sprintf(cosasAPonerEnHercules2, "\nLa fecha ingresada fue correcta: %s/%s/%s-%s:%s:%s\n", dd, mm, aaaa, hh, min, ss);
                RTCC_TimeSet(fechaIngresadaUsuario);
            } else {
                strcpy(cosasAPonerEnHercules2, "\nLa fecha ingresada no es correcta, favor de volver a intentar\n");
            }
            *controlarHercules = ENVIANDO_RESPUESTA;
            inicioDePrograma = true;
            flagPoderElegirOpcion = true;
            break;
        case INGRESO_COLOR_LED:
            memcpy(ledElegido, &buffer[0], 1); // Separo el led a prender.
            memcpy(colorElegido, &buffer[2], 1); // Separo el color que se le colocará al led.
            ledElegido[1] = '\0'; // Se agrega '\0' para poder determinarlo como string y poder utilizar correctamente la función 'atio'.
            colorElegido[1] = '\0';
            if (RGB_prender_led(atoi(ledElegido), atoi(colorElegido))) {
                sprintf(cosasAPonerEnHercules2, "\nHa ingresado prender el led N° %s con el color %s\n", ledElegido, colorElegido);
                ultimaActualizacionUsuario.color = atoi(colorElegido);
                ultimaActualizacionUsuario.led = atoi(ledElegido);
                ultimaActualizacionUsuario.time = (uint32_t) mktime(&tiempoIngresadoUsuario);
            } else {
                strcpy(cosasAPonerEnHercules2, "\nEl led o color elegido no son correctos. Vuelva a seleccionar la opción\n");
            }
            inicioDePrograma = true;
            flagPoderElegirOpcion = true;
            *controlarHercules = ENVIANDO_RESPUESTA;
            break;
        case DAR_RESULTADO_ULTIMO_LED_MODIFICADO:
            RTCC_TimeGet(fechaIngresadaUsuario);
            sprintf(cosasAPonerEnHercules2, "\nEl último led modificado fue %d, con un color %d, a la fecha: %d/%d/%d y hora: %d:%d:%d\n",
                    ultimaActualizacionUsuario.led, ultimaActualizacionUsuario.color, fechaIngresadaUsuario->tm_mday, fechaIngresadaUsuario->tm_mon,
                    fechaIngresadaUsuario->tm_year, fechaIngresadaUsuario->tm_hour, fechaIngresadaUsuario->tm_min, fechaIngresadaUsuario->tm_sec);
            inicioDePrograma = true;
            flagPoderElegirOpcion = true;
            *controlarHercules = ENVIANDO_RESPUESTA;
            break;
        default:
            break;
    }
}

void ControladorHercules(char* cosasAPonerEnHercules, uint8_t sizeString, respuestaUsuario* controlarHercules, opcionSeleccionada* eleccionUsuario) {
    if ((USBGetDeviceState() < CONFIGURED_STATE) ||
            (USBIsDeviceSuspended() == true)) {
        // No realizo ninguna accion ya que el USB no está listo para ser utilizado.
    } else {
        CDCTxService();
        if (USBUSARTIsTxTrfReady()) { // Lo usamos para saber si la ultima transferencia fue completada y esta disponible pare recibir otro paquete.
            switch (*controlarHercules) {
                case ESPERANDO_RESPUESTA:
                    numBytes = getsUSBUSART(buffer, sizeof (buffer));
                    if (numBytes != 0) {
                        if ((numBytes == 1) && flagPoderElegirOpcion) {
                            *eleccionUsuario = INGRESO_MENU;
                            flagPoderElegirOpcion = false;
                            ControladorRespuestasUsuario(eleccionUsuario, controlarHercules, cosasAPonerEnHercules, &buffer[0], &tiempoIngresadoUsuario);
                        } else if (numBytes == 19 && !flagPoderElegirOpcion && (*eleccionUsuario == INGRESO_FECHA)) {
                            ControladorRespuestasUsuario(eleccionUsuario, controlarHercules, cosasAPonerEnHercules, buffer, &tiempoIngresadoUsuario);
                        } else if (numBytes == 3 && !flagPoderElegirOpcion && (*eleccionUsuario == INGRESO_COLOR_LED)) {
                            ControladorRespuestasUsuario(eleccionUsuario, controlarHercules, cosasAPonerEnHercules, buffer, &tiempoIngresadoUsuario);
                        } else if (numBytes == 1 && !flagPoderElegirOpcion && (*eleccionUsuario == DAR_RESULTADO_ULTIMO_LED_MODIFICADO)) {
                            ControladorRespuestasUsuario(eleccionUsuario, controlarHercules, cosasAPonerEnHercules, buffer, &tiempoIngresadoUsuario);
                        } else {
                            strcpy(cosasAPonerEnHercules, "\nNo es un ingreso valido.\n");
                            *controlarHercules = ENVIANDO_RESPUESTA;
                        }
                    }
                    break;
                case ENVIANDO_RESPUESTA:
                    putUSBUSART(cosasAPonerEnHercules, sizeString);
                    *controlarHercules = ESPERANDO_RESPUESTA;
                    if (inicioDePrograma) {
                        *controlarHercules = MOSTRAR_MENU;
                    }
                    break;
                case MOSTRAR_MENU:
                    inicioDePrograma = false;
                    strcpy(textoAPonerEnHercules, "\nPara fijar fecha y hora introduzca 1\n"
                            "Para Encender/Apagar un led en particular introduzca 2\n"
                            "Para consultar estado, fecha y hora del ultimo led modificado presione 3\n");
                    *eleccionUsuario = INGRESO_MENU;
                    *controlarHercules = ENVIANDO_RESPUESTA;
                    break;
            }
        }
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

void InterfaceUsuario() {
    ControladorHercules(textoAPonerEnHercules, strlen(textoAPonerEnHercules), &miHercules, &usuarioEleccion);
}