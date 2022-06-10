
#ifndef _UTILS_DELAY   /* Guard against multiple inclusion */
#define _UTILS_DELAY

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>
#include "../mcc_generated_files/tmr2.h"
#include "../mcc_generated_files/pin_manager.h"

//----------------------CREACI�N DE ESTADOS--------------------------

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
    @param p_timer Puntero al timer que contar� la cantidad de ms transcurridos.
    @param p_ms Es el tiempo que quer�mos que cuente el delay.
  @Returns
    Booleano de si el tiempo que debe transcurrir, pasado como par�metro, ya fue completado.
 */
bool UT_delayms(ut_tmrDelay_t* p_timer, uint32_t p_ms);

/** 
  @Function
    void Delay_Esperar_USB_Configurado(uint16_t var)
  @Summary
    Es un delay bloqueante, el cual se ejecutar� al inicio del programa para que el USB est� pronto para transmitir, de lo contrario no ser�
 * posible mostrar el mensaje del men� en primera instancia ya que capaz no est� pronto para la primera ejecuci�n.
  @Parameters
    @param p_var Puntero al timer que contar� la cantidad de ms transcurridos.
  @Returns
    
 */
void Delay_Esperar_USB_Configurado(uint16_t var);

/** 
  @Function
    bool verificarCorrectoIngresoFecha(uint8_t dia, uint8_t mes, uint16_t anio, uint8_t hh, uint8_t mm, uint8_t ss);
  @Summary
    Funci�n que verificar� que los datos ingresados por el usuario, como fecha y horas sean correctos.
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