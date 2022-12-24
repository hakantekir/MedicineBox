
_setAlarms:

;Ilac.c,29 :: 		void setAlarms(){
;Ilac.c,31 :: 		for(i = 0; i < 5; i++) {
	CLRF       R3+0
	CLRF       R3+1
L_setAlarms0:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setAlarms49
	MOVLW      5
	SUBWF      R3+0, 0
L__setAlarms49:
	BTFSC      STATUS+0, 0
	GOTO       L_setAlarms1
;Ilac.c,32 :: 		alarms[i].minute = i;
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FSR
	MOVF       R3+0, 0
	MOVWF      INDF+0
;Ilac.c,33 :: 		alarms[i].hour = 0;
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;Ilac.c,34 :: 		alarms[i].active = 1;
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
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
;Ilac.c,31 :: 		for(i = 0; i < 5; i++) {
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;Ilac.c,35 :: 		}
	GOTO       L_setAlarms0
L_setAlarms1:
;Ilac.c,36 :: 		}
L_end_setAlarms:
	RETURN
; end of _setAlarms

_getTime:

;Ilac.c,38 :: 		void getTime(){
;Ilac.c,39 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;Ilac.c,40 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,41 :: 		I2C1_Wr(0x00);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,42 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;Ilac.c,43 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;Ilac.c,44 :: 		second = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _second+0
;Ilac.c,45 :: 		minute = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _minute+0
;Ilac.c,46 :: 		hour = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _hour+0
;Ilac.c,47 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;Ilac.c,50 :: 		Lcd_Chr(1,7,(hour/16)+48);
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
;Ilac.c,51 :: 		Lcd_Chr(1,8,(hour%16)+48);
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
;Ilac.c,52 :: 		Lcd_Chr(1,10,(minute/16)+48);
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
;Ilac.c,53 :: 		Lcd_Chr(1,11,(minute%16)+48);
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
;Ilac.c,54 :: 		Lcd_Chr(1,13,(second/16)+48);
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
;Ilac.c,55 :: 		Lcd_Chr(1,14,(second%16)+48);
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
;Ilac.c,56 :: 		}
L_end_getTime:
	RETURN
; end of _getTime

_pageView:

;Ilac.c,60 :: 		void pageView(){
;Ilac.c,61 :: 		char string[] = "Alarm     :  ";
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
;Ilac.c,62 :: 		string[6] = page+49;
	MOVLW      49
	ADDWF      _page+0, 0
	MOVWF      pageView_string_L0+6
;Ilac.c,63 :: 		string[8] = (alarms[page].hour/16)+48;
	MOVF       _page+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      R3+0
	INCF       R3+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      pageView_string_L0+8
	RRF        pageView_string_L0+8, 1
	BCF        pageView_string_L0+8, 7
	RRF        pageView_string_L0+8, 1
	BCF        pageView_string_L0+8, 7
	RRF        pageView_string_L0+8, 1
	BCF        pageView_string_L0+8, 7
	RRF        pageView_string_L0+8, 1
	BCF        pageView_string_L0+8, 7
	MOVLW      48
	ADDWF      pageView_string_L0+8, 1
;Ilac.c,64 :: 		string[9] = (alarms[page].hour%16)+48;
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVLW      15
	ANDWF      INDF+0, 0
	MOVWF      pageView_string_L0+9
	MOVLW      48
	ADDWF      pageView_string_L0+9, 1
;Ilac.c,65 :: 		string[11] = (alarms[page].minute/16)+48;
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      pageView_string_L0+11
	RRF        pageView_string_L0+11, 1
	BCF        pageView_string_L0+11, 7
	RRF        pageView_string_L0+11, 1
	BCF        pageView_string_L0+11, 7
	RRF        pageView_string_L0+11, 1
	BCF        pageView_string_L0+11, 7
	RRF        pageView_string_L0+11, 1
	BCF        pageView_string_L0+11, 7
	MOVLW      48
	ADDWF      pageView_string_L0+11, 1
;Ilac.c,66 :: 		string[12] = (alarms[page].minute%16)+48;
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      pageView_string_L0+12
	MOVLW      48
	ADDWF      pageView_string_L0+12, 1
;Ilac.c,67 :: 		Lcd_Out(2,1,string);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      pageView_string_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,68 :: 		if (alarms[page].active == 1) {
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
	GOTO       L__pageView52
	MOVLW      1
	XORWF      R1+0, 0
L__pageView52:
	BTFSS      STATUS+0, 2
	GOTO       L_pageView3
;Ilac.c,69 :: 		Lcd_Out(3,1,"Active");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,70 :: 		} else {
	GOTO       L_pageView4
L_pageView3:
;Ilac.c,71 :: 		Lcd_Out(3,1,"Inactive");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,72 :: 		}
L_pageView4:
;Ilac.c,73 :: 		}
L_end_pageView:
	RETURN
; end of _pageView

_compareTime:

;Ilac.c,77 :: 		void compareTime(){
;Ilac.c,79 :: 		for(i = 0; i < 5; i++)
	CLRF       compareTime_i_L0+0
	CLRF       compareTime_i_L0+1
L_compareTime5:
	MOVLW      128
	XORWF      compareTime_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__compareTime54
	MOVLW      5
	SUBWF      compareTime_i_L0+0, 0
L__compareTime54:
	BTFSC      STATUS+0, 0
	GOTO       L_compareTime6
;Ilac.c,80 :: 		if (alarms[i].active == 1) {
	MOVF       compareTime_i_L0+0, 0
	MOVWF      R0+0
	MOVF       compareTime_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
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
	GOTO       L__compareTime55
	MOVLW      1
	XORWF      R1+0, 0
L__compareTime55:
	BTFSS      STATUS+0, 2
	GOTO       L_compareTime8
;Ilac.c,81 :: 		if (alarms[i].hour == hour && alarms[i].minute == minute) {
	MOVF       compareTime_i_L0+0, 0
	MOVWF      R0+0
	MOVF       compareTime_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _alarms+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      _hour+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_compareTime11
	MOVF       compareTime_i_L0+0, 0
	MOVWF      R0+0
	MOVF       compareTime_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _alarms+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORWF      _minute+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_compareTime11
L__compareTime47:
;Ilac.c,82 :: 		Lcd_Out(3,1,"Alarm");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,83 :: 		}
L_compareTime11:
;Ilac.c,84 :: 		}
L_compareTime8:
;Ilac.c,79 :: 		for(i = 0; i < 5; i++)
	INCF       compareTime_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       compareTime_i_L0+1, 1
;Ilac.c,84 :: 		}
	GOTO       L_compareTime5
L_compareTime6:
;Ilac.c,85 :: 		}
L_end_compareTime:
	RETURN
