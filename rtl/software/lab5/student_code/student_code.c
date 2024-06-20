/*
 * student_code.c
 *
 *  Created on: Mar 7, 2017
 *      Author: user
 */

#include <system.h>
#include <io.h>
#include "sys/alt_irq.h"
#include "student_code.h"
#include "altera_avalon_pio_regs.h"

int lfsr_value; 				// value read from the LFSR
const int inc_1Hz	= 86;		// increment needed for 1Hz
const int inc_5Hz	= 430;		// increment needed for 5Hz

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void handle_lfsr_interrupts(void* context)
#else
void handle_lfsr_interrupts(void* context, alt_u32 id)
#endif
{
	#ifdef LFSR_VAL_BASE
	#ifdef LFSR_CLK_INTERRUPT_GEN_BASE
	#ifdef DDS_INCREMENT_BASE
		// My CODE COMES HERE
		lfsr_value = IORD_ALTERA_AVALON_PIO_DATA(LFSR_VAL_BASE);

		// bitwise operation to extract the first bit of the lfsr data
		if ((lfsr_value & 1)) {		// if on 5Hz
			IOWR_ALTERA_AVALON_PIO_DATA(DDS_INCREMENT_BASE, inc_5Hz);
		}
		else {					// if off 1Hz
			IOWR_ALTERA_AVALON_PIO_DATA(DDS_INCREMENT_BASE, inc_1Hz);
		}

		IOWR_ALTERA_AVALON_PIO_EDGE_CAP(LFSR_CLK_INTERRUPT_GEN_BASE, 0); 	// Restart the edge detector so new interrupts can be captured

		/* Read the PIO to delay ISR exit. This is done to prevent a
		spurious interrupt in systems with high processor -> pio
		latency and fast interrupts. */
		IORD_ALTERA_AVALON_PIO_EDGE_CAP(LFSR_CLK_INTERRUPT_GEN_BASE);
	#endif
	#endif
	#endif
}

/* Initialize the button_pio. */

void init_lfsr_interrupt()
{
	#ifdef LFSR_VAL_BASE
	#ifdef LFSR_CLK_INTERRUPT_GEN_BASE
	#ifdef DDS_INCREMENT_BASE
	
	/* Enable interrupts */
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(LFSR_CLK_INTERRUPT_GEN_BASE, 0x1);
	/* Reset the edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(LFSR_CLK_INTERRUPT_GEN_BASE, 0x0);
	/* Register the interrupt handler. */
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
	alt_ic_isr_register(LFSR_CLK_INTERRUPT_GEN_IRQ_INTERRUPT_CONTROLLER_ID, LFSR_CLK_INTERRUPT_GEN_IRQ, handle_lfsr_interrupts, 0x0, 0x0);
#else
	alt_irq_register( LFSR_CLK_INTERRUPT_GEN_IRQ, NULL,	handle_button_interrupts);
#endif
	
	#endif
	#endif
	#endif
}

