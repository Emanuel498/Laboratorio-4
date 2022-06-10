
#ifndef _UTILS_DELAY   /* Guard against multiple inclusion */
#define _UTILS_DELAY

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>
#include "../mcc_generated_files/tmr2.h"
#include "../mcc_generated_files/pin_manager.h"

//----------------------CREACIÓN DE ESTADOS--------------------------

typedef enum {
    UT_TMR_DELAY_INIT,
    UT_TMR_DELAY_WAIT
} UT_TMR_DELAY_STATE;

typedef struct {
    uint32_t startValue;
    UT_TMR_DELAY_STATE state;
} ut_tmrDelay_t;

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

#endif