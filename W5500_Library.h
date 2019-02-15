/*
W5500 Ethernet Wizchip Module Library
Designed by: Vinicio Castillo
Rev. 1.0 (Release) 01/07/2019
*/

unsigned char DATA[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
unsigned short i;

#define Chip_Select PORTE.RB0
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

    //SPI FRAME

    Chip_Select = 0;

    // ADDRESS PHASE
    SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
    SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
    // CONTROL PHASE
    SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
    // DATA PHASE (N-BYTES)
    SPI1_Write(DATA[0]);     //DATA
    SPI1_Write(DATA[1]);     //DATA
    SPI1_Write(DATA[2]);     //DATA
    SPI1_Write(DATA[3]);     //DATA
    SPI1_Write(DATA[4]);     //DATA
    SPI1_Write(DATA[5]);     //DATA
    SPI1_Write(DATA[6]);     //DATA
    SPI1_Write(DATA[7]);     //DATA
    SPI1_Write(DATA[8]);     //DATA
    SPI1_Write(DATA[9]);     //DATA
    SPI1_Write(DATA[10]);    //DATA
    SPI1_Write(DATA[11]);    //DATA
    SPI1_Write(DATA[12]);    //DATA
    SPI1_Write(DATA[13]);    //DATA
    SPI1_Write(DATA[14]);    //DATA
    SPI1_Write(DATA[15]);    //DATA
    
    Chip_Select = 1;

    ADDRESS_PHASE_HB = 0x00;
    ADDRESS_PHASE_LB = 0x00;
    BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
    RWB  = 0x00;  // READ[0]/WRITE[1]
    OM = 0x00;
    for(i=0;i<16;i++){
       DATA[i] = 0x00;
    }
}

void SPI_FRAME() {     //FDM = 1

    BSB = BSB << 3;

    CONTROL_PHASE = BSB + RWB + OM;
    CONTROL_PHASE = BSB + CONTROL_PHASE;

    //SPI FRAME

    Chip_Select = 0;

    // ADDRESS PHASE
    SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
    SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
    // CONTROL PHASE
    SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
    // DATA PHASE (N-BYTES)
    SPI1_Write(DATA_PHASE_1B);    //DATA

    Chip_Select = 1;
    
    ADDRESS_PHASE_HB = 0x00;
    ADDRESS_PHASE_LB = 0x00;
    BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
    RWB  = 0x00;  // READ[0]/WRITE[1]
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

    //SPI FRAME

    Chip_Select = 0;

    // ADDRESS PHASE
    SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
    SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
    // CONTROL PHASE
    SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
    // DATA PHASE (N-BYTES)

    for(i=0;i<N;i++){ // SAVE RECIVED N-BYTES OF DATA
       SPI1_Write(DATA[i]);     //DATA
    }
    
    ADDRESS_PHASE_HB = 0x00;
    ADDRESS_PHASE_LB = 0x00;
    BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
    RWB  = 0x00;  // READ[0]/WRITE[1]
    OM = 0x00;
    for(i=0;i<N;i++){
       DATA[i] = 0x00;
    }
}

unsigned char SPI_FRAME_READ() {  //FDM = 1

    unsigned char MSG,buffer;

    RWB.B2 = 0;
    OM = 0x00;
    
    BSB = BSB << 3;

    CONTROL_PHASE = BSB + RWB + OM;
    CONTROL_PHASE = BSB + CONTROL_PHASE;

    //SPI FRAME

    Chip_Select = 0;

    // ADDRESS PHASE
    SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
    SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
    // CONTROL PHASE
    SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
    // DATA PHASE (N-BYTES)
    MSG = SPI1_Read(buffer);    //DATA

    Chip_Select = 1;

    ADDRESS_PHASE_HB = 0x00;
    ADDRESS_PHASE_LB = 0x00;
    BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
    RWB  = 0x00;  // READ[0]/WRITE[1]
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

    //SPI FRAME

    Chip_Select = 0;

    // ADDRESS PHASE
    SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
    SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
    // CONTROL PHASE
    SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
    // DATA PHASE (N-BYTES)

    for(i=0;i<N;i++){ // SAVE RECIVED N-BYTES OF DATA
       DATA[i] = SPI1_Read(buffer);
    }
    
    Chip_Select = 1;

    ADDRESS_PHASE_HB = 0x00;
    ADDRESS_PHASE_LB = 0x00;
    BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
    RWB  = 0x00;  // READ[0]/WRITE[1]
    OM = 0x00;
}

void SPI_FRAME_16_READ(){

    unsigned char buffer;

    BSB = BSB << 3;
    RWB.B2 = 0;
    OM = 0x00;
    CONTROL_PHASE = BSB + RWB + OM;
    CONTROL_PHASE = BSB + CONTROL_PHASE;

    //SPI FRAME

    Chip_Select = 0;

    // ADDRESS PHASE
    SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
    SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
    // CONTROL PHASE
    SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
    // DATA PHASE (16-BYTES)
    
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

    Chip_Select = 1;

    ADDRESS_PHASE_HB = 0x00;
    ADDRESS_PHASE_LB = 0x00;
    BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
    RWB  = 0x00;  // READ[0]/WRITE[1]
    OM = 0x00;
}

#include "Socket_Functions.h"
#include "Common_Registers_Functions.h"

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
      dmy = MODE; // Enable PING (MODE.B4 = 0;)
      dmy.B4 = 0;
      Mode(dmy);

}