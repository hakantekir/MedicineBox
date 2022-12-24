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

char time[] = "TIME:  :  :  ";
char calendar[] = "DATE:  /  /20  ";
unsigned int  i, second, minute, hour, date, month, year;

void getTime(){
  // Convert BCD to decimal
  second = (second >> 4) * 10 + (second & 0x0F);
  minute = (minute >> 4) * 10 + (minute & 0x0F);
  hour = (hour >> 4) * 10 + (hour & 0x0F);
  date = (date >> 4) * 10 + (date & 0x0F);
  month = (month >> 4) * 10 + (month & 0x0F);
  year = (year >> 4) * 10 + (year & 0x0F);
  // End conversion
  time[12]     = second % 10  + 48;
  time[11]     = second / 10  + 48;
  time[9]      = minute % 10  + 48;
  time[8]      = minute / 10  + 48;
  time[6]      = hour % 10  + 48;
  time[5]      = hour / 10  + 48;
  calendar[14] = year % 10 + 48;
  calendar[13] = year / 10  + 48;
  calendar[9]  = month % 10 + 48;
  calendar[8]  = month / 10 + 48;
  calendar[6]  = date % 10 + 48;
  calendar[5]  = date / 10 + 48;
}

void writePageNumber(int num){
     char numCh[7];
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Out(1,4,"Kutu: ");
     IntToStr(num, numCh);
     Lcd_Out_CP(numCh);
}

void main() {
     key=0;
     Keypad_Init(); // Keypad'i tanit
     Lcd_Init(); // LCD'yi tanit
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_CURSOR_OFF);
     getTime();
     
     //writePageNumber(2);
     while(1){
          while(!key) key = Keypad_Key_Press();
     }
}