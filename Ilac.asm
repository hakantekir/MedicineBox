
_getTime:

;Ilac.c,31 :: 		void getTime(){
;Ilac.c,32 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;Ilac.c,33 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,34 :: 		I2C1_Wr(0x00);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,35 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;Ilac.c,36 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,37 :: 		second = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _second+0
;Ilac.c,38 :: 		minute = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _minute+0
;Ilac.c,39 :: 		hour = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _hour+0
;Ilac.c,40 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;Ilac.c,41 :: 		second = (second/16)*10 + (second%16);
	MOVF       _second+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      _second+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _second+0
;Ilac.c,42 :: 		minute = (minute/16)*10 + (minute%16);
	MOVF       _minute+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      _minute+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 0
	MOVWF      _minute+0
;Ilac.c,43 :: 		hour = (hour/16)*10 + (hour%16);
	MOVF       _hour+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      _hour+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _hour+0
;Ilac.c,44 :: 		Lcd_Chr(1,7,(hour/10)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,45 :: 		Lcd_Chr(1,8,(hour%10)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hour+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,46 :: 		Lcd_Chr(1,10,(minute/10)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minute+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,47 :: 		Lcd_Chr(1,11,(minute%10)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minute+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,48 :: 		Lcd_Chr(1,13,(second/10)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _second+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,49 :: 		Lcd_Chr(1,14,(second%10)+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _second+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,50 :: 		}
L_end_getTime:
	RETURN
; end of _getTime

_pageView:

;Ilac.c,52 :: 		void pageView(){
;Ilac.c,53 :: 		char string[] = "Alarm     :  ";
	MOVLW      65
	MOVWF      pageView_string_L0+0
	MOVLW      108
	MOVWF      pageView_string_L0+1
	MOVLW      97
	MOVWF      pageView_string_L0+2
	MOVLW      114
	MOVWF      pageView_string_L0+3
	MOVLW      109
	MOVWF      pageView_string_L0+4
	MOVLW      32
	MOVWF      pageView_string_L0+5
	MOVLW      32
	MOVWF      pageView_string_L0+6
	MOVLW      32
	MOVWF      pageView_string_L0+7
	MOVLW      32
	MOVWF      pageView_string_L0+8
	MOVLW      32
	MOVWF      pageView_string_L0+9
	MOVLW      58
	MOVWF      pageView_string_L0+10
	MOVLW      32
	MOVWF      pageView_string_L0+11
	MOVLW      32
	MOVWF      pageView_string_L0+12
	CLRF       pageView_string_L0+13
;Ilac.c,54 :: 		string[6] = page+49;
	MOVLW      49
	ADDWF      _page+0, 0
	MOVWF      pageView_string_L0+6
;Ilac.c,55 :: 		string[8] = (alarms[page].hour/10)+48;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FLOC__pageView+1
	INCF       FLOC__pageView+1, 0
	MOVWF      FLOC__pageView+0
	MOVF       FLOC__pageView+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      pageView_string_L0+8
;Ilac.c,56 :: 		string[9] = (alarms[page].hour%10)+48;
	MOVF       FLOC__pageView+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      pageView_string_L0+9
;Ilac.c,57 :: 		string[11] = (alarms[page].minute/10)+48;
	MOVF       FLOC__pageView+1, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      pageView_string_L0+11
;Ilac.c,58 :: 		string[12] = (alarms[page].minute%10)+48;
	MOVF       FLOC__pageView+1, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      pageView_string_L0+12
;Ilac.c,59 :: 		Lcd_Out(2,1,string);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      pageView_string_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,60 :: 		if (alarms[page].active == 1) {
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pageView60
	MOVLW      1
	XORWF      R1+0, 0
L__pageView60:
	BTFSS      STATUS+0, 2
	GOTO       L_pageView0
;Ilac.c,61 :: 		Lcd_Out(3,1," Active ");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,62 :: 		} else {
	GOTO       L_pageView1
L_pageView0:
;Ilac.c,63 :: 		Lcd_Out(3,1,"Inactive");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,64 :: 		}
L_pageView1:
;Ilac.c,65 :: 		}
L_end_pageView:
	RETURN
; end of _pageView

_editAlarm:

;Ilac.c,67 :: 		void editAlarm(int num){
;Ilac.c,68 :: 		if (edit) {
	MOVF       _edit+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm2
;Ilac.c,69 :: 		switch (cursor) {
	GOTO       L_editAlarm3
;Ilac.c,70 :: 		case 0:
L_editAlarm5:
;Ilac.c,71 :: 		if (num > 2) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_editAlarm_num+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__editAlarm62
	MOVF       FARG_editAlarm_num+0, 0
	SUBLW      2
L__editAlarm62:
	BTFSC      STATUS+0, 0
	GOTO       L_editAlarm6
;Ilac.c,72 :: 		num = 0;
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
;Ilac.c,73 :: 		}
L_editAlarm6:
;Ilac.c,74 :: 		alarms[page].hour = num;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       FARG_editAlarm_num+0, 0
	MOVWF      INDF+0
;Ilac.c,75 :: 		Lcd_Chr(2,9,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,76 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,77 :: 		case 1:
L_editAlarm7:
;Ilac.c,78 :: 		if (alarms[page].hour == 2 && num > 3) {
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_editAlarm10
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_editAlarm_num+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__editAlarm63
	MOVF       FARG_editAlarm_num+0, 0
	SUBLW      3
L__editAlarm63:
	BTFSC      STATUS+0, 0
	GOTO       L_editAlarm10
L__editAlarm56:
;Ilac.c,79 :: 		num = 0;
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
;Ilac.c,80 :: 		}
L_editAlarm10:
;Ilac.c,81 :: 		alarms[page].hour = alarms[page].hour*10 + num;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FLOC__editAlarm+0
	MOVF       FLOC__editAlarm+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       FARG_editAlarm_num+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__editAlarm+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Ilac.c,82 :: 		Lcd_Chr(2,10,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,83 :: 		LCD_CMD(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,84 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,85 :: 		case 2:
L_editAlarm11:
;Ilac.c,86 :: 		if (num > 5) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_editAlarm_num+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__editAlarm64
	MOVF       FARG_editAlarm_num+0, 0
	SUBLW      5
L__editAlarm64:
	BTFSC      STATUS+0, 0
	GOTO       L_editAlarm12
;Ilac.c,87 :: 		num = 0;
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
;Ilac.c,88 :: 		}
L_editAlarm12:
;Ilac.c,89 :: 		alarms[page].minute = num;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FSR
	MOVF       FARG_editAlarm_num+0, 0
	MOVWF      INDF+0
;Ilac.c,90 :: 		Lcd_Chr(2,12,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,91 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,92 :: 		case 3:
L_editAlarm13:
;Ilac.c,93 :: 		alarms[page].minute = alarms[page].minute*10 + num;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FLOC__editAlarm+0
	MOVF       FLOC__editAlarm+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       FARG_editAlarm_num+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__editAlarm+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Ilac.c,94 :: 		Lcd_Chr(2,13,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,95 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,96 :: 		}
L_editAlarm3:
	MOVF       _cursor+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm5
	MOVF       _cursor+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm7
	MOVF       _cursor+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm11
	MOVF       _cursor+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm13
L_editAlarm4:
;Ilac.c,97 :: 		cursor++;
	INCF       _cursor+0, 1
;Ilac.c,98 :: 		if (cursor == 4) {
	MOVF       _cursor+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_editAlarm14
;Ilac.c,99 :: 		cursor = 0;
	CLRF       _cursor+0
;Ilac.c,100 :: 		edit = 0;
	CLRF       _edit+0
;Ilac.c,101 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,102 :: 		}
L_editAlarm14:
;Ilac.c,103 :: 		}
L_editAlarm2:
;Ilac.c,104 :: 		}
L_end_editAlarm:
	RETURN
; end of _editAlarm

_alarm:

;Ilac.c,106 :: 		void alarm(int pageNum){
;Ilac.c,107 :: 		switch (pageNum) {
	GOTO       L_alarm15
;Ilac.c,108 :: 		case 0:
L_alarm17:
;Ilac.c,109 :: 		led0 = 1;
	BSF        PORTC+0, 0
;Ilac.c,110 :: 		break;
	GOTO       L_alarm16
;Ilac.c,111 :: 		case 1:
L_alarm18:
;Ilac.c,112 :: 		led1 = 1;
	BSF        PORTC+0, 1
;Ilac.c,113 :: 		break;
	GOTO       L_alarm16
;Ilac.c,114 :: 		case 2:
L_alarm19:
;Ilac.c,115 :: 		led2 = 1;
	BSF        PORTC+0, 5
;Ilac.c,116 :: 		break;
	GOTO       L_alarm16
;Ilac.c,117 :: 		case 3:
L_alarm20:
;Ilac.c,118 :: 		led3 = 1;
	BSF        PORTC+0, 6
;Ilac.c,119 :: 		break;
	GOTO       L_alarm16
;Ilac.c,120 :: 		case 4:
L_alarm21:
;Ilac.c,121 :: 		led4 = 1;
	BSF        PORTC+0, 7
;Ilac.c,122 :: 		break;
	GOTO       L_alarm16
;Ilac.c,123 :: 		}
L_alarm15:
	MOVLW      0
	XORWF      FARG_alarm_pageNum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alarm66
	MOVLW      0
	XORWF      FARG_alarm_pageNum+0, 0
L__alarm66:
	BTFSC      STATUS+0, 2
	GOTO       L_alarm17
	MOVLW      0
	XORWF      FARG_alarm_pageNum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alarm67
	MOVLW      1
	XORWF      FARG_alarm_pageNum+0, 0
L__alarm67:
	BTFSC      STATUS+0, 2
	GOTO       L_alarm18
	MOVLW      0
	XORWF      FARG_alarm_pageNum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alarm68
	MOVLW      2
	XORWF      FARG_alarm_pageNum+0, 0
L__alarm68:
	BTFSC      STATUS+0, 2
	GOTO       L_alarm19
	MOVLW      0
	XORWF      FARG_alarm_pageNum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alarm69
	MOVLW      3
	XORWF      FARG_alarm_pageNum+0, 0
L__alarm69:
	BTFSC      STATUS+0, 2
	GOTO       L_alarm20
	MOVLW      0
	XORWF      FARG_alarm_pageNum+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__alarm70
	MOVLW      4
	XORWF      FARG_alarm_pageNum+0, 0
L__alarm70:
	BTFSC      STATUS+0, 2
	GOTO       L_alarm21
L_alarm16:
;Ilac.c,124 :: 		PWm1_Start();
	CALL       _PWM1_Start+0
;Ilac.c,125 :: 		}
L_end_alarm:
	RETURN
; end of _alarm

_setup:

;Ilac.c,127 :: 		void setup(){
;Ilac.c,128 :: 		TRISC.B0 = 0;
	BCF        TRISC+0, 0
;Ilac.c,129 :: 		TRISC.B1 = 0;
	BCF        TRISC+0, 1
;Ilac.c,130 :: 		TRISC.B2 = 0;
	BCF        TRISC+0, 2
;Ilac.c,131 :: 		TRISC.B5 = 0;
	BCF        TRISC+0, 5
;Ilac.c,132 :: 		TRISC.B6 = 0;
	BCF        TRISC+0, 6
;Ilac.c,133 :: 		TRISC.B7 = 0;
	BCF        TRISC+0, 7
;Ilac.c,134 :: 		led0 = 0;
	BCF        PORTC+0, 0
;Ilac.c,135 :: 		key = 0;
	CLRF       _key+0
;Ilac.c,136 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Ilac.c,137 :: 		PWM1_Set_Duty(1000);
	MOVLW      232
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Ilac.c,138 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;Ilac.c,139 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Ilac.c,140 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Ilac.c,141 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,142 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,143 :: 		Lcd_Out(1,1,"Time:   :  :  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,144 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,145 :: 		for (i = 0; i < 5; i++) {
	CLRF       _i+0
L_setup22:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_setup23
;Ilac.c,146 :: 		alarms[i].minute = 0;
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FSR
	CLRF       INDF+0
;Ilac.c,147 :: 		alarms[i].hour = 0;
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;Ilac.c,148 :: 		alarms[i].active = 0;
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;Ilac.c,145 :: 		for (i = 0; i < 5; i++) {
	INCF       _i+0, 1
;Ilac.c,149 :: 		}
	GOTO       L_setup22
L_setup23:
;Ilac.c,150 :: 		led0 = 0;
	BCF        PORTC+0, 0
;Ilac.c,151 :: 		led1 = 0;
	BCF        PORTC+0, 1
;Ilac.c,152 :: 		led2 = 0;
	BCF        PORTC+0, 5
;Ilac.c,153 :: 		led3 = 0;
	BCF        PORTC+0, 6
;Ilac.c,154 :: 		led4 = 0;
	BCF        PORTC+0, 7
;Ilac.c,155 :: 		PORTC.B2 = 0;
	BCF        PORTC+0, 2
;Ilac.c,156 :: 		}
L_end_setup:
	RETURN
; end of _setup

_main:

;Ilac.c,158 :: 		void main() {
;Ilac.c,159 :: 		setup();
	CALL       _setup+0
;Ilac.c,160 :: 		while(1){
L_main25:
;Ilac.c,161 :: 		getTime();
	CALL       _getTime+0
;Ilac.c,162 :: 		for(i = 0; i < 5; i++){
	CLRF       _i+0
L_main27:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;Ilac.c,163 :: 		if (alarms[i].active == 1 && alarms[i].hour == hour && alarms[i].minute == minute) {
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      1
	XORWF      R1+0, 0
L__main73:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      _hour+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main32
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _minute+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main32
L__main57:
;Ilac.c,164 :: 		alarm(i);
	MOVF       _i+0, 0
	MOVWF      FARG_alarm_pageNum+0
	CLRF       FARG_alarm_pageNum+1
	CALL       _alarm+0
;Ilac.c,165 :: 		}
L_main32:
;Ilac.c,162 :: 		for(i = 0; i < 5; i++){
	INCF       _i+0, 1
;Ilac.c,166 :: 		}
	GOTO       L_main27
L_main28:
;Ilac.c,167 :: 		key = 0;
	CLRF       _key+0
;Ilac.c,168 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _key+0
;Ilac.c,169 :: 		switch (key){
	GOTO       L_main33
;Ilac.c,187 :: 		case 1:
L_main35:
;Ilac.c,188 :: 		editAlarm(7);
	MOVLW      7
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,189 :: 		break;
	GOTO       L_main34
;Ilac.c,191 :: 		case 2:
L_main36:
;Ilac.c,192 :: 		editAlarm(4);
	MOVLW      4
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,193 :: 		break;
	GOTO       L_main34
;Ilac.c,195 :: 		case 3:
L_main37:
;Ilac.c,196 :: 		editAlarm(1);
	MOVLW      1
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,197 :: 		break;
	GOTO       L_main34
;Ilac.c,199 :: 		case 5:
L_main38:
;Ilac.c,200 :: 		editAlarm(8);
	MOVLW      8
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,201 :: 		break;
	GOTO       L_main34
;Ilac.c,202 :: 		case 6:
L_main39:
;Ilac.c,203 :: 		editAlarm(5);
	MOVLW      5
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,204 :: 		break;
	GOTO       L_main34
;Ilac.c,206 :: 		case 7:
L_main40:
;Ilac.c,207 :: 		editAlarm(2);
	MOVLW      2
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,208 :: 		break;
	GOTO       L_main34
;Ilac.c,210 :: 		case 8:
L_main41:
;Ilac.c,211 :: 		editAlarm(0);
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,212 :: 		break;
	GOTO       L_main34
;Ilac.c,214 :: 		case 9:
L_main42:
;Ilac.c,215 :: 		editAlarm(9);
	MOVLW      9
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,216 :: 		break;
	GOTO       L_main34
;Ilac.c,218 :: 		case 10:
L_main43:
;Ilac.c,219 :: 		editAlarm(6);
	MOVLW      6
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,220 :: 		break;
	GOTO       L_main34
;Ilac.c,222 :: 		case 11:
L_main44:
;Ilac.c,223 :: 		editAlarm(3);
	MOVLW      3
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,224 :: 		break;
	GOTO       L_main34
;Ilac.c,227 :: 		case 4:
L_main45:
;Ilac.c,228 :: 		if (!edit){
	MOVF       _edit+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main46
;Ilac.c,229 :: 		alarms[page].active = !alarms[page].active;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	INCF       FSR, 1
	IORWF      INDF+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;Ilac.c,230 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,231 :: 		}
L_main46:
;Ilac.c,232 :: 		break;
	GOTO       L_main34
;Ilac.c,236 :: 		case 13:
L_main47:
;Ilac.c,237 :: 		if (edit){
	MOVF       _edit+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main48
;Ilac.c,238 :: 		edit = 0;
	CLRF       _edit+0
;Ilac.c,239 :: 		cursor = 0;
	CLRF       _cursor+0
;Ilac.c,240 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,241 :: 		}
	GOTO       L_main49
L_main48:
;Ilac.c,243 :: 		edit = 1;
	MOVLW      1
	MOVWF      _edit+0
;Ilac.c,244 :: 		LCD_CMD(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,245 :: 		Lcd_Out(2,8," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,246 :: 		}
L_main49:
;Ilac.c,247 :: 		break;
	GOTO       L_main34
;Ilac.c,251 :: 		case 14:
L_main50:
;Ilac.c,252 :: 		led0 = 0;
	BCF        PORTC+0, 0
;Ilac.c,253 :: 		led1 = 0;
	BCF        PORTC+0, 1
;Ilac.c,254 :: 		led2 = 0;
	BCF        PORTC+0, 5
;Ilac.c,255 :: 		led3 = 0;
	BCF        PORTC+0, 6
;Ilac.c,256 :: 		led4 = 0;
	BCF        PORTC+0, 7
;Ilac.c,257 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;Ilac.c,258 :: 		break;
	GOTO       L_main34
;Ilac.c,261 :: 		case 15:
L_main51:
;Ilac.c,262 :: 		if (!edit){
	MOVF       _edit+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main52
;Ilac.c,263 :: 		page--;
	DECF       _page+0, 1
;Ilac.c,264 :: 		if (page == 255) {
	MOVF       _page+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main53
;Ilac.c,265 :: 		page = 4;
	MOVLW      4
	MOVWF      _page+0
;Ilac.c,266 :: 		}
L_main53:
;Ilac.c,267 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,268 :: 		}
L_main52:
;Ilac.c,269 :: 		break;
	GOTO       L_main34
;Ilac.c,271 :: 		case 16:
L_main54:
;Ilac.c,272 :: 		if (!edit){
	MOVF       _edit+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main55
;Ilac.c,273 :: 		page = (page + 1) % 5;
	MOVF       _page+0, 0
	ADDLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _page+0
;Ilac.c,274 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,275 :: 		}
L_main55:
;Ilac.c,276 :: 		break;
	GOTO       L_main34
;Ilac.c,277 :: 		}
L_main33:
	MOVF       _key+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _key+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main36
	MOVF       _key+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _key+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       _key+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVF       _key+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main40
	MOVF       _key+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main41
	MOVF       _key+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main42
	MOVF       _key+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main43
	MOVF       _key+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main44
	MOVF       _key+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main45
	MOVF       _key+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main47
	MOVF       _key+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main50
	MOVF       _key+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main51
	MOVF       _key+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main54
L_main34:
;Ilac.c,278 :: 		}
	GOTO       L_main25
;Ilac.c,279 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
