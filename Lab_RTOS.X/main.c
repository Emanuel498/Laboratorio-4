/**
  Generated main.c file from MPLAB Code Configurator

  @Company
    Microchip Technology Inc.

  @File Name
    main.c

  @Summary
    This is the generated main.c using PIC24 / dsPIC33 / PIC32MM MCUs.

  @Description
    This source file provides main entry point for system initialization and application code development.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.167.0
        Device            :  PIC32MM0256GPM064
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.50
        MPLAB 	          :  MPLAB X v5.35
 */

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
 */

/**
  Section: Included Files
 */

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"

#include "mcc_generated_files/system.h"
#include "mcc_generated_files/pin_manager.h"
#include "utils/utils.h"
#include "freeRTOS/include/queue.h"
#include "freeRTOS/include/semphr.h"
#include "freeRTOS/include/timers.h"
#include "../Lab_RTOS.X/mcc_generated_files/rtcc.h"
#include "../Lab_RTOS.X/utils/rgb_manager.h"
#include "../Lab_RTOS.X/platform/WS2812.h"
#include "../Lab_RTOS.X/mcc_generated_files/usb/usb_device_cdc.h"

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

void blinkLED(void *p_param);
void prenderLedsGuardadosEnLaCola(void *p_param);
SemaphoreHandle_t semaCambiarColor; //Inicializa en 1.
TimerHandle_t timerColocarEnQueue;
QueueHandle_t queueGuardarLeds; // Son 4 porque cada char es un byte

respuestaUsuario controlarHercules = MOSTRAR_MENU; // Al iniciar el programa debemos mostrar el menú.
app_register_t ledYColorAPrender;
bool estaPrendido = false;
bool inicioDePrograma = true; // Flag que será utilizado para poder mostrar el menú luego de que se haya terminado alguna función.
bool flagPoderElegirOpcion = true; // Flag que será utilizado para poder especificar sea ha de seleccionar una opcion. De esta manera el usuario no podrá ingrear a otra opción sin antes pasar por el menú.
uint8_t numBytes;
uint8_t buffer[20];
char cosasAPonerEnHercules[255];
struct tm tiempoIngresadoUsuario;
opcionSeleccionada eleccionUsuario = INGRESO_MENU;
app_register_t ultimaActualizacionUsuario;

void menu() {
    switch (buffer[0]) {
        case '1':
            eleccionUsuario = INGRESO_FECHA;
            strcpy(cosasAPonerEnHercules, "\nIngrese fecha con el formato dd/mm/aaaa y la hora formato hh:mm:ss. Ej: 20/02/2000-14:34:55\n");
            break;
        case '2':
            eleccionUsuario = INGRESO_COLOR_LED;
            strcpy(cosasAPonerEnHercules, "\nIngrese formato led_a_prender-color_led-tiempo_espera_antes_de_prender_en_segundos. Ej: 4-3-5\n"
                    "Existen 8 leds, que se enumeran del 0 al 7.\n Los colores son: 0=ROJO 1=VERDE 2=AZUL 3=BLANCO 4=APAGADO\n");
            break;
        case '3':
            eleccionUsuario = DAR_RESULTADO_ULTIMO_LED_MODIFICADO;
            flagPoderElegirOpcion = false;
            break;
        default:
            strcpy(cosasAPonerEnHercules, "\nIngreso incorrecto, vuelva a leer instrucciones\n");
            break;
    }
    controlarHercules = ENVIANDO_RESPUESTA;
}

void ingresoFecha() {
    char hh[3];
    char min[3];
    char ss[3];
    char dd[3];
    char mm[3];
    char aaaa[5];
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
        //-------------------------------TIENE QUE HABER SEMFORO-------------------------------
        tiempoIngresadoUsuario.tm_hour = atoi(hh);
        tiempoIngresadoUsuario.tm_min = atoi(min);
        tiempoIngresadoUsuario.tm_sec = atoi(ss);
        tiempoIngresadoUsuario.tm_mday = atoi(dd);
        tiempoIngresadoUsuario.tm_mon = atoi(mm);
        tiempoIngresadoUsuario.tm_year = abs(atoi(aaaa) - 1900);
        sprintf(cosasAPonerEnHercules, "\nLa fecha ingresada fue correcta: %s/%s/%s-%s:%s:%s\n", dd, mm, aaaa, hh, min, ss);
        RTCC_TimeSet(&tiempoIngresadoUsuario);
        //--------------------------------------------------------------------------------------
    } else {
        strcpy(cosasAPonerEnHercules, "\nLa fecha ingresada no es correcta, favor de volver a intentar\n");
    }
    controlarHercules = ENVIANDO_RESPUESTA;
    inicioDePrograma = true;
    flagPoderElegirOpcion = true;
}

