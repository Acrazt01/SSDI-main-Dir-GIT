unsigned char IP[4] = {10,0,2,47};
unsigned char Gateway[4] = {10,0,0,1};
unsigned char Subnet_Mask[4] = {255,255,252,0};
unsigned char MAC[6] = {0x00, 0x14, 0xA3, 0x72, 0x17, 0x3f};
unsigned char SCKSZ[8] = {2,2,2,2,2,2,2,2};
unsigned short SckN = 0;

#define LED1 PORTB.RB0 = 1
#define LED0 PORTB.RB0 = 0
#include "W5500_Library.h"

void init(){

  OSCCON = 0b01110111;

  ANSELA = 0x00;
  ANSELB = 0x00;
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;

  TRISA = 0x00;
  TRISB = 0x00;
  TRISC = 0b00010000;
  TRISD = 0x00;
  TRISE = 0x00;

  PORTA = 0x00;
  PORTB = 0x00;
  PORTC = 0x00;
  PORTD = 0x00;
  PORTE = 0x00;

  Delay_ms(100);
  PORTE.RB1 = 1;
  SPI1_init();
  Chip_Select = 1;
  delay_us(100);

  LED1;
  Delay_ms(100);
  LED0;
  Delay_ms(100);
  LED1;
  Delay_ms(100);
  LED0;
  PORTB = 0xFF;
  delay_ms(1000);
  PORTB = 0x00;
  delay_ms(1000);
  PORTB = 0xFF;
  delay_ms(1000);
  PORTB = 0x00;
  delay_ms(1000);
  


}

void UDP(){

     Current_Sck_Register = 0;
     Current_Sck_Tx = 0;
     Current_Sck_Rx = 0;
     W5500_Init();
     
     Socket[SckN].Sck_Mode = 0x02;
     Socket[SckN].Sck_Cmd = OPEN;
     Socket[SckN].SPORT_Register_Address[0] = 0x27;
     Socket[SckN].SPORT_Register_Address[1] = 0x11;
     Socket[SckN].DMAC_Register_Address[0] = 0x90; ///////////////////////////////
     Socket[SckN].DMAC_Register_Address[1] = 0xB1;
     Socket[SckN].DMAC_Register_Address[2] = 0x1C;
     Socket[SckN].DMAC_Register_Address[3] = 0x94;       //Debes comfirar la DMAC y la DIP
     Socket[SckN].DMAC_Register_Address[4] = 0x88;           //Esos son datos Dummy
     Socket[SckN].DMAC_Register_Address[5] = 0x05;
     Socket[SckN].DIP_Register_Address[0] = 10;
     Socket[SckN].DIP_Register_Address[1] = 0;
     Socket[SckN].DIP_Register_Address[2] = 2;
     Socket[SckN].DIP_Register_Address[3] = 3; ///////////////////////////
     Socket[SckN].DPORT_Register_Address[0] = 0x27;
     Socket[SckN].DPORT_Register_Address[1] = 0x11;
     Socket[SckN].Rx_Bf_Sz = 2;
     Socket[SckN].Tx_Bf_Sz = 2;

     Destination_MAC(Socket[SckN].DMAC_Register_Address);
     Destination_IP(Socket[SckN].DIP_Register_Address);
     Destination_PORT(Socket[SckN].DPORT_Register_Address);

     Sck_Mode(Socket[SckN].Sck_Mode); //Set UDP Mode
     SckCMD(Socket[SckN].Sck_Cmd);

     DATA[0] = 0xFF;
     DATA[1] = 0x00;
     DATA[2] = 0xFF;
     DATA[3] = 0x00;
     DATA[4] = 0xFF;
     DATA[5] = 0xFF;
     DATA[6] = 0x00;
     DATA[7] = 0xFF;
     DATA[8] = 0x00;
     DATA[9] = 0xFF;
     DATA[10] = 0xFF;
     DATA[11] = 0x00;
     DATA[12] = 0xFF;
     DATA[13] = 0x00;
     DATA[14] = 0xFF;
     DATA[15] = 0x00;


     if(Sck_STAT == 0x22){
     PORTD.B7 = 1;
       while(1){
         PORTD.B6 = 1;
         if(Sck_STAT == 0x22){
           PORTD.B5 = 1;
           //Write_Tx(0x00,0x00);
           SckCMD(SEND_MAC);
           if(Sck_STAT == 0x00){
             PORTD.B4 = 1;
             SckCMD(CLOSE);
             PORTB = 0xFF;
             delay_ms(250);
             PORTB = 0x00;
             delay_ms(250);
             PORTB = 0xFF;
             delay_ms(250);
             PORTB = 0x00;
             delay_ms(250);
           }else{ PORTC.b4 = 1;}
           PORTD.B3 = 1;
           SckCMD(OPEN);
           delay_ms(1);
         }else{ PORTC.b5 = 1;}
       }
     }else{ PORTC.b7 = 1;}

}

void main() {

     init();
     UDP();
     //Config_Subnet();
     /*for(;;){
       PORTD = SUBR0;
       delay_ms(1000);
       PORTD = SUBR1;
       delay_ms(1000);
       PORTD = SUBR2;
       delay_ms(1000);
       PORTD = SUBR3;
       delay_ms(1000);
     }*/
 }