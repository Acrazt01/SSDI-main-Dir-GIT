#line 1 "C:/Users/ELO-2019/Dropbox/SSDI Main Dir/SSDI_Program.c"
unsigned char IP[4] = {10,0,2,47};
unsigned char Gateway[4] = {10,0,0,1};
unsigned char Subnet_Mask[4] = {255,255,252,0};
unsigned char MAC[6] = {0x00, 0x14, 0xA3, 0x72, 0x17, 0x3f};
unsigned char SCKSZ[8] = {2,2,2,2,2,2,2,2};
unsigned short SckN = 0;
#line 1 "c:/users/elo-2019/dropbox/ssdi main dir/w5500_library.h"
#line 7 "c:/users/elo-2019/dropbox/ssdi main dir/w5500_library.h"
unsigned char DATA[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
unsigned short i;


unsigned char ADDRESS_PHASE_HB = 0;
unsigned char ADDRESS_PHASE_LB = 0;
unsigned char CONTROL_PHASE = 0;
unsigned char DATA_PHASE_1B = 0;
unsigned char BSB = 0;
unsigned char RWB = 0;
unsigned char OM = 0;

unsigned char dmy = 0x00;

void SPI_FRAME_16(){

 BSB = BSB << 3;
 OM = 0x00;
 CONTROL_PHASE = BSB + RWB + OM;
 CONTROL_PHASE = BSB + CONTROL_PHASE;



  PORTE.RB0  = 0;


 SPI1_Write(ADDRESS_PHASE_HB);
 SPI1_Write(ADDRESS_PHASE_LB);

 SPI1_Write(CONTROL_PHASE);

 SPI1_Write(DATA[0]);
 SPI1_Write(DATA[1]);
 SPI1_Write(DATA[2]);
 SPI1_Write(DATA[3]);
 SPI1_Write(DATA[4]);
 SPI1_Write(DATA[5]);
 SPI1_Write(DATA[6]);
 SPI1_Write(DATA[7]);
 SPI1_Write(DATA[8]);
 SPI1_Write(DATA[9]);
 SPI1_Write(DATA[10]);
 SPI1_Write(DATA[11]);
 SPI1_Write(DATA[12]);
 SPI1_Write(DATA[13]);
 SPI1_Write(DATA[14]);
 SPI1_Write(DATA[15]);

  PORTE.RB0  = 1;

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0b00000000;
 RWB = 0x00;
 OM = 0x00;
 for(i=0;i<16;i++){
 DATA[i] = 0x00;
 }
}

void SPI_FRAME() {

 BSB = BSB << 3;

 CONTROL_PHASE = BSB + RWB + OM;
 CONTROL_PHASE = BSB + CONTROL_PHASE;



  PORTE.RB0  = 0;


 SPI1_Write(ADDRESS_PHASE_HB);
 SPI1_Write(ADDRESS_PHASE_LB);

 SPI1_Write(CONTROL_PHASE);

 SPI1_Write(DATA_PHASE_1B);

  PORTE.RB0  = 1;

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0b00000000;
 RWB = 0x00;
 OM = 0x00;
 DATA_PHASE_1B = 0x00;
}

void SPI_FRAME_VDM(unsigned short N){

 unsigned char buffer;

 BSB = BSB << 3;
 RWB.B2 = 0;
 OM = 0x00;
 CONTROL_PHASE = BSB + RWB + OM;
 CONTROL_PHASE = BSB + CONTROL_PHASE;



  PORTE.RB0  = 0;


 SPI1_Write(ADDRESS_PHASE_HB);
 SPI1_Write(ADDRESS_PHASE_LB);

 SPI1_Write(CONTROL_PHASE);


 for(i=0;i<N;i++){
 SPI1_Write(DATA[i]);
 }

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0b00000000;
 RWB = 0x00;
 OM = 0x00;
 for(i=0;i<N;i++){
 DATA[i] = 0x00;
 }
}

unsigned char SPI_FRAME_READ() {

 unsigned char MSG,buffer;

 RWB.B2 = 0;
 OM = 0x00;

 BSB = BSB << 3;

 CONTROL_PHASE = BSB + RWB + OM;
 CONTROL_PHASE = BSB + CONTROL_PHASE;



  PORTE.RB0  = 0;


 SPI1_Write(ADDRESS_PHASE_HB);
 SPI1_Write(ADDRESS_PHASE_LB);

 SPI1_Write(CONTROL_PHASE);

 MSG = SPI1_Read(buffer);

  PORTE.RB0  = 1;

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0b00000000;
 RWB = 0x00;
 OM = 0x00;
 DATA_PHASE_1B = 0x00;

 return MSG;
}

void SPI_FRAME_VDM_READ(unsigned short N){

 unsigned char buffer;

 BSB = BSB << 3;
 RWB.B2 = 0;
 OM = 0x00;
 CONTROL_PHASE = BSB + RWB + OM;
 CONTROL_PHASE = BSB + CONTROL_PHASE;



  PORTE.RB0  = 0;


 SPI1_Write(ADDRESS_PHASE_HB);
 SPI1_Write(ADDRESS_PHASE_LB);

 SPI1_Write(CONTROL_PHASE);


 for(i=0;i<N;i++){
 DATA[i] = SPI1_Read(buffer);
 }

  PORTE.RB0  = 1;

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0b00000000;
 RWB = 0x00;
 OM = 0x00;
}

void SPI_FRAME_16_READ(){

 unsigned char buffer;

 BSB = BSB << 3;
 RWB.B2 = 0;
 OM = 0x00;
 CONTROL_PHASE = BSB + RWB + OM;
 CONTROL_PHASE = BSB + CONTROL_PHASE;



  PORTE.RB0  = 0;


 SPI1_Write(ADDRESS_PHASE_HB);
 SPI1_Write(ADDRESS_PHASE_LB);

 SPI1_Write(CONTROL_PHASE);


 DATA[0] = SPI1_Read(buffer);
 DATA[1] = SPI1_Read(buffer);
 DATA[2] = SPI1_Read(buffer);
 DATA[3] = SPI1_Read(buffer);
 DATA[4] = SPI1_Read(buffer);
 DATA[5] = SPI1_Read(buffer);
 DATA[6] = SPI1_Read(buffer);
 DATA[7] = SPI1_Read(buffer);
 DATA[8] = SPI1_Read(buffer);
 DATA[9] = SPI1_Read(buffer);
 DATA[10] = SPI1_Read(buffer);
 DATA[11] = SPI1_Read(buffer);
 DATA[12] = SPI1_Read(buffer);
 DATA[13] = SPI1_Read(buffer);
 DATA[14] = SPI1_Read(buffer);
 DATA[15] = SPI1_Read(buffer);

  PORTE.RB0  = 1;

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0b00000000;
 RWB = 0x00;
 OM = 0x00;
}
#line 1 "c:/users/elo-2019/dropbox/ssdi main dir/socket_functions.h"
#line 53 "c:/users/elo-2019/dropbox/ssdi main dir/socket_functions.h"
unsigned short Current_Sck_Register = 0;
unsigned short Current_Sck_Tx = 0;
unsigned short Current_Sck_Rx = 0;

struct Socket_Info {

 unsigned char Sck_Mode;
 unsigned char Sck_Cmd;
 unsigned char SPORT_Register_Address[2];
 unsigned char DMAC_Register_Address[6];
 unsigned char DIP_Register_Address[4];
 unsigned char DPORT_Register_Address[2];
 unsigned char Sck_MSSR[2];
 unsigned char Rx_Bf_Sz;
 unsigned char Tx_Bf_Sz;
 unsigned char Tx_Free_Sz[2];
 unsigned char Tx_R_Pointer[2];
 unsigned char Tx_W_Pointer[2];
 unsigned char Rcv_Data_Sz[2];
 unsigned char Rx_R_Pointer[2];
 unsigned char Rx_W_Pointer[2];
 unsigned char Sck_imr;

 } Socket[8];

unsigned char getCurrent_Socket_Rx_Address(){

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

unsigned char getCurrent_Socket_Tx_Address(){

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


unsigned char getCurrent_Socket_Register_Address(){

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


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = Address;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 0;
 OM.B1 = 0;
 OM.B2 = 0;

 return SPI_FRAME_READ();
}

void Sck_Mode(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}

void SckCMD(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x01;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}

void Source_PORT(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x04;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x05;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();

}

void Destination_MAC(unsigned char value[6]){

 unsigned char i;

 for(i=0x00;i<0x06;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x06 + i;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[i];
 SPI_FRAME();
 }

}

void Destination_IP(unsigned char value[4]){

 unsigned char i;

 for(i=0x00;i<0x04;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x0C + i;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[i];
 SPI_FRAME();
 }

}

void Destination_PORT(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x10;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x11;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();

}

void MSSR(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x12;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x13;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();

}

void TOS(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x15;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}

void TTL(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x16;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}

void Set_Rx_Buffer_Sz(unsigned char value){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1E;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;;
 SPI_FRAME();
}

void Set_Tx_Buffer_Sz(unsigned char value){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1F;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();
}

void Tx_write_Pointer(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x24;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x25;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();

}

void Rx_Read_Pointer(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x28;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x29;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();

}

void Sck_INT_Mask(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x2C;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void Sck_FRAG(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x2D;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x2E;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();

 }

void Sck_KPALVTR(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x2F;
 BSB = getCurrent_Socket_Register_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}




void Write_Tx(unsigned char Address0, unsigned char Address1){


 ADDRESS_PHASE_HB = Address0;
 ADDRESS_PHASE_LB = Address1;
 BSB = getCurrent_Socket_Tx_Address();
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 SPI_FRAME_16();

}

void Write_Tx_Oneln(unsigned char Socket ,unsigned char Pointer[2] ,unsigned char Address0 ,unsigned char Address1){
 Current_Sck_Tx = Socket;
 Tx_write_Pointer(Pointer);
 Write_Tx(Address0,Address1);
}
#line 488 "c:/users/elo-2019/dropbox/ssdi main dir/socket_functions.h"
void Read_Rx(unsigned char Address0, unsigned char Address1){


 ADDRESS_PHASE_HB = Address0;
 ADDRESS_PHASE_LB = Address1;
 BSB = getCurrent_Socket_Rx_Address();
 RWB.B2 = 0;
 OM.B1 = 0;
 OM.B2 = 0;
 SPI_FRAME_16_READ();

}

void Read_Rx_Oneln(unsigned char Socket ,unsigned char Address0 ,unsigned char Address1){
 Current_Sck_Rx = Socket;
 Read_Rx(Address0,Address1);
}
#line 1 "c:/users/elo-2019/dropbox/ssdi main dir/common_registers_functions.h"
#line 51 "c:/users/elo-2019/dropbox/ssdi main dir/common_registers_functions.h"
unsigned short Read_Common_Register(unsigned short Address){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = Address;
 BSB = 0x00;
 RWB.B2 = 0;
 OM.B1 = 0;
 OM.B2 = 0;

 return SPI_FRAME_READ();
}


void Mode(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x00;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}

void Config_Gateway(){

 unsigned short i;

 for(i=0x00;i<0x04;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x01 + i;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = Gateway[i];
 SPI_FRAME();
 }

}

void Config_Subnet(){

 unsigned short i;

 for(i=0x00;i<0x04;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x05 + i;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = Subnet_Mask[i];
 SPI_FRAME();
 }

}

void Config_MAC(){

 unsigned short i;

 for(i=0x00;i<0x06;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x09 + i;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = MAC[i];
 SPI_FRAME();
 }

}

void Config_IP(){

 unsigned char i;

 for(i=0x00;i<0x04;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x0F + i;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = IP[i];
 SPI_FRAME();
 }

}

void INTLEVEL(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x13;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x14;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();


}

void IR(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x15;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void IMR(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x16;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void Sck_Interrupts(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x17;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void Sck_Interrupts_Mask(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x18;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void Retry_Time(unsigned char value[2]){



 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x19;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1A;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();


}

void Retry_Count(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1B;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void PTIMER_W(unsigned char value){




 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1C;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void PMAGIC_W(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1D;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

 }

void PHAR(unsigned char value[6]){

 unsigned char i;

 for(i=0x00;i<0x06;i++){

 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x1E + i;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[i];
 SPI_FRAME();
 }

}

void PSID(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x24;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x25;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();


}

void PMRU(unsigned char value[2]){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x26;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[0];
 SPI_FRAME();


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x27;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value[1];
 SPI_FRAME();


}

void PHY_Config(unsigned char value){


 ADDRESS_PHASE_HB = 0x00;
 ADDRESS_PHASE_LB = 0x2E;
 BSB = 0x00;
 RWB.B2 = 1;
 OM.B1 = 0;
 OM.B2 = 0;
 DATA_PHASE_1B = value;
 SPI_FRAME();

}
#line 251 "c:/users/elo-2019/dropbox/ssdi main dir/w5500_library.h"
void Config_Bfs_Sz(){

 for(i=0x00;i<0x08;i++){
 Current_Sck_Register = i;
 Set_Tx_Buffer_Sz(SCKSZ[i]);
 Set_Rx_Buffer_Sz(SCKSZ[i]);
 }

}

void W5500_Init(){

 Config_IP();
 Config_Subnet();
 Config_MAC();
 Config_Gateway();
 Config_Bfs_Sz();
 dmy =  Read_Common_Register(0x00) ;
 dmy.B4 = 0;
 Mode(dmy);

}
#line 12 "C:/Users/ELO-2019/Dropbox/SSDI Main Dir/SSDI_Program.c"
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
  PORTE.RB0  = 1;
 delay_us(100);

  PORTB.RB0 = 1 ;
 Delay_ms(100);
  PORTB.RB0 = 0 ;
 Delay_ms(100);
  PORTB.RB0 = 1 ;
 Delay_ms(100);
  PORTB.RB0 = 0 ;
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
 Socket[SckN].Sck_Cmd =  0x01 ;
 Socket[SckN].SPORT_Register_Address[0] = 0x27;
 Socket[SckN].SPORT_Register_Address[1] = 0x11;
 Socket[SckN].DMAC_Register_Address[0] = 0x90;
 Socket[SckN].DMAC_Register_Address[1] = 0xB1;
 Socket[SckN].DMAC_Register_Address[2] = 0x1C;
 Socket[SckN].DMAC_Register_Address[3] = 0x94;
 Socket[SckN].DMAC_Register_Address[4] = 0x88;
 Socket[SckN].DMAC_Register_Address[5] = 0x05;
 Socket[SckN].DIP_Register_Address[0] = 10;
 Socket[SckN].DIP_Register_Address[1] = 0;
 Socket[SckN].DIP_Register_Address[2] = 2;
 Socket[SckN].DIP_Register_Address[3] = 3;
 Socket[SckN].DPORT_Register_Address[0] = 0x27;
 Socket[SckN].DPORT_Register_Address[1] = 0x11;
 Socket[SckN].Rx_Bf_Sz = 2;
 Socket[SckN].Tx_Bf_Sz = 2;

 Destination_MAC(Socket[SckN].DMAC_Register_Address);
 Destination_IP(Socket[SckN].DIP_Register_Address);
 Destination_PORT(Socket[SckN].DPORT_Register_Address);

 Sck_Mode(Socket[SckN].Sck_Mode);
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


 if( Read_Sck_Register(0x03)  == 0x22){
 PORTD.B7 = 1;
 while(1){
 PORTD.B6 = 1;

 PORTD.B5 = 1;

 SckCMD( 0x21 );

 PORTD.B4 = 1;
 SckCMD( 0x10 );
 PORTB = 0xFF;
 delay_ms(250);
 PORTB = 0x00;
 delay_ms(250);
 PORTB = 0xFF;
 delay_ms(250);
 PORTB = 0x00;
 delay_ms(250);

 PORTD.B3 = 1;
 SckCMD( 0x01 );
 delay_ms(1);

 }
 }

}

void main() {

 init();
 UDP();
#line 155 "C:/Users/ELO-2019/Dropbox/SSDI Main Dir/SSDI_Program.c"
 }