void darUltimoLedPrendido() {
    //if (xSemaphoreTake(semaCambiarColor, (TickType_t) 10) == pdTRUE) {
    RTCC_TimeGet(&tiempoIngresadoUsuario);
    sprintf(cosasAPonerEnHercules, "\nEl último led modificado fue %d, con un color %d, a la fecha: %d/%d/%d y hora: %d:%d:%d\n",
            ultimaActualizacionUsuario.led, ultimaActualizacionUsuario.color, tiempoIngresadoUsuario.tm_mday, tiempoIngresadoUsuario.tm_mon,
            (tiempoIngresadoUsuario.tm_year + 1900), tiempoIngresadoUsuario.tm_hour, tiempoIngresadoUsuario.tm_min, tiempoIngresadoUsuario.tm_sec);
    controlarHercules = ENVIANDO_RESPUESTA;
    inicioDePrograma = true;
    //}
    //xSemaphoreGive(semaCambiarColor);
}

void callBackEnviarAQueue(TimerHandle_t xTimer) {
    xQueueSend(queueGuardarLeds, (void *) pvTimerGetTimerID(xTimer), (TickType_t) 100);
    free((void *) pvTimerGetTimerID(xTimer));
    xTimerDelete(xTimer, (TickType_t) 10);
}

void recibirYProcesarComandosRecibidos(void *p_param) {
    SemaphoreHandle_t xSemaphore = *(SemaphoreHandle_t *) p_param;
    vTaskDelay(pdMS_TO_TICKS(4000)); // Realizamos una espera para dar el tiempo, al usuario, a poder abrir Hercules de manera correcta de 4 segundos. 
    // De lo contrario al abrir Hercules capaz que ya le mostro el menú de opciones antes de que abriera Hercules.
    while (1) {
        if ((USBGetDeviceState() < CONFIGURED_STATE) ||
                (USBIsDeviceSuspended() == true)) {
            // No realizo ninguna accion ya que el USB no está listo para ser utilizado.
        } else {
            CDCTxService();
            if (USBUSARTIsTxTrfReady()) { // Lo usamos para saber si la ultima transferencia fue completada y esta disponible pare recibir otro paquete.
                numBytes = getsUSBUSART(buffer, sizeof (buffer));
                switch (controlarHercules) {
                    case ESPERANDO_RESPUESTA:
                        if (numBytes != 0) {
                            if ((numBytes == 1) && flagPoderElegirOpcion) {
                                flagPoderElegirOpcion = false;
                                menu();
                            } else if (numBytes == 5 && !flagPoderElegirOpcion && (eleccionUsuario == INGRESO_COLOR_LED)) {
                                app_register_t* malloquin = (app_register_t *) malloc(sizeof (app_register_t)); //debo colocar los valores dentro
                                malloquin->color = atoi(&buffer[2] + '\0');
                                malloquin->led = atoi(&buffer[0] + '\0');
                                timerColocarEnQueue = xTimerCreate("timerID", (TickType_t) 1000 * atoi(&buffer[4]), pdFALSE, (void *) malloquin, callBackEnviarAQueue);
                                xTimerStart(timerColocarEnQueue, 10);
                            } else if (numBytes == 19 && !flagPoderElegirOpcion && (eleccionUsuario == INGRESO_FECHA)) {
                                ingresoFecha();
                            } else {
                                strcpy(cosasAPonerEnHercules, "\nNo es un ingreso valido.\n");
                                controlarHercules = ENVIANDO_RESPUESTA;
                            }
                        }
                        break;
                    case ENVIANDO_RESPUESTA:
                        if (!flagPoderElegirOpcion && (eleccionUsuario == DAR_RESULTADO_ULTIMO_LED_MODIFICADO)) {
                            darUltimoLedPrendido();
                            flagPoderElegirOpcion = true;
                        }
                        putUSBUSART(cosasAPonerEnHercules, strlen(cosasAPonerEnHercules));
                        controlarHercules = ESPERANDO_RESPUESTA;
                        if (inicioDePrograma) {
                            controlarHercules = MOSTRAR_MENU;
                        }
                        break;
                    case MOSTRAR_MENU:
                        strcpy(cosasAPonerEnHercules, "\nPara fijar fecha y hora introduzca 1\n"
                                "Para Encender/Apagar un led en particular introduzca 2\n"
                                "Para consultar estado, fecha y hora del ultimo led modificado presione 3\n");
                        inicioDePrograma = false;
                        eleccionUsuario = INGRESO_MENU;
                        controlarHercules = ENVIANDO_RESPUESTA;
                        break;
                }
            }
        }
    }
}

void blinkLED(void *p_param) {
    while (1) {
        LED_A_SetHigh();
        vTaskDelay(pdMS_TO_TICKS(400));
        LED_A_SetLow();
        vTaskDelay(pdMS_TO_TICKS(800));
    }
}

