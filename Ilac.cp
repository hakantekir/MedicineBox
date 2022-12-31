#line 1 "C:/Users/hakan/Desktop/Ilac/Ilac.c"






sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

char key=0, edit = 0, cursor = 0, page = 0, second, minute, hour, i;
char keypadPort at PORTD;

struct alarm {
 unsigned short minute;
 unsigned short hour;
 unsigned active;
};

struct alarm alarms[5];

void getTime(){
 I2C1_Start();
 I2C1_Wr(0xD0);
 I2C1_Wr(0x00);
 I2C1_Repeated_Start();
 I2C1_Wr(0xD1);
 second = I2C1_Rd(1);
 minute = I2C1_Rd(1);
 hour = I2C1_Rd(0);
 I2C1_Stop();
 second = (second/16)*10 + (second%16);
 minute = (minute/16)*10 + (minute%16);
 hour = (hour/16)*10 + (hour%16);
 Lcd_Chr(1,7,(hour/10)+48);
 Lcd_Chr(1,8,(hour%10)+48);
 Lcd_Chr(1,10,(minute/10)+48);
 Lcd_Chr(1,11,(minute%10)+48);
 Lcd_Chr(1,13,(second/10)+48);
 Lcd_Chr(1,14,(second%10)+48);
}

void pageView(){
 char string[] = "Alarm     :  ";
 string[6] = page+49;
 string[8] = (alarms[page].hour/10)+48;
 string[9] = (alarms[page].hour%10)+48;
 string[11] = (alarms[page].minute/10)+48;
 string[12] = (alarms[page].minute%10)+48;
 Lcd_Out(2,1,string);
 if (alarms[page].active == 1) {
 Lcd_Out(3,1," Active ");
 } else {
 Lcd_Out(3,1,"Inactive");
 }
}

void editAlarm(int num){
 if (edit) {
 switch (cursor) {
 case 0:
 if (num > 2) {
 num = 0;
 }
 alarms[page].hour = num;
 Lcd_Chr(2,9,num+48);
 break;
 case 1:
 if (alarms[page].hour == 2 && num > 3) {
 num = 0;
 }
 alarms[page].hour = alarms[page].hour*10 + num;
 Lcd_Chr(2,10,num+48);
 LCD_CMD(_LCD_MOVE_CURSOR_RIGHT);
 break;
 case 2:
 if (num > 5) {
 num = 0;
 }
 alarms[page].minute = num;
 Lcd_Chr(2,12,num+48);
 break;
 case 3:
 alarms[page].minute = alarms[page].minute*10 + num;
 Lcd_Chr(2,13,num+48);
 break;
 }
 cursor++;
 if (cursor == 4) {
 cursor = 0;
 edit = 0;
 LCD_CMD(_LCD_CURSOR_OFF);
 }
 }
}

void alarm(int pageNum){
 switch (pageNum) {
 case 0:
  PORTC.B0  = 1;
 break;
 case 1:
  PORTC.B1  = 1;
 break;
 case 2:
  PORTC.B5  = 1;
 break;
 case 3:
  PORTC.B6  = 1;
 break;
 case 4:
  PORTC.B7  = 1;
 break;
 }
 PWm1_Start();
}

void setup(){
 TRISC.B0 = 0;
 TRISC.B1 = 0;
 TRISC.B2 = 0;
 TRISC.B5 = 0;
 TRISC.B6 = 0;
 TRISC.B7 = 0;
  PORTC.B0  = 0;
 key = 0;
 PWM1_Init(1000);
 PWM1_Set_Duty(1000);
 I2C1_Init(100000);
 Lcd_Init();
 Keypad_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Time:   :  :  ");
 pageView();
 for (i = 0; i < 5; i++) {
 alarms[i].minute = 0;
 alarms[i].hour = 0;
 alarms[i].active = 0;
 }
  PORTC.B0  = 0;
  PORTC.B1  = 0;
  PORTC.B5  = 0;
  PORTC.B6  = 0;
  PORTC.B7  = 0;
 PORTC.B2 = 0;
}

void main() {
 setup();
 while(1){
 getTime();
 for(i = 0; i < 5; i++){
 if (alarms[i].active == 1 && alarms[i].hour == hour && alarms[i].minute == minute) {
 alarm(i);
 }
 }
 key = 0;
 key = Keypad_Key_Click();
 switch (key){
#line 187 "C:/Users/hakan/Desktop/Ilac/Ilac.c"
 case 1:
 editAlarm(7);
 break;

 case 2:
 editAlarm(4);
 break;

 case 3:
 editAlarm(1);
 break;

 case 5:
 editAlarm(8);
 break;
 case 6:
 editAlarm(5);
 break;

 case 7:
 editAlarm(2);
 break;

 case 8:
 editAlarm(0);
 break;

 case 9:
 editAlarm(9);
 break;

 case 10:
 editAlarm(6);
 break;

 case 11:
 editAlarm(3);
 break;


 case 4:
 if (!edit){
 alarms[page].active = !alarms[page].active;
 pageView();
 }
 break;



 case 13:
 if (edit){
 edit = 0;
 cursor = 0;
 LCD_CMD(_LCD_CURSOR_OFF);
 }
 else {
 edit = 1;
 LCD_CMD(_LCD_BLINK_CURSOR_ON);
 Lcd_Out(2,8," ");
 }
 break;



 case 14:
  PORTC.B0  = 0;
  PORTC.B1  = 0;
  PORTC.B5  = 0;
  PORTC.B6  = 0;
  PORTC.B7  = 0;
 PWM1_Stop();
 break;


 case 15:
 if (!edit){
 page--;
 if (page == 255) {
 page = 4;
 }
 pageView();
 }
 break;

 case 16:
 if (!edit){
 page = (page + 1) % 5;
 pageView();
 }
 break;
 }
 }
}
