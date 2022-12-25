
_getTime:

;Ilac.c,25 :: 		void getTime(){
;Ilac.c,26 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;Ilac.c,27 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,28 :: 		I2C1_Wr(0x00);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,29 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;Ilac.c,30 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,31 :: 		second = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _second+0
;Ilac.c,32 :: 		minute = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _minute+0
;Ilac.c,33 :: 		hour = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _hour+0
;Ilac.c,34 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;Ilac.c,37 :: 		Lcd_Chr(1,7,(hour/16)+48);
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
;Ilac.c,38 :: 		Lcd_Chr(1,8,(hour%16)+48);
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
;Ilac.c,39 :: 		Lcd_Chr(1,10,(minute/16)+48);
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
;Ilac.c,40 :: 		Lcd_Chr(1,11,(minute%16)+48);
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
;Ilac.c,41 :: 		Lcd_Chr(1,13,(second/16)+48);
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
;Ilac.c,42 :: 		Lcd_Chr(1,14,(second%16)+48);
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
;Ilac.c,43 :: 		}
L_end_getTime:
	RETURN
; end of _getTime

_pageView:

;Ilac.c,45 :: 		void pageView(){
;Ilac.c,46 :: 		char string[] = "Alarm     :  ";
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
;Ilac.c,47 :: 		string[6] = page+49;
	MOVLW      49
	ADDWF      _page+0, 0
	MOVWF      pageView_string_L0+6
;Ilac.c,48 :: 		string[8] = (alarms[page].hour/10)+48;
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
;Ilac.c,49 :: 		string[9] = (alarms[page].hour%10)+48;
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
;Ilac.c,50 :: 		string[11] = (alarms[page].minute/10)+48;
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
;Ilac.c,51 :: 		string[12] = (alarms[page].minute%10)+48;
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
;Ilac.c,52 :: 		Lcd_Out(2,1,string);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      pageView_string_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,53 :: 		if (alarms[page].active == 1) {
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
	GOTO       L__pageView57
	MOVLW      1
	XORWF      R1+0, 0
L__pageView57:
	BTFSS      STATUS+0, 2
	GOTO       L_pageView0
;Ilac.c,54 :: 		Lcd_Out(3,1," Active ");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,55 :: 		} else {
	GOTO       L_pageView1
L_pageView0:
;Ilac.c,56 :: 		Lcd_Out(3,1,"Inactive");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,57 :: 		}
L_pageView1:
;Ilac.c,58 :: 		}
L_end_pageView:
	RETURN
; end of _pageView

_editAlarm:

;Ilac.c,60 :: 		void editAlarm(int num){
;Ilac.c,61 :: 		if (edit) {
	MOVF       _edit+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm2
;Ilac.c,62 :: 		switch (cursor) {
	GOTO       L_editAlarm3
;Ilac.c,63 :: 		case 0:
L_editAlarm5:
;Ilac.c,64 :: 		if (num > 2) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_editAlarm_num+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__editAlarm59
	MOVF       FARG_editAlarm_num+0, 0
	SUBLW      2
L__editAlarm59:
	BTFSC      STATUS+0, 0
	GOTO       L_editAlarm6
;Ilac.c,65 :: 		num = 0;
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
;Ilac.c,66 :: 		}
L_editAlarm6:
;Ilac.c,67 :: 		alarms[page].hour = num;
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
;Ilac.c,68 :: 		Lcd_Chr(2,9,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,69 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,70 :: 		case 1:
L_editAlarm7:
;Ilac.c,71 :: 		if (alarms[page].hour == 2 && num > 3) {
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
	GOTO       L__editAlarm60
	MOVF       FARG_editAlarm_num+0, 0
	SUBLW      3
L__editAlarm60:
	BTFSC      STATUS+0, 0
	GOTO       L_editAlarm10
L__editAlarm53:
;Ilac.c,72 :: 		num = 0;
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
;Ilac.c,73 :: 		}
L_editAlarm10:
;Ilac.c,74 :: 		alarms[page].hour = alarms[page].hour*10 + num;
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
;Ilac.c,75 :: 		Lcd_Chr(2,10,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,76 :: 		LCD_CMD(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,77 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,78 :: 		case 2:
L_editAlarm11:
;Ilac.c,79 :: 		if (num > 5) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_editAlarm_num+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__editAlarm61
	MOVF       FARG_editAlarm_num+0, 0
	SUBLW      5
L__editAlarm61:
	BTFSC      STATUS+0, 0
	GOTO       L_editAlarm12
;Ilac.c,80 :: 		num = 0;
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
;Ilac.c,81 :: 		}
L_editAlarm12:
;Ilac.c,82 :: 		alarms[page].minute = num;
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
;Ilac.c,83 :: 		Lcd_Chr(2,12,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,84 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,85 :: 		case 3:
L_editAlarm13:
;Ilac.c,86 :: 		alarms[page].minute = alarms[page].minute*10 + num;
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
;Ilac.c,87 :: 		Lcd_Chr(2,13,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,88 :: 		break;
	GOTO       L_editAlarm4
;Ilac.c,89 :: 		}
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
;Ilac.c,90 :: 		cursor++;
	INCF       _cursor+0, 1
;Ilac.c,91 :: 		if (cursor == 4) {
	MOVF       _cursor+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_editAlarm14
;Ilac.c,92 :: 		cursor = 0;
	CLRF       _cursor+0
;Ilac.c,93 :: 		edit = 0;
	CLRF       _edit+0
;Ilac.c,94 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,95 :: 		}
L_editAlarm14:
;Ilac.c,96 :: 		}
L_editAlarm2:
;Ilac.c,97 :: 		}
L_end_editAlarm:
	RETURN
; end of _editAlarm

_func:

;Ilac.c,99 :: 		void func(){
;Ilac.c,100 :: 		if (INTCON.TMR0IF) {
	BTFSS      INTCON+0, 2
	GOTO       L_func15
;Ilac.c,101 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;Ilac.c,102 :: 		TMR0 = 0;
	CLRF       TMR0+0
;Ilac.c,103 :: 		for(i = 0; i < 5; i++){
	CLRF       _i+0
L_func16:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_func17
;Ilac.c,104 :: 		if (alarms[i].active == 1) {
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
	GOTO       L__func63
	MOVLW      1
	XORWF      R1+0, 0
L__func63:
	BTFSS      STATUS+0, 2
	GOTO       L_func19
;Ilac.c,105 :: 		if (alarms[i].hour == hour && alarms[i].minute == minute) {
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
	GOTO       L_func22
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
	GOTO       L_func22
L__func54:
;Ilac.c,106 :: 		Lcd_Out(3,1,"Alarm");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,107 :: 		}
L_func22:
;Ilac.c,108 :: 		}
L_func19:
;Ilac.c,103 :: 		for(i = 0; i < 5; i++){
	INCF       _i+0, 1
;Ilac.c,109 :: 		}
	GOTO       L_func16
L_func17:
;Ilac.c,110 :: 		}
L_func15:
;Ilac.c,111 :: 		}
L_end_func:
	RETURN
; end of _func

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Ilac.c,114 :: 		void interrupt(){
;Ilac.c,115 :: 		func();
	CALL       _func+0
;Ilac.c,116 :: 		}
L_end_interrupt:
L__interrupt65:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Ilac.c,119 :: 		void main() {
;Ilac.c,120 :: 		key = 0;
	CLRF       _key+0
;Ilac.c,121 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;Ilac.c,122 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Ilac.c,123 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Ilac.c,124 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,125 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,126 :: 		Lcd_Out(1,1,"Time:   :  :  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,127 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,128 :: 		INTCON.GIE = 1; //enable global interrupt
	BSF        INTCON+0, 7
;Ilac.c,129 :: 		INTCON.T0IE = 1; //enable timer0 interrupt
	BSF        INTCON+0, 5
;Ilac.c,130 :: 		TMR0=0;
	CLRF       TMR0+0
;Ilac.c,131 :: 		OPTION_REG = 0x07; //prescaler 1:256 PS2 = 1; PS1 = 1; PS0 = 1;
	MOVLW      7
	MOVWF      OPTION_REG+0
;Ilac.c,132 :: 		while(1){
L_main23:
;Ilac.c,133 :: 		key = 0;
	CLRF       _key+0
;Ilac.c,134 :: 		do {
L_main25:
;Ilac.c,135 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _key+0
;Ilac.c,136 :: 		} while (!key);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main25
;Ilac.c,137 :: 		switch (key){
	GOTO       L_main28
;Ilac.c,155 :: 		case 1:
L_main30:
;Ilac.c,156 :: 		editAlarm(7);
	MOVLW      7
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,157 :: 		break;
	GOTO       L_main29
;Ilac.c,159 :: 		case 2:
L_main31:
;Ilac.c,160 :: 		editAlarm(4);
	MOVLW      4
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,161 :: 		break;
	GOTO       L_main29
;Ilac.c,163 :: 		case 3:
L_main32:
;Ilac.c,164 :: 		editAlarm(1);
	MOVLW      1
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,165 :: 		break;
	GOTO       L_main29
;Ilac.c,167 :: 		case 5:
L_main33:
;Ilac.c,168 :: 		editAlarm(8);
	MOVLW      8
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,169 :: 		break;
	GOTO       L_main29
;Ilac.c,170 :: 		case 6:
L_main34:
;Ilac.c,171 :: 		editAlarm(5);
	MOVLW      5
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,172 :: 		break;
	GOTO       L_main29
;Ilac.c,174 :: 		case 7:
L_main35:
;Ilac.c,175 :: 		editAlarm(2);
	MOVLW      2
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,176 :: 		break;
	GOTO       L_main29
;Ilac.c,178 :: 		case 8:
L_main36:
;Ilac.c,179 :: 		editAlarm(0);
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,180 :: 		break;
	GOTO       L_main29
;Ilac.c,182 :: 		case 9:
L_main37:
;Ilac.c,183 :: 		editAlarm(9);
	MOVLW      9
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,184 :: 		break;
	GOTO       L_main29
;Ilac.c,186 :: 		case 10:
L_main38:
;Ilac.c,187 :: 		editAlarm(6);
	MOVLW      6
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,188 :: 		break;
	GOTO       L_main29
;Ilac.c,190 :: 		case 11:
L_main39:
;Ilac.c,191 :: 		editAlarm(3);
	MOVLW      3
	MOVWF      FARG_editAlarm_num+0
	MOVLW      0
	MOVWF      FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,192 :: 		break;
	GOTO       L_main29
;Ilac.c,195 :: 		case 4:
L_main40:
;Ilac.c,196 :: 		if (!edit){
	MOVF       _edit+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;Ilac.c,197 :: 		if (alarms[page].active == 1) {
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
	GOTO       L__main67
	MOVLW      1
	XORWF      R1+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L_main42
;Ilac.c,198 :: 		alarms[page].active = 0;
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
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;Ilac.c,199 :: 		} else {
	GOTO       L_main43
L_main42:
;Ilac.c,200 :: 		alarms[page].active = 1;
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
	MOVLW      1
	MOVWF      INDF+0
	MOVLW      0
	INCF       FSR, 1
	MOVWF      INDF+0
;Ilac.c,201 :: 		}
L_main43:
;Ilac.c,202 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,203 :: 		}
L_main41:
;Ilac.c,204 :: 		break;
	GOTO       L_main29
;Ilac.c,208 :: 		case 13:
L_main44:
;Ilac.c,209 :: 		if (edit){
	MOVF       _edit+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main45
;Ilac.c,210 :: 		edit = 0;
	CLRF       _edit+0
;Ilac.c,211 :: 		cursor = 0;
	CLRF       _cursor+0
;Ilac.c,212 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,213 :: 		}
	GOTO       L_main46
L_main45:
;Ilac.c,215 :: 		edit = 1;
	MOVLW      1
	MOVWF      _edit+0
;Ilac.c,216 :: 		LCD_CMD(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,217 :: 		Lcd_Out(2,8," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,218 :: 		}
L_main46:
;Ilac.c,219 :: 		break;
	GOTO       L_main29
;Ilac.c,223 :: 		case 14:
L_main47:
;Ilac.c,224 :: 		alarm=0;
	CLRF       _alarm+0
;Ilac.c,225 :: 		break;
	GOTO       L_main29
;Ilac.c,228 :: 		case 15:
L_main48:
;Ilac.c,229 :: 		if (!edit){
	MOVF       _edit+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main49
;Ilac.c,230 :: 		page--;
	DECF       _page+0, 1
;Ilac.c,231 :: 		if (page == 255) {
	MOVF       _page+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main50
;Ilac.c,232 :: 		page = 4;
	MOVLW      4
	MOVWF      _page+0
;Ilac.c,233 :: 		}
L_main50:
;Ilac.c,234 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,235 :: 		}
L_main49:
;Ilac.c,236 :: 		break;
	GOTO       L_main29
;Ilac.c,238 :: 		case 16:
L_main51:
;Ilac.c,239 :: 		if (!edit){
	MOVF       _edit+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main52
;Ilac.c,240 :: 		page = (page + 1) % 5;
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
;Ilac.c,241 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,242 :: 		}
L_main52:
;Ilac.c,243 :: 		break;
	GOTO       L_main29
;Ilac.c,244 :: 		}
L_main28:
	MOVF       _key+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main30
	MOVF       _key+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main31
	MOVF       _key+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	MOVF       _key+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main33
	MOVF       _key+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main34
	MOVF       _key+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _key+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main36
	MOVF       _key+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _key+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       _key+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVF       _key+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main40
	MOVF       _key+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main44
	MOVF       _key+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main47
	MOVF       _key+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main48
	MOVF       _key+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main51
L_main29:
;Ilac.c,245 :: 		}
	GOTO       L_main23
;Ilac.c,246 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