void prenderLedsGuardadosEnLaCola(void *p_param) {
    while (1) {
        if (queueGuardarLeds != 0) {
            //if (xSemaphoreTake(semaCambiarColor, (TickType_t) 10) == pdTRUE) {
            if (xQueueReceive(queueGuardarLeds, &ledYColorAPrender, (TickType_t) 10)) { //Recibo led a prender de la cola

                //char ledElegido[2];
                //char colorElegido[2];
                //memcpy(ledElegido, &ledYColorAPrender[0], 1); // Separo el led a prender.
                //memcpy(colorElegido, &ledYColorAPrender[2], 1); // Separo el color que se le colocará al led.
                //ledElegido[1] = '\0'; // Se agrega '\0' para poder determinarlo como string y poder utilizar correctamente la función 'atoi'.
                //colorElegido[1] = '\0';
                if (RGB_prender_led(ledYColorAPrender.led, ledYColorAPrender.color)) {
                    RGB_prender_led(7, 0);
                    sprintf(cosasAPonerEnHercules, "\nHa ingresado prender el led N° %s con el color %s\n", ledYColorAPrender.led, ledYColorAPrender.color);
                    //------------------------COLOCAR SEMAFORO-------------------------------
                    ultimaActualizacionUsuario.color = ledYColorAPrender.led;
                    ultimaActualizacionUsuario.led = ledYColorAPrender.color;
                    ultimaActualizacionUsuario.time = (uint32_t) mktime(&tiempoIngresadoUsuario);
                    //-----------------------------------------------------------------------
                } else {
                    strcpy(cosasAPonerEnHercules, "\nEl led o color elegido no son correctos. Vuelva a seleccionar la opción\n");
                }
                controlarHercules = ENVIANDO_RESPUESTA;
                inicioDePrograma = true;
                flagPoderElegirOpcion = true;
            }
        }
        //xSemaphoreGive(semaCambiarColor);
    }
    //}
    //------------------------------------------------------------------------------------------------------------------
}

/*
                         Main application
 */
int main(void) {
    // initialize the device
    SYSTEM_Initialize();
    TMR2_SoftwareCounterClear(); //Limpia el contador para arrancar en 0, así no tener registros anteriores.
    TMR2_Start(); //Comienza a correr TRM2

    semaCambiarColor = xSemaphoreCreateMutex();
    queueGuardarLeds = xQueueCreate(5, 4);
    /* Create the tasks defined within this file. */
    xTaskCreate(blinkLED, "taskA", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
    xTaskCreate(recibirYProcesarComandosRecibidos, "taskB", configMINIMAL_STACK_SIZE, &semaCambiarColor, tskIDLE_PRIORITY + 1, NULL);
    xTaskCreate(prenderLedsGuardadosEnLaCola, "taskC", configMINIMAL_STACK_SIZE, &semaCambiarColor, tskIDLE_PRIORITY + 1, NULL);

    /* Finally start the scheduler. */
    vTaskStartScheduler();

    /* If all is well, the scheduler will now be running, and the following line
    will never be reached.  If the following line does execute, then there was
    insufficient FreeRTOS heap memory available for the idle and/or timer tasks
    to be created.  See the memory management section on the FreeRTOS web site
    for more details. */
    for (;;);
}

void vApplicationMallocFailedHook(void) {
    /* vApplicationMallocFailedHook() will only be called if
    configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
    function that will get called if a call to pvPortMalloc() fails.
    pvPortMalloc() is called internally by the kernel whenever a task, queue,
    timer or semaphore is created.  It is also called by various parts of the
    demo application.  If heap_1.c or heap_2.c are used, then the size of the
    heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
    FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
    to query the size of free heap space that remains (although it does not
    provide information on how the remaining heap might be fragmented). */
    taskDISABLE_INTERRUPTS();
    for (;;);
}

/*-----------------------------------------------------------*/

void vApplicationIdleHook(void) {
    /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
    to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
    task.  It is essential that code added to this hook function never attempts
    to block in any way (for example, call xQueueReceive() with a block time
    specified, or call vTaskDelay()).  If the application makes use of the
    vTaskDelete() API function (as this demo application does) then it is also
    important that vApplicationIdleHook() is permitted to return to its calling
    function, because it is the responsibility of the idle task to clean up
    memory allocated by the kernel to any task that has since been deleted. */
}

/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName) {
    (void) pcTaskName;
    (void) pxTask;

    /* Run time task stack overflow checking is performed if
    configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook	function is 
    called if a task stack overflow is detected.  Note the system/interrupt
    stack is not checked. */
    taskDISABLE_INTERRUPTS();
    for (;;);
}

/*-----------------------------------------------------------*/

void vApplicationTickHook(void) {
    /* This function will be called by each tick interrupt if
    configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
    added here, but the tick hook is called from an interrupt context, so
    code must not attempt to block, and only the interrupt safe FreeRTOS API
    functions can be used (those that end in FromISR()). */
}

/*-----------------------------------------------------------*/

/*-----------------------------------------------------------*/

void vAssertCalled(const char * pcFile, unsigned long ulLine) {
    volatile unsigned long ul = 0;

    (void) pcFile;
    (void) ulLine;

    __asm volatile( "di");
    {
        /* Set ul to a non-zero value using the debugger to step out of this
        function. */
        while (ul == 0) {
            portNOP();
        }
    }
    __asm volatile( "ei");
}

/**
 End of File
 */