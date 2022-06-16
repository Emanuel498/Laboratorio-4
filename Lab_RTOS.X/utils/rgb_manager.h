/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include "../platform/WS2812.h"
#include <stdbool.h>

enum colores_leds {
    ROJO,
    VERDE,
    AZUL,
    BLANCO,
    APAGADO
};

typedef struct {
    uint8_t led;
    uint8_t color;
    uint32_t time;
} app_register_t;

void RGB_elegir_color(uint8_t index, enum colores_leds color);
bool RGB_prender_led(uint8_t index, enum colores_leds color);
void RGB_apagar_led(uint8_t index);
/* *****************************************************************************
 End of File
 */