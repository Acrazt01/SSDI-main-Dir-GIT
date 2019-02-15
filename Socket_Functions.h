//Read Sck Registers:
#define Sck_MODE Read_Sck_Register(0x00)
#define Sck_CMD Read_Sck_Register(0x01)
#define Sck_IR Read_Sck_Register(0x02)
#define Sck_STAT Read_Sck_Register(0x03)
#define Sck_PORT0 Read_Sck_Register(0x04)
#define Sck_PORT1 Read_Sck_Register(0x05)
#define DMAC0 Read_Sck_Register(0x06)
#define DMAC1 Read_Sck_Register(0x07)
#define DMAC2 Read_Sck_Register(0x08)
#define DMAC3 Read_Sck_Register(0x09)
#define DMAC4 Read_Sck_Register(0x0A)
#define DMAC5 Read_Sck_Register(0x0B)
#define DIP0 Read_Sck_Register(0x0C)
#define DIP1 Read_Sck_Register(0x0D)
#define DIP2 Read_Sck_Register(0x0E)
#define DIP3 Read_Sck_Register(0x0F)
#define DPORT0 Read_Sck_Register(0x10)
#define DPORT1 Read_Sck_Register(0x11)
#define Sck_MSSR0 Read_Sck_Register(0x12)
#define Sck_MSSR1 Read_Sck_Register(0x13)
#define Sck_TOS Read_Sck_Register(0x15)
#define Sck_TTL Read_Sck_Register(0x16)
#define Rx_Buffer_Sz Read_Sck_Register(0x1E)
#define Tx_Buffer_Sz Read_Sck_Register(0x1F)
#define Tx_Free_Sz0 Read_Sck_Register(0x20)
#define Tx_Free_Sz1 Read_Sck_Register(0x21)
#define Tx_R_Pointer0 Read_Sck_Register(0x22)
#define Tx_R_Pointer1 Read_Sck_Register(0x23)
#define Tx_W_Pointer0 Read_Sck_Register(0x024)
#define Tx_W_Pointer1 Read_Sck_Register(0x025)
#define Rx_Rcvd_Sz0 Read_Sck_Register(0x26)
#define Rx_Rcvd_Sz1 Read_Sck_Register(0x27)
#define Rx_R_Pointer0 Read_Sck_Register(0x28)
#define Rx_R_Pointer1 Read_Sck_Register(0x29)
#define Rx_W_Pointer0 Read_Sck_Register(0x2A)
#define Rx_W_Pointer1 Read_Sck_Register(0x2B)
#define Sck_IMR Read_Sck_Register(0x2C)
#define FRAG0 Read_Sck_Register(0x2D)
#define FRAG1 Read_Sck_Register(0x2E)
#define Keep_alive_TMR Read_Sck_Register(0x2F)

#define OPEN 0x01
#define LISTEN 0x02
#define CONNECT 0x04
#define DISCON 0x08
#define CLOSE 0x10
#define SEND 0x20
#define SEND_MAC 0x21
#define SEND_KEEP 0x22
#define RECV 0x40

unsigned short Current_Sck_Register = 0;
unsigned short Current_Sck_Tx = 0;
unsigned short Current_Sck_Rx = 0;

struct Socket_Info {

