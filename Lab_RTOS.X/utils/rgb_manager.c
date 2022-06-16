/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */

#include "rgb_manager.h"

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

static ws2812_t array_leds[8];


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */

/* ************************************************************************** */

void RGB_elegir_color(uint8_t index, enum colores_leds color) {
    switch (color) {
        case ROJO:
            array_leds[index] = RED;
            break;
        case VERDE:
            array_leds[index] = GREEN;
            break;
        case AZUL:
            array_leds[index] = BLUE;
            break;
        case BLANCO:
            array_leds[index] = WHITE;
            break;
        case APAGADO:
            array_leds[index] = OFF;
            break;
        default:
            break;
    }
}

bool RGB_prender_led(uint8_t index, enum colores_leds color) {
    if ((0 <= index <= 7) && (0 <= color <= 4)) {
        RGB_elegir_color(index, color);
        WS2812_send(array_leds, 8);
        return true;
    }
    return false;
}

void RGB_apagar_led(uint8_t index) {
    RGB_elegir_color(index, 4); //Ya que el 4 es APAGADO
    WS2812_send(array_leds, 8);
}

/* *****************************************************************************
 End of File
 */