
#ifndef _UTILS_DELAY   /* Guard against multiple inclusion */
#define _UTILS_DELAY

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>
#include "../mcc_generated_files/usb/usb_device_cdc.h"
#include "../mcc_generated_files/tmr2.h"
#include "../mcc_generated_files/pin_manager.h"
#include "../mcc_generated_files/rtcc.h"
#include "../utils/rgb_manager.h"
#include "../platform/WS2812.h"

//----------------------CREACIÓN DE ESTADOS--------------------------

typedef enum {
    UT_TMR_DELAY_INIT,
    UT_TMR_DELAY_WAIT
} UT_TMR_DELAY_STATE;

typedef struct {
    uint32_t startValue;
    UT_TMR_DELAY_STATE state;
} ut_tmrDelay_t;

typedef enum {
    MOSTRAR_MENU,
    ESPERANDO_RESPUESTA,
    ENVIANDO_RESPUESTA
} respuestaUsuario;

typedef enum {
    INGRESO_MENU,
    INGRESO_FECHA,
    INGRESO_COLOR_LED,
    DAR_RESULTADO_ULTIMO_LED_MODIFICADO
} opcionSeleccionada;

//-----------------------------------------------------------------------------

/** 
  @Function
    bool UT_delayms(ut_tmrDelay_t* p_timer, uint32_t p_ms)
  @Summary
    Controla el tiempo que debe pasar el led prendido y apagado.
  @Parameters
    @param p_timer Puntero al timer que contará la cantidad de ms transcurridos.
    @param p_ms Es el tiempo que querámos que cuente el delay.
  @Returns
    Booleano de si el tiempo que debe transcurrir, pasado como parámetro, ya fue completado.
 */
bool UT_delayms(ut_tmrDelay_t* p_timer, uint32_t p_ms);

/** 
  @Function
    void Delay_Esperar_USB_Configurado(uint16_t var)
  @Summary
    Es un delay bloqueante, el cual se ejecutará al inicio del programa para que el USB esté pronto para transmitir, de lo contrario no será
 * posible mostrar el mensaje del menú en primera instancia ya que capaz no está pronto para la primera ejecución.
  @Parameters
    @param p_var Puntero al timer que contará la cantidad de ms transcurridos.
  @Returns
    
 */
void Delay_Esperar_USB_Configurado(uint16_t var);

void InterfaceUsuario();

/** 
  @Function
    bool verificarCorrectoIngresoFecha(uint8_t dia, uint8_t mes, uint16_t anio, uint8_t hh, uint8_t mm, uint8_t ss);
  @Summary
    Función que verificará que los datos ingresados por el usuario, como fecha y horas sean correctos.
  @Parameters
    @param dia
    @param mes
    @param anio
    @param hh
    @param mm
    @param ss
  @Returns
    Retorna si los valores ingresados por el usuarios fueron correctos. Falso en caso de que no lo sea, Verdadero en caso contrario.
 */
bool verificarCorrectoIngresoFecha(uint8_t dia, uint8_t mes, uint16_t anio, uint8_t hh, uint8_t mm, uint8_t ss);

void PrendidoYApagadoDeLeds();

/** 
  @Function
    void ControladorRespuestasUsuario(opcionElegidaUsuario* eleccionUsuario, hercules* controlarHercules, char* cosasAPonerEnHercules2, uint8_t* ingresoHercules,
        uint8_t* numBytesPasadosPorHercules, struct tm* fechaIngresadaUsuario);
  @Summary
     Realiza las operaciones necesarias para poder controlar los valores ingresador por el usuario. Sus principales funciones son, a través de un 
 * switch, controlar el ingreso al menu, el ingreso de la fecha, el detectar que color y led fueron seleccionados por el usuario, y devolver los
 * datos de la última modificación del usuario.
  @Parameters
    @param *eleccionUsuario puntero a la elección ingresada por el usuario.
    @param *controlarHercules controla la función a realizar por el software herules, ya sea enviando una respuesta, esperando una respuesta o mostrando el menú
    @param *cosasAPonerEnHercules2 texto que será mostrado en hercules.
    @param *ingresoHercules es un puntero a la estructura que contiene lo enviado en el buffer a través del hercules. En definitiva, la respuesta del usuario.
    @param *fechaIngresadaUsuario puntero a la struct que contiene la fecha que puede modificar el usuario o que ya fue modificada por el usuario
 
  @Returns
 */
void ControladorRespuestasUsuario(opcionSeleccionada* eleccionUsuario, respuestaUsuario* controlarHercules, char* cosasAPonerEnHercules2, uint8_t* ingresoHercules,
        struct tm* fechaIngresadaUsuario);

/** 
  @Function
    void ControladorHercules(char* cosasAPonerEnHercules, uint8_t sizeString, hercules* controlarHercules, opcionElegidaUsuario* eleccionUsuario);
  @Summary
    Es el responsable de enviar una respeusta a través del hercules, recibir una respuesta o mostrar el menú al usuario.
  @Parameters
    @param *cosasAPonerEnHercules texto que será mostrado en hercules.
    @param sizeString es el largo del string que será enviado a través del hercules.
    @param *controlarHercules controla la función a realizar por el software herules, ya sea enviando una respuesta, esperando una respuesta o mostrando el menú
    @param *eleccionUsuario puntero a la elección ingresada por el usuario. Se compone de enums.
 
  @Returns
 */
void ControladorHercules(char* cosasAPonerEnHercules, uint8_t sizeString, respuestaUsuario* controlarHercules, opcionSeleccionada* eleccionUsuario);

#endif