  unsigned char Sck_Mode;                               //0x00 0x00
  unsigned char Sck_Cmd;                                //0x00 0x01
  unsigned char SPORT_Register_Address[2];              //0x00 0x04 --> 0x00 0x05
  unsigned char DMAC_Register_Address[6];               //0x00 0x06 --> 0x00 0x0B
  unsigned char DIP_Register_Address[4];                //0x00 0x0C --> 0x00 0x0F
  unsigned char DPORT_Register_Address[2];              //0x00 0x10 --> 0x00 0x11
  unsigned char Sck_MSSR[2];                            //0x00 0x12 --> 0x00 0x13
  unsigned char Rx_Bf_Sz;                               //0x00 0x1E
  unsigned char Tx_Bf_Sz;                               //0x00 0x1F
  unsigned char Tx_Free_Sz[2];                          //0x00 0x20 --> 0x00 0x21
  unsigned char Tx_R_Pointer[2];                        //0x00 0x22 --> 0x00 0x23 .
  unsigned char Tx_W_Pointer[2];                        //0x00 0x24 --> 0x00 0x25
  unsigned char Rcv_Data_Sz[2];                         //0x00 0x26 --> 0x00 0x27 .
  unsigned char Rx_R_Pointer[2];                        //0x00 0x28 --> 0x00 0x29
  unsigned char Rx_W_Pointer[2];                        //0x00 0x2A --> 0x00 0x2B .
  unsigned char Sck_imr;                                //0x00 0x2C

  } Socket[8];

unsigned char getCurrent_Socket_Rx_Address(){     //Choose correct BSB configuration

     unsigned char Result;

     switch (Current_Sck_Rx) {

           case 0: Result = 0b00000011; break;
           case 1: Result = 0b00000111; break;
           case 2: Result = 0b00001011; break;
           case 3: Result = 0b00001111; break;
           case 4: Result = 0b00010011; break;
           case 5: Result = 0b00010111; break;
           case 6: Result = 0b00011011; break;
           case 7: Result = 0b00011111; break;
           default: Result = 0b00000011;

     }

      return Result;
}

unsigned char getCurrent_Socket_Tx_Address(){     //Choose correct BSB configuration

     unsigned char Result;

     switch (Current_Sck_Tx) {

           case 0: Result = 0b00000010; break;
           case 1: Result = 0b00000110; break;
           case 2: Result = 0b00001010; break;
           case 3: Result = 0b00001110; break;
           case 4: Result = 0b00010010; break;
           case 5: Result = 0b00010110; break;
           case 6: Result = 0b00011010; break;
           case 7: Result = 0b00011110; break;
           default: Result = 0b00000010;

     }

      return Result;
}

//Write Socket Registers:
unsigned char getCurrent_Socket_Register_Address(){     //Choose correct BSB configuration

     unsigned char Result;

     switch (Current_Sck_Register) {

           case 0: Result = 0b00000001; break;
           case 1: Result = 0b00000101; break;
           case 2: Result = 0b00001001; break;
           case 3: Result = 0b00001101; break;
           case 4: Result = 0b00010001; break;
           case 5: Result = 0b00010110; break;
           case 6: Result = 0b00011001; break;
           case 7: Result = 0b00011101; break;
           default: Result = 0b00000001;

     }

      return Result;
}

unsigned short Read_Sck_Register(unsigned short Address){

     //CONFIG SPI FRAME FOR READ
     ADDRESS_PHASE_HB = 0x00;   //
     ADDRESS_PHASE_LB = Address;
     BSB = getCurrent_Socket_Register_Address();  // SELECT COMMMON REGISTER OR SOCKET REGISTER
     RWB.B2 = 0;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     //READ IT
     return SPI_FRAME_READ();
}

void Sck_Mode(unsigned char value){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x00;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}

void SckCMD(unsigned char value){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x01;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}

void Source_PORT(unsigned char value[2]){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x04;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();
     
     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x05;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();

}

void Destination_MAC(unsigned char value[6]){

    unsigned char i;

    for(i=0x00;i<0x06;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x06 + i;
       BSB = getCurrent_Socket_Register_Address();
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = value[i];
       SPI_FRAME();
    }

}

void Destination_IP(unsigned char value[4]){

    unsigned char i;

    for(i=0x00;i<0x04;i++){
      //CONFIG SPI FRAME
       ADDRESS_PHASE_HB = 0x00;
       ADDRESS_PHASE_LB = 0x0C + i;
       BSB = getCurrent_Socket_Register_Address();
       RWB.B2 = 1;  // READ[0]/WRITE[1]
       OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
       OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
       DATA_PHASE_1B = value[i];
       SPI_FRAME();
    }

}

