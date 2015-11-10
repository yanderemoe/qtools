@
@  Патч команды 11 для загрузчиков, работающих в режиме Thumb-2
@
.syntax unified 
.code 16           @  Thumb-2 

<<<<<<< HEAD
pkt_data_len_off=8
		.ORG		0xF80057E8
leavecmd:

		.ORG		0xF80057F4
=======
pkt_data_len_off=10
		.ORG		0x02A00F20
leavecmd:

		.ORG		0x02A00F2C
>>>>>>> 3bc33e9b4ade6366d542615c7471e8d3db6a0c56
cmd_11_exec:
		PUSH		{R4,LR}
		LDR		R1, cmd_reply_code_ptr 	     @ Адрес ответнго буфера
		ADD		R0, R0,	#8	             @ R0 теперь показывает на байт +4 от начала
							     @ командного буфера
		MCR 		p15, 0, R1,c7,c5,0           @ сброс I-кеша
		BLX		R0               	     @ передаем туда управление
		LDR		R0, cmd_processor_data_ptr   @  Структура данных командного обработчика
		STRH		R4, [R0,#pkt_data_len_off]   @ сохраняем размер ответного буфера
		B		leavecmd

<<<<<<< HEAD
		.ORG  0xF8005960
=======
		.ORG  0x02A01098
>>>>>>> 3bc33e9b4ade6366d542615c7471e8d3db6a0c56
		
cmd_processor_data_ptr:  .word  0
cmd_reply_code_ptr:      .word  0
