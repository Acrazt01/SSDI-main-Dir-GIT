//Read Common Registers:
#define MODE Read_Common_Register(0x00)
#define GAR0 Read_Common_Register(0x01)
#define GAR1 Read_Common_Register(0x02)
#define GAR2 Read_Common_Register(0x03)
#define GAR3 Read_Common_Register(0x04)
#define SUBR0 Read_Common_Register(0x05)
#define SUBR1 Read_Common_Register(0x06)
#define SUBR2 Read_Common_Register(0x07)
#define SUBR3 Read_Common_Register(0x08)
#define MAC0 Read_Common_Register(0x09)
#define MAC1 Read_Common_Register(0x0A)
#define MAC2 Read_Common_Register(0x0B)
#define MAC3 Read_Common_Register(0x0C)
#define MAC4 Read_Common_Register(0x0D)
#define MAC5 Read_Common_Register(0x0E)
#define IP0 Read_Common_Register(0x0F)
#define IP1 Read_Common_Register(0x10)
#define IP2 Read_Common_Register(0x11)
#define IP3 Read_Common_Register(0x12)
#define INTLEVEL0 Read_Common_Register(0x13)
#define INTLEVEL1 Read_Common_Register(0x14)
#define INT Read_Common_Register(0x15)
#define INT_MASK Read_Common_Register(0x16)
#define Sck_INT Read_Common_Register(0x17)
#define Sck_INT_MASK Read_Common_Register(0x18)
#define RT0 Read_Common_Register(0x19)
#define RT1 Read_Common_Register(0x1A)
#define RCR Read_Common_Register(0x1B)
#define PTIMER Read_Common_Register(0x1C)
#define PMAGIC Read_Common_Register(0x1D)
#define PHAR0 Read_Common_Register(0x1E)
#define PHAR1 Read_Common_Register(0x1F)
#define PHAR2 Read_Common_Register(0x20)
#define PHAR3 Read_Common_Register(0x21)
#define PHAR4 Read_Common_Register(0x22)
#define PHAR5 Read_Common_Register(0x23)
#define PSID0 Read_Common_Register(0x24)
#define PSID1 Read_Common_Register(0x25)
#define PMRU0 Read_Common_Register(0x26)
#define PRMU1 Read_Common_Register(0x27)
#define UIP0 Read_Common_Register(0x28)
#define UIP1 Read_Common_Register(0x29)
#define UIP2 Read_Common_Register(0x2A)
#define UIP3 Read_Common_Register(0x2B)
#define UPORT0 Read_Common_Register(0x2C)
#define UPORT1 Read_Common_Register(0x2D)
#define PHYCFGR Read_Common_Register(0x2E)
#define W5500_Version Read_Common_Register(0x39)

unsigned short Read_Common_Register(unsigned short Address){

     //CONFIG SPI FRAME FOR READ
     ADDRESS_PHASE_HB = 0x00;   //
     ADDRESS_PHASE_LB = Address;
     BSB = 0x00;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
     RWB.B2 = 0;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     //READ IT
     return SPI_FRAME_READ();
}

//Write Common Registers:
void Mode(unsigned char value){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x00;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}

void Config_Gateway(){

     unsigned short i;

    for(i=0x00;i<0x04;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x01 + i;
       BSB = 0x00;
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = Gateway[i];
       SPI_FRAME();
    }

}

void Config_Subnet(){

     unsigned short i;

    for(i=0x00;i<0x04;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x05 + i;
       BSB = 0x00;
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = Subnet_Mask[i];
       SPI_FRAME();
    }

}

void Config_MAC(){

     unsigned short i;

    for(i=0x00;i<0x06;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x09 + i;
       BSB = 0x00;
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = MAC[i];
       SPI_FRAME();
    }

}

void Config_IP(){

     unsigned char i;

    for(i=0x00;i<0x04;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x0F + i;
       BSB = 0x00;
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = IP[i];
       SPI_FRAME();
    }

}

void INTLEVEL(unsigned char value[2]){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x13;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x14;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();


}

void IR(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x15;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();                
     
     }
     
void IMR(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x16;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

     }
     
void Sck_Interrupts(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x17;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

     }
     
void Sck_Interrupts_Mask(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x18;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

     }
     
void Retry_Time(unsigned char value[2]){


     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x19;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x1A;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();


}

void Retry_Count(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x1B;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

     }
     
void PTIMER_W(unsigned char value){



     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x1C;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

     }
     
void PMAGIC_W(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x1D;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

     }
     
void PHAR(unsigned char value[6]){

     unsigned char i;

    for(i=0x00;i<0x06;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x1E + i;
       BSB = 0x00;
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = value[i];
       SPI_FRAME();
    }

}

void PSID(unsigned char value[2]){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x24;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x25;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();


}

void PMRU(unsigned char value[2]){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x26;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x27;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();


}

void PHY_Config(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x2E;
     BSB = 0x00;
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}