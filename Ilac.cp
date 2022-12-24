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

unsigned short key=0, count = 0, page=0;
char keypadPort at PORTD;
char time[]="Time:   :  :  ";
unsigned short second, minute, hour;

struct alarm {
 unsigned short second;
 unsigned short minute;
 unsigned short hour;
 bool enabled;
};



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


 Lcd_Chr(1,7,(hour/16)+48);
 Lcd_Chr(1,8,(hour%16)+48);
 Lcd_Chr(1,10,(minute/16)+48);
 Lcd_Chr(1,11,(minute%16)+48);
 Lcd_Chr(1,13,(second/16)+48);
 Lcd_Chr(1,14,(second%16)+48);
}



void interupt() {
 if (TMR0IF_bit) {
 getTime();
 TMR0IF_bit = 0;
 TMR0 = 0x06;
 count++;
 if (count == 100) {
 count = 0;
 }
 }
}

void main() {
 INTCON.GIE = 1;
 INTCON.T0IE = 1;
 OPTION_REG = 0x07;
 TMR0 = 0x06;

 I2C1_Init(100000);
 Lcd_Init();
 Keypad_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,time);
 while(1);
}
