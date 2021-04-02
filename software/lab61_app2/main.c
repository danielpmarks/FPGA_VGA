int main()
{

	typedef struct
	{
		unsigned int volatile data;
		unsigned int volatile direction;
		unsigned int volatile interrupt_mask;
		unsigned int volatile edge_capture;
		unsigned int volatile out_set;
		unsigned int volatile out_clear;
	}NIOS_PIO_t;

	//int i = 0;
	NIOS_PIO_t* LED_PIO = (NIOS_PIO_t*)0x70;
	NIOS_PIO_t* SW = (NIOS_PIO_t*)0x60;
	NIOS_PIO_t* acc = (NIOS_PIO_t*)0x50;


	LED_PIO->data = 0;
	//unsigned int volatile SW_value = SW->data;
	int acc_down = 0;
	unsigned int volatile acc_val = 0;
	while((1+1) != 3)
	{
		acc_val = acc->data;
		//SW_value = SW->data;
		if(acc_val == 0 && acc_down == 0){
			LED_PIO->data += SW->data;
			if(LED_PIO->data > 255){
				LED_PIO->data -= 266;
			}
			acc_down = 1;
		} else if (acc_val == 1 && acc_down == 1){
			acc_down = 0;
		}
		//*LED_PIO = *acc;
	}
	return 1;
}
