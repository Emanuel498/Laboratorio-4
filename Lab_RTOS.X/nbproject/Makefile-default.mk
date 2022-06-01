#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=freeRTOS/croutine.c freeRTOS/event_groups.c freeRTOS/list.c freeRTOS/queue.c freeRTOS/tasks.c freeRTOS/timers.c freeRTOS/portable/MemMang/heap_4.c freeRTOS/portable/MPLAB/PIC32MM/port.c freeRTOS/portable/MPLAB/PIC32MM/port_asm.S mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/exceptions.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/rtcc.c mcc_generated_files/tmr2.c main.c utils/rgb_manager.c utils/utils.c platform/WS2812.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/freeRTOS/croutine.o ${OBJECTDIR}/freeRTOS/event_groups.o ${OBJECTDIR}/freeRTOS/list.o ${OBJECTDIR}/freeRTOS/queue.o ${OBJECTDIR}/freeRTOS/tasks.o ${OBJECTDIR}/freeRTOS/timers.o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/main.o ${OBJECTDIR}/utils/rgb_manager.o ${OBJECTDIR}/utils/utils.o ${OBJECTDIR}/platform/WS2812.o
POSSIBLE_DEPFILES=${OBJECTDIR}/freeRTOS/croutine.o.d ${OBJECTDIR}/freeRTOS/event_groups.o.d ${OBJECTDIR}/freeRTOS/list.o.d ${OBJECTDIR}/freeRTOS/queue.o.d ${OBJECTDIR}/freeRTOS/tasks.o.d ${OBJECTDIR}/freeRTOS/timers.o.d ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/exceptions.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/rtcc.o.d ${OBJECTDIR}/mcc_generated_files/tmr2.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/utils/rgb_manager.o.d ${OBJECTDIR}/utils/utils.o.d ${OBJECTDIR}/platform/WS2812.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/freeRTOS/croutine.o ${OBJECTDIR}/freeRTOS/event_groups.o ${OBJECTDIR}/freeRTOS/list.o ${OBJECTDIR}/freeRTOS/queue.o ${OBJECTDIR}/freeRTOS/tasks.o ${OBJECTDIR}/freeRTOS/timers.o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/tmr2.o ${OBJECTDIR}/main.o ${OBJECTDIR}/utils/rgb_manager.o ${OBJECTDIR}/utils/utils.o ${OBJECTDIR}/platform/WS2812.o

