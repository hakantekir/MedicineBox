
_getTime:

;Ilac.c,19 :: 		void getTime(){
;Ilac.c,20 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;Ilac.c,21 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,22 :: 		I2C1_Wr(0x00);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,23 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;Ilac.c,24 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,25 :: 		second = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _second+0
;Ilac.c,26 :: 		minute = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _minute+0
;Ilac.c,27 :: 		hour = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _hour+0
;Ilac.c,28 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;Ilac.c,31 :: 		Lcd_Chr(1,7,(hour/16)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _hour+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;Ilac.c,32 :: 		Lcd_Chr(1,8,(hour%16)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      15
	ANDWF      _hour+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;Ilac.c,33 :: 		Lcd_Chr(1,10,(minute/16)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _minute+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;Ilac.c,34 :: 		Lcd_Chr(1,11,(minute%16)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      15
	ANDWF      _minute+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;Ilac.c,35 :: 		Lcd_Chr(1,13,(second/16)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _second+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;Ilac.c,36 :: 		Lcd_Chr(1,14,(second%16)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      15
	ANDWF      _second+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;Ilac.c,37 :: 		}
L_end_getTime:
	RETURN
; end of _getTime

_interupt:

;Ilac.c,41 :: 		void interupt() {
;Ilac.c,42 :: 		if (TMR0IF_bit) {
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interupt0
;Ilac.c,43 :: 		getTime();
	CALL       _getTime+0
;Ilac.c,44 :: 		TMR0IF_bit = 0; // Clear Timer0 interrupt flag
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Ilac.c,45 :: 		TMR0 = 0x06; // Load Timer0 with 6
	MOVLW      6
	MOVWF      TMR0+0
;Ilac.c,46 :: 		count++;
	INCF       _count+0, 1
;Ilac.c,47 :: 		if (count == 100) {
	MOVF       _count+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_interupt1
;Ilac.c,48 :: 		count = 0;
	CLRF       _count+0
;Ilac.c,49 :: 		}
L_interupt1:
;Ilac.c,50 :: 		}
L_interupt0:
;Ilac.c,51 :: 		}
L_end_interupt:
	RETURN
; end of _interupt

_main:

;Ilac.c,53 :: 		void main() {
;Ilac.c,54 :: 		INTCON.GIE = 1; // Allow all interrupts
	BSF        INTCON+0, 7
;Ilac.c,55 :: 		INTCON.T0IE = 1; // Enable Timer0 interrupt
	BSF        INTCON+0, 5
;Ilac.c,56 :: 		OPTION_REG = 0x07; // Set Timer0 prescaler to 1:256
	MOVLW      7
	MOVWF      OPTION_REG+0
;Ilac.c,57 :: 		TMR0 = 0x06; // Load Timer0 with 6
	MOVLW      6
	MOVWF      TMR0+0
;Ilac.c,59 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;Ilac.c,60 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Ilac.c,61 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Ilac.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,64 :: 		Lcd_Out(1,1,time);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,65 :: 		while(1);
L_main2:
	GOTO       L_main2
;Ilac.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