void Destination_PORT(unsigned char value[2]){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x10;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x11;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();

}

void MSSR(unsigned char value[2]){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x12;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x13;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();

}

void TOS(unsigned char value){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x15;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}

void TTL(unsigned char value){

    //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x16;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}

void Set_Rx_Buffer_Sz(unsigned char value){
     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x1E;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;;
     SPI_FRAME();
}

void Set_Tx_Buffer_Sz(unsigned char value){
     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x1F;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();
}

void Tx_write_Pointer(unsigned char value[2]){
     
     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x24;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x25;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();

}

void Rx_Read_Pointer(unsigned char value[2]){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x28;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x29;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[1];
     SPI_FRAME();

}

void Sck_INT_Mask(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x2C;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();
     
     }
     
void Sck_FRAG(unsigned char value[2]){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x2D;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();
     
     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x2E;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value[0];
     SPI_FRAME();

     }
     
void Sck_KPALVTR(unsigned char value){

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = 0x00;
     ADDRESS_PHASE_LB = 0x2F;
     BSB = getCurrent_Socket_Register_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     DATA_PHASE_1B = value;
     SPI_FRAME();

}

//Buffer Tx:////////////////////////

//Write Buffer Tx:
void Write_Tx(unsigned char Address0, unsigned char Address1){    //Write 16 bytes in the current buffer at the Address0 and Adrress1 memory direction

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = Address0;
     ADDRESS_PHASE_LB = Address1;
     BSB = getCurrent_Socket_Tx_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     SPI_FRAME_16();

}

void Write_Tx_Oneln(unsigned char Socket ,unsigned char Pointer[2] ,unsigned char Address0 ,unsigned char Address1){
     Current_Sck_Tx = Socket;
     Tx_write_Pointer(Pointer);
     Write_Tx(Address0,Address1);
}

/*//Read Buffer Tx:
void Read_Tx(unsigned char Address0, unsigned char Address1){    //Write 16 bytes in the current buffer at the Address0 and Adrress1 memory direction

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = Address0;
     ADDRESS_PHASE_LB = Address1;
     BSB = getCurrent_Socket_Tx_Address();
     RWB.B2 = 0;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     SPI_FRAME_16_READ();

}

void Read_Tx_Oneln(unsigned char Socket ,unsigned char Address0 ,unsigned char Address1){
     Current_Sck_Tx = Socket;
     Read_Tx(Address0,Address1);
} */
/////////////////////////////////////////////////////////////////////////////

//Buffer Rx:////////////////////////

//Read Buffer Rx:
void Read_Rx(unsigned char Address0, unsigned char Address1){    //Write 16 bytes in the current buffer at the Address0 and Adrress1 memory direction

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = Address0;
     ADDRESS_PHASE_LB = Address1;
     BSB = getCurrent_Socket_Rx_Address();
     RWB.B2 = 0;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     SPI_FRAME_16_READ();

}

void Read_Rx_Oneln(unsigned char Socket ,unsigned char Address0 ,unsigned char Address1){
     Current_Sck_Rx = Socket;
     Read_Rx(Address0,Address1);
}

/*//Write Buffer Rx:
void Write_Rx(unsigned char Address0, unsigned char Address1){    //Write 16 bytes in the current buffer at the Address0 and Adrress1 memory direction

     //CONFIG SPI FRAME
     ADDRESS_PHASE_HB = Address0;
     ADDRESS_PHASE_LB = Address1;
     BSB = getCurrent_Socket_Rx_Address();
     RWB.B2 = 1;  // READ[0]/WRITE[1]
     OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
     OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
     SPI_FRAME_16();

}

void Write_Rx_Oneln(unsigned char Socket ,unsigned char Pointer[2] ,unsigned char Address0 ,unsigned char Address1){
     Current_Sck_Rx = Socket;
     Rx_write_Pointer(Pointer);
     Write_Rx(Address0,Address1);
}*/
/////////////////////////////////////////////////////////////////////////////