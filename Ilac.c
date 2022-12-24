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

unsigned short key=0, count = 0, edit = 0, cursor = 0, alarm = 0, num = 0, second, minute, hour;
short page = 0;
char keypadPort at PORTD;
char time[]="Time:   :  :  ";

struct alarm {
     unsigned short minute;
     unsigned short hour;
     unsigned active;
};

struct alarm alarms[5];

// set alarms

void setAlarms(){
     int i;
     for(i = 0; i < 5; i++) {
          alarms[i].minute = i;
          alarms[i].hour = 0;
          alarms[i].active = 1;
     }
}

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

    //BCD to Decimal
    Lcd_Chr(1,7,(hour/16)+48);
    Lcd_Chr(1,8,(hour%16)+48);
    Lcd_Chr(1,10,(minute/16)+48);
    Lcd_Chr(1,11,(minute%16)+48);
    Lcd_Chr(1,13,(second/16)+48);
    Lcd_Chr(1,14,(second%16)+48);
}

//create a page view for the alarm clock

void pageView(){
     char string[] = "Alarm     :  ";
     string[6] = page+49;
     string[8] = (alarms[page].hour/16)+48;
     string[9] = (alarms[page].hour%16)+48;
     string[11] = (alarms[page].minute/16)+48;
     string[12] = (alarms[page].minute%16)+48;
     Lcd_Out(2,1,string);
     if (alarms[page].active == 1) {
          Lcd_Out(3,1,"Active");
     } else {
          Lcd_Out(3,1,"Inactive");
     }
}

// compare the time with the alarm time

void compareTime(){
     int i;
     for(i = 0; i < 5; i++)
     if (alarms[i].active == 1) {
          if (alarms[i].hour == hour && alarms[i].minute == minute) {
               Lcd_Out(3,1,"Alarm");
          }
     }
}

void editAlarm(int num){
     if (edit) {
          switch (cursor) {
               case 0:
                    alarms[page].hour = num;
                    Lcd_Chr(2,9,num+48);
                    break;
               case 1:
                    alarms[page].hour = alarms[page].hour*10 + num;
                    Lcd_Chr(2,10,num+48);
                    break;
               case 2:
                    alarms[page].minute = num;
                    Lcd_Chr(2,12,num+48);
                    LCD_CMD(_LCD_MOVE_CURSOR_RIGHT);
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

void main() {
     key = 0;
     I2C1_Init(100000);
     Lcd_Init();
     Keypad_Init();
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Lcd_Out(1,1,time);
     setAlarms();
     pageView();
     while(1){
          key = 0;
          do {
               key = Keypad_Key_Click();
          } while (!key);
          switch (key){
               // case 1 -> 7
               // case 2 -> 4
               // case 3 -> 1
               // case 4 -> on/off
               // case 5 -> 8
               // case 6 -> 5
               // case 7 -> 2
               // case 8 -> 0
               // case 9 -> 9
               // case 10 -> 6
               // case 11 -> 3
               // case 12 -> =
               // case 13 -> /
               // case 14 -> *
               // case 15 -> -
               // case 16 -> +

               case 1:
                    num = 7;
                    editAlarm(num);
                    break;
               
               case 2:
                    num = 4;
                    editAlarm(num);
                    break;

               case 3:
                    num = 1;
                    editAlarm(num);
                    break;

               case 5:
                    num = 8;
                    editAlarm(num);
                    break;
               case 6:
                    num = 5;
                    editAlarm(num);
                    break;

               case 7:
                    num = 2;
                    editAlarm(num);
                    break;

               case 8:
                    num = 0;
                    editAlarm(num);
                    break;

               case 9:
                    num = 9;
                    editAlarm(num);
                    break;

               case 10:
                    num = 6;
                    editAlarm(num);
                    break;

               case 11:
                    num = 3;
                    editAlarm(num);
                    break;

               // case 4 -> on/off
               case 4:
                    if (alarms[page].active == 1) {
                         alarms[page].active = 0;
                    } else {
                         alarms[page].active = 1;
                    }
                    pageView();
                    break;

               // edit the alarm time
               // case 13 -> /
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
     
               // case 14 -> *
               // turn off the alarm
               case 14:
                    alarm=0;
                    break;

               // case 15 -> -
               case 15:
                    page--;
                    if (page == -1) {
                         page = 4;
                    }
                    pageView();
                    break;
               // case 16 -> +
               case 16:
                    page = (page + 1) % 5;
                    pageView();
                    break;
          }
     }
}