; end of _compareTime

_editAlarm:

;Ilac.c,87 :: 		void editAlarm(int num){
;Ilac.c,88 :: 		if (edit) {
	MOVF       _edit+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm12
;Ilac.c,89 :: 		switch (cursor) {
	GOTO       L_editAlarm13
;Ilac.c,90 :: 		case 0:
L_editAlarm15:
;Ilac.c,91 :: 		alarms[page].hour = num;
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
;Ilac.c,92 :: 		Lcd_Chr(2,9,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,93 :: 		break;
	GOTO       L_editAlarm14
;Ilac.c,94 :: 		case 1:
L_editAlarm16:
;Ilac.c,95 :: 		alarms[page].hour = alarms[page].hour*10 + num;
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
;Ilac.c,96 :: 		Lcd_Chr(2,10,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,97 :: 		break;
	GOTO       L_editAlarm14
;Ilac.c,98 :: 		case 2:
L_editAlarm17:
;Ilac.c,99 :: 		alarms[page].minute = num;
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
;Ilac.c,100 :: 		Lcd_Chr(2,12,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,101 :: 		LCD_CMD(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW      20
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,102 :: 		break;
	GOTO       L_editAlarm14
;Ilac.c,103 :: 		case 3:
L_editAlarm18:
;Ilac.c,104 :: 		alarms[page].minute = alarms[page].minute*10 + num;
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
;Ilac.c,105 :: 		Lcd_Chr(2,13,num+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      FARG_editAlarm_num+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Ilac.c,106 :: 		break;
	GOTO       L_editAlarm14
;Ilac.c,107 :: 		}
L_editAlarm13:
	MOVF       _cursor+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm15
	MOVF       _cursor+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm16
	MOVF       _cursor+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm17
	MOVF       _cursor+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_editAlarm18
L_editAlarm14:
;Ilac.c,108 :: 		cursor++;
	INCF       _cursor+0, 1
;Ilac.c,109 :: 		if (cursor == 4) {
	MOVF       _cursor+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_editAlarm19
;Ilac.c,110 :: 		cursor = 0;
	CLRF       _cursor+0
;Ilac.c,111 :: 		edit = 0;
	CLRF       _edit+0
;Ilac.c,112 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,113 :: 		}
L_editAlarm19:
;Ilac.c,114 :: 		}
L_editAlarm12:
;Ilac.c,115 :: 		}
L_end_editAlarm:
	RETURN
; end of _editAlarm

_main:

;Ilac.c,117 :: 		void main() {
;Ilac.c,118 :: 		key = 0;
	CLRF       _key+0
;Ilac.c,119 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;Ilac.c,120 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Ilac.c,121 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Ilac.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,123 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,124 :: 		Lcd_Out(1,1,time);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,125 :: 		setAlarms();
	CALL       _setAlarms+0
;Ilac.c,126 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,127 :: 		while(1){
L_main20:
;Ilac.c,128 :: 		key = 0;
	CLRF       _key+0
;Ilac.c,129 :: 		do {
L_main22:
;Ilac.c,130 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _key+0
;Ilac.c,131 :: 		} while (!key);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main22
;Ilac.c,132 :: 		switch (key){
	GOTO       L_main25
;Ilac.c,150 :: 		case 1:
L_main27:
;Ilac.c,151 :: 		num = 7;
	MOVLW      7
	MOVWF      _num+0
;Ilac.c,152 :: 		editAlarm(num);
	MOVLW      7
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,153 :: 		break;
	GOTO       L_main26
;Ilac.c,155 :: 		case 2:
L_main28:
;Ilac.c,156 :: 		num = 4;
	MOVLW      4
	MOVWF      _num+0
;Ilac.c,157 :: 		editAlarm(num);
	MOVLW      4
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,158 :: 		break;
	GOTO       L_main26
;Ilac.c,160 :: 		case 3:
L_main29:
;Ilac.c,161 :: 		num = 1;
	MOVLW      1
	MOVWF      _num+0
;Ilac.c,162 :: 		editAlarm(num);
	MOVLW      1
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,163 :: 		break;
	GOTO       L_main26
;Ilac.c,165 :: 		case 5:
L_main30:
;Ilac.c,166 :: 		num = 8;
	MOVLW      8
	MOVWF      _num+0
;Ilac.c,167 :: 		editAlarm(num);
	MOVLW      8
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,168 :: 		break;
	GOTO       L_main26
;Ilac.c,169 :: 		case 6:
L_main31:
;Ilac.c,170 :: 		num = 5;
	MOVLW      5
	MOVWF      _num+0
;Ilac.c,171 :: 		editAlarm(num);
	MOVLW      5
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,172 :: 		break;
	GOTO       L_main26
;Ilac.c,174 :: 		case 7:
L_main32:
;Ilac.c,175 :: 		num = 2;
	MOVLW      2
	MOVWF      _num+0
;Ilac.c,176 :: 		editAlarm(num);
	MOVLW      2
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,177 :: 		break;
	GOTO       L_main26
;Ilac.c,179 :: 		case 8:
L_main33:
;Ilac.c,180 :: 		num = 0;
	CLRF       _num+0
;Ilac.c,181 :: 		editAlarm(num);
	CLRF       FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,182 :: 		break;
	GOTO       L_main26
;Ilac.c,184 :: 		case 9:
L_main34:
;Ilac.c,185 :: 		num = 9;
	MOVLW      9
	MOVWF      _num+0
;Ilac.c,186 :: 		editAlarm(num);
	MOVLW      9
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,187 :: 		break;
	GOTO       L_main26
;Ilac.c,189 :: 		case 10:
L_main35:
;Ilac.c,190 :: 		num = 6;
	MOVLW      6
	MOVWF      _num+0
;Ilac.c,191 :: 		editAlarm(num);
	MOVLW      6
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,192 :: 		break;
	GOTO       L_main26
;Ilac.c,194 :: 		case 11:
L_main36:
;Ilac.c,195 :: 		num = 3;
	MOVLW      3
	MOVWF      _num+0
;Ilac.c,196 :: 		editAlarm(num);
	MOVLW      3
	MOVWF      FARG_editAlarm_num+0
	CLRF       FARG_editAlarm_num+1
	CALL       _editAlarm+0
;Ilac.c,197 :: 		break;
	GOTO       L_main26
;Ilac.c,200 :: 		case 4:
L_main37:
;Ilac.c,201 :: 		if (alarms[page].active == 1) {
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
	GOTO       L__main58
	MOVLW      1
	XORWF      R1+0, 0
L__main58:
	BTFSS      STATUS+0, 2
	GOTO       L_main38
;Ilac.c,202 :: 		alarms[page].active = 0;
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
;Ilac.c,203 :: 		} else {
	GOTO       L_main39
L_main38:
;Ilac.c,204 :: 		alarms[page].active = 1;
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
;Ilac.c,205 :: 		}
L_main39:
;Ilac.c,206 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,207 :: 		break;
	GOTO       L_main26
;Ilac.c,211 :: 		case 13:
L_main40:
;Ilac.c,212 :: 		if (edit){
	MOVF       _edit+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main41
;Ilac.c,213 :: 		edit = 0;
	CLRF       _edit+0
;Ilac.c,214 :: 		cursor = 0;
	CLRF       _cursor+0
;Ilac.c,215 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,216 :: 		}
	GOTO       L_main42
L_main41:
;Ilac.c,218 :: 		edit = 1;
	MOVLW      1
	MOVWF      _edit+0
;Ilac.c,219 :: 		LCD_CMD(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Ilac.c,220 :: 		Lcd_Out(2,8," ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Ilac+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Ilac.c,221 :: 		}
L_main42:
;Ilac.c,222 :: 		break;
	GOTO       L_main26
;Ilac.c,226 :: 		case 14:
L_main43:
;Ilac.c,227 :: 		alarm=0;
	CLRF       _alarm+0
;Ilac.c,228 :: 		break;
	GOTO       L_main26
;Ilac.c,231 :: 		case 15:
L_main44:
;Ilac.c,232 :: 		page--;
	DECF       _page+0, 1
;Ilac.c,233 :: 		if (page == -1) {
	MOVF       _page+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;Ilac.c,234 :: 		page = 4;
	MOVLW      4
	MOVWF      _page+0
;Ilac.c,235 :: 		}
L_main45:
;Ilac.c,236 :: 		pageView();
	CALL       _pageView+0
;Ilac.c,237 :: 		break;
	GOTO       L_main26
;Ilac.c,239 :: 		case 16:
L_main46:
;Ilac.c,240 :: 		page = (page + 1) % 5;
	MOVF       _page+0, 0
	ADDLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      0
	BTFSC      _page+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
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
;Ilac.c,242 :: 		break;
	GOTO       L_main26
;Ilac.c,243 :: 		}
L_main25:
	MOVF       _key+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _key+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main28
	MOVF       _key+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main29
	MOVF       _key+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main30
	MOVF       _key+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main31
	MOVF       _key+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	MOVF       _key+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main33
	MOVF       _key+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main34
	MOVF       _key+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _key+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main36
	MOVF       _key+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       _key+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main40
	MOVF       _key+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main43
	MOVF       _key+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main44
	MOVF       _key+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main46
L_main26:
;Ilac.c,244 :: 		}
	GOTO       L_main20
;Ilac.c,245 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