# Source Files
SOURCEFILES=freeRTOS/croutine.c freeRTOS/event_groups.c freeRTOS/list.c freeRTOS/queue.c freeRTOS/tasks.c freeRTOS/timers.c freeRTOS/portable/MemMang/heap_4.c freeRTOS/portable/MPLAB/PIC32MM/port.c freeRTOS/portable/MPLAB/PIC32MM/port_asm.S mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/exceptions.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/rtcc.c mcc_generated_files/tmr2.c main.c utils/rgb_manager.c utils/utils.c platform/WS2812.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MM0256GPM064
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o: freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  .generated_files/flags/default/803e18ea3431d45e3c690e6b7633d5102d96eef4 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.ok ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d"  -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d" "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o: freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  .generated_files/flags/default/f7bae67c616729af8d55d93c2eba9d0489deae43 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.ok ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d"  -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d" "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/freeRTOS/croutine.o: freeRTOS/croutine.c  .generated_files/flags/default/ec0649f18a67d58de88c746dd1db596bd0ebd2c8 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/croutine.o.d" -o ${OBJECTDIR}/freeRTOS/croutine.o freeRTOS/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/event_groups.o: freeRTOS/event_groups.c  .generated_files/flags/default/e43a042fec0927d473129784bb49447a531c22c3 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/event_groups.o.d" -o ${OBJECTDIR}/freeRTOS/event_groups.o freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/list.o: freeRTOS/list.c  .generated_files/flags/default/b40f1500c9342548b43b1197debec6a99c010cd6 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/list.o.d" -o ${OBJECTDIR}/freeRTOS/list.o freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/queue.o: freeRTOS/queue.c  .generated_files/flags/default/4fe94c528c4e428ba1f9b75c319716292c44b433 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/queue.o.d" -o ${OBJECTDIR}/freeRTOS/queue.o freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/tasks.o: freeRTOS/tasks.c  .generated_files/flags/default/475d6bcc4fff091a5b99a1f4f7dec387f7330ce1 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/tasks.o.d" -o ${OBJECTDIR}/freeRTOS/tasks.o freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/timers.o: freeRTOS/timers.c  .generated_files/flags/default/1c2dbf1ed3895d7bc60a7770709730fefc53a3af .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/timers.o.d" -o ${OBJECTDIR}/freeRTOS/timers.o freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o: freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/a4cb9495a90bcc551e72714d0c26a0a386242881 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MemMang" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o: freeRTOS/portable/MPLAB/PIC32MM/port.c  .generated_files/flags/default/334315d38fd4bacdf7beb411693db87a5dbe8b45 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o freeRTOS/portable/MPLAB/PIC32MM/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/3e4d86ec30ffd9c90c40f2d8d05b9efe2451b052 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/d13c3337e8283e1f1ce0b9116caf7bfea1c0c0a9 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/5c449ae5d881a58a374943449cde5c17da8337ca .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/a9359ce93b74d5233830bb174e966193d4905a6a .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/2d0ee27a97a6860c098b693f95e92826fa11a947 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/3e9d73813a9854231ab6ffc10603df2432241f0b .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/5ea779c4e34602a0c5affef49748ececaf0c427a .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/9b89e50ae85b76584ea543c734014e49f69c56f0 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/2cc69ff11f1e3c5e96df28bbbcae4fe4b718786f .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/9ec63bcb7edea8bef3f19b6cc41eabfacfcabb2a .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/default/968f90dd68711731e6d6e4043c3c1d304ea3c78d .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/76ae2a8c906e7d42065e598dbc8b5c9b7f9bd681 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr2.o mcc_generated_files/tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/6012aac12cd3c19d117040ee4516b6c49d8575c6 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/utils/rgb_manager.o: utils/rgb_manager.c  .generated_files/flags/default/665602c0854841db334dbaf1e6f1b375264307e1 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/utils" 
	@${RM} ${OBJECTDIR}/utils/rgb_manager.o.d 
	@${RM} ${OBJECTDIR}/utils/rgb_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/utils/rgb_manager.o.d" -o ${OBJECTDIR}/utils/rgb_manager.o utils/rgb_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/utils/utils.o: utils/utils.c  .generated_files/flags/default/5e7cee124ca6032053cfa6e8b3d03b1383bd4403 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/utils" 
	@${RM} ${OBJECTDIR}/utils/utils.o.d 
	@${RM} ${OBJECTDIR}/utils/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/utils/utils.o.d" -o ${OBJECTDIR}/utils/utils.o utils/utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/WS2812.o: platform/WS2812.c  .generated_files/flags/default/629c0c102d0891f425489387982492af8fe4d28d .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/platform" 
	@${RM} ${OBJECTDIR}/platform/WS2812.o.d 
	@${RM} ${OBJECTDIR}/platform/WS2812.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/WS2812.o.d" -o ${OBJECTDIR}/platform/WS2812.o platform/WS2812.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/freeRTOS/croutine.o: freeRTOS/croutine.c  .generated_files/flags/default/e68225912dfdf7ce7319e6f5d9136c6f0b7930fd .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/croutine.o.d" -o ${OBJECTDIR}/freeRTOS/croutine.o freeRTOS/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/event_groups.o: freeRTOS/event_groups.c  .generated_files/flags/default/a46e52128a308077fa04ca5cd30fc27256453d6f .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/event_groups.o.d" -o ${OBJECTDIR}/freeRTOS/event_groups.o freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/list.o: freeRTOS/list.c  .generated_files/flags/default/b51e5f9e04b04d5ae1e2f890640792e0ef4045f8 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/list.o.d" -o ${OBJECTDIR}/freeRTOS/list.o freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/queue.o: freeRTOS/queue.c  .generated_files/flags/default/21c5caf15c2f0df03dca37a8618ae66386937441 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/queue.o.d" -o ${OBJECTDIR}/freeRTOS/queue.o freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/tasks.o: freeRTOS/tasks.c  .generated_files/flags/default/627ddf1948ebe707a7e3832b98c96693d7b67be7 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/tasks.o.d" -o ${OBJECTDIR}/freeRTOS/tasks.o freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/timers.o: freeRTOS/timers.c  .generated_files/flags/default/9298b96f10fceb7dd908ead0606a8fdd7ca177c5 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/timers.o.d" -o ${OBJECTDIR}/freeRTOS/timers.o freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o: freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/c00daabeb31eb24de1cbfce70435cdd0a8192a9e .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MemMang" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o: freeRTOS/portable/MPLAB/PIC32MM/port.c  .generated_files/flags/default/2c7ff3df9ce82d560d1bc98a4a78241855cc9f7a .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o freeRTOS/portable/MPLAB/PIC32MM/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/c43f24d98f3f488d020505d2f4834aebf06f66c4 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/c47b88fef337d23cd857efb70a8323881ce49a2 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/d942a1ac32b945990cdd65dbcef9e16bb805f21 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/2342962a1057f5e52beb0524399765829245456b .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/4c6b2f563e7b0522fc730f799050330a6b529875 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/625fb5c46dd1d7ad898505f426a25238e2d759dc .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/cf5f258bd798f2bfc64a3abaa35bb05a4667ed35 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/d39b7b7ea10846f5ddd2394135b04e6b70d95df3 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/8903ba8683efa70cd502b9d88525ba129619b1be .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/98a096ba360711857c4419789705d1bef31db5d6 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/default/86729551329553aa1b454bb1052f62aff3378f1a .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr2.o: mcc_generated_files/tmr2.c  .generated_files/flags/default/9992ae3f8bbead38810bdf24e639b0e581d0206b .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr2.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr2.o mcc_generated_files/tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/c91af39224a4ec9d8bf11ec33f73cd2c144e7e5f .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/utils/rgb_manager.o: utils/rgb_manager.c  .generated_files/flags/default/8a55a5fd7f87de6c00207369fb37a44b08f9fe61 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/utils" 
	@${RM} ${OBJECTDIR}/utils/rgb_manager.o.d 
	@${RM} ${OBJECTDIR}/utils/rgb_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/utils/rgb_manager.o.d" -o ${OBJECTDIR}/utils/rgb_manager.o utils/rgb_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/utils/utils.o: utils/utils.c  .generated_files/flags/default/f3ba3fc5567481e44bc71f6db9b7e45fd5c37ca3 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/utils" 
	@${RM} ${OBJECTDIR}/utils/utils.o.d 
	@${RM} ${OBJECTDIR}/utils/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/utils/utils.o.d" -o ${OBJECTDIR}/utils/utils.o utils/utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/WS2812.o: platform/WS2812.c  .generated_files/flags/default/a6d487f826131c0353481d47d193690ccf16ab16 .generated_files/flags/default/63f80d3e53f67d92df857c76536421b47c21c374
	@${MKDIR} "${OBJECTDIR}/platform" 
	@${RM} ${OBJECTDIR}/platform/WS2812.o.d 
	@${RM} ${OBJECTDIR}/platform/WS2812.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/WS2812.o.d" -o ${OBJECTDIR}/platform/WS2812.o platform/WS2812.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Lab_RTOS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
