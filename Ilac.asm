
_getTime:

;Ilac.c,21 :: 		void getTime(){
;Ilac.c,23 :: 		second = (second >> 4) * 10 + (second & 0x0F);
	MOVF       _second+0, 0
	MOVWF      R0+0
	MOVF       _second+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      _second+0, 0
	MOVWF      R2+0
	MOVF       _second+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      FLOC__getTime+10
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      FLOC__getTime+11
	MOVF       FLOC__getTime+10, 0
	MOVWF      _second+0
	MOVF       FLOC__getTime+11, 0
	MOVWF      _second+1
;Ilac.c,24 :: 		minute = (minute >> 4) * 10 + (minute & 0x0F);
	MOVF       _minute+0, 0
	MOVWF      R0+0
	MOVF       _minute+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      _minute+0, 0
	MOVWF      R2+0
	MOVF       _minute+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      FLOC__getTime+8
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      FLOC__getTime+9
	MOVF       FLOC__getTime+8, 0
	MOVWF      _minute+0
	MOVF       FLOC__getTime+9, 0
	MOVWF      _minute+1
;Ilac.c,25 :: 		hour = (hour >> 4) * 10 + (hour & 0x0F);
	MOVF       _hour+0, 0
	MOVWF      R0+0
	MOVF       _hour+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      _hour+0, 0
	MOVWF      R2+0
	MOVF       _hour+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      FLOC__getTime+6
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      FLOC__getTime+7
	MOVF       FLOC__getTime+6, 0
	MOVWF      _hour+0
	MOVF       FLOC__getTime+7, 0
	MOVWF      _hour+1
;Ilac.c,26 :: 		date = (date >> 4) * 10 + (date & 0x0F);
	MOVF       _date+0, 0
	MOVWF      R0+0
	MOVF       _date+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      _date+0, 0
	MOVWF      R2+0
	MOVF       _date+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      FLOC__getTime+4
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      FLOC__getTime+5
	MOVF       FLOC__getTime+4, 0
	MOVWF      _date+0
	MOVF       FLOC__getTime+5, 0
	MOVWF      _date+1
;Ilac.c,27 :: 		month = (month >> 4) * 10 + (month & 0x0F);
	MOVF       _month+0, 0
	MOVWF      R0+0
	MOVF       _month+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      _month+0, 0
	MOVWF      R2+0
	MOVF       _month+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      FLOC__getTime+2
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      FLOC__getTime+3
	MOVF       FLOC__getTime+2, 0
	MOVWF      _month+0
	MOVF       FLOC__getTime+3, 0
	MOVWF      _month+1
;Ilac.c,28 :: 		year = (year >> 4) * 10 + (year & 0x0F);
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      _year+0, 0
	MOVWF      R2+0
	MOVF       _year+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      FLOC__getTime+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      FLOC__getTime+1
	MOVF       FLOC__getTime+0, 0
	MOVWF      _year+0
	MOVF       FLOC__getTime+1, 0
	MOVWF      _year+1
;Ilac.c,30 :: 		time[12]     = second % 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+10, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+11, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+12
;Ilac.c,31 :: 		time[11]     = second / 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+10, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+11, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+11
;Ilac.c,32 :: 		time[9]      = minute % 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+8, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+9, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+9
;Ilac.c,33 :: 		time[8]      = minute / 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+8, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+9, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+8
;Ilac.c,34 :: 		time[6]      = hour % 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+6, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+7, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+6
;Ilac.c,35 :: 		time[5]      = hour / 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+6, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+7, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+5
;Ilac.c,36 :: 		calendar[14] = year % 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+0, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _calendar+14
;Ilac.c,37 :: 		calendar[13] = year / 10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+0, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _calendar+13
;Ilac.c,38 :: 		calendar[9]  = month % 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+2, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+3, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _calendar+9
;Ilac.c,39 :: 		calendar[8]  = month / 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+2, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+3, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _calendar+8
;Ilac.c,40 :: 		calendar[6]  = date % 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+4, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+5, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _calendar+6
;Ilac.c,41 :: 		calendar[5]  = date / 10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__getTime+4, 0
	MOVWF      R0+0
	MOVF       FLOC__getTime+5, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _calendar+5
;Ilac.c,42 :: 		}
L_end_getTime:
	RETURN
; end of _getTime

_writePageNumber:

;Ilac.c,44 :: 		void writePageNumber(int num){
;Ilac.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,47 :: 		Lcd_Out(1,4,"Kutu: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,48 :: 		IntToStr(num, numCh);
	MOVF       FARG_writePageNumber_num+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       FARG_writePageNumber_num+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      writePageNumber_numCh_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Ilac.c,49 :: 		Lcd_Out_CP(numCh);
	MOVLW      writePageNumber_numCh_L0+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;Ilac.c,50 :: 		}
L_end_writePageNumber:
	RETURN
; end of _writePageNumber

_main:

;Ilac.c,52 :: 		void main() {
;Ilac.c,53 :: 		key=0;
	CLRF       _key+0
;Ilac.c,54 :: 		Keypad_Init(); // Keypad'i tanit
	CALL       _Keypad_Init+0
;Ilac.c,55 :: 		Lcd_Init(); // LCD'yi tanit
	CALL       _Lcd_Init+0
;Ilac.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,57 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,58 :: 		getTime();
	CALL       _getTime+0
;Ilac.c,61 :: 		while(1){
L_main0:
;Ilac.c,62 :: 		while(!key) key = Keypad_Key_Press();
L_main2:
	MOVF       _key+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	CALL       _Keypad_Key_Press+0
	MOVF       R0+0, 0
	MOVWF      _key+0
	GOTO       L_main2
L_main3:
;Ilac.c,63 :: 		}
	GOTO       L_main0
;Ilac.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
