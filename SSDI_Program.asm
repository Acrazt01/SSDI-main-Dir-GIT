
_SPI_FRAME_16:

;w5500_library.h,21 :: 		void SPI_FRAME_16(){
;w5500_library.h,23 :: 		BSB = BSB << 3;
	MOVF        _BSB+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _BSB+0 
;w5500_library.h,24 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,25 :: 		CONTROL_PHASE = BSB + RWB + OM;
	MOVF        _RWB+0, 0 
	ADDWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,26 :: 		CONTROL_PHASE = BSB + CONTROL_PHASE;
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,30 :: 		Chip_Select = 0;
	BCF         PORTE+0, 0 
;w5500_library.h,33 :: 		SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_HB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,34 :: 		SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_LB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,36 :: 		SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
	MOVF        _CONTROL_PHASE+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,38 :: 		SPI1_Write(DATA[0]);     //DATA
	MOVF        _DATA+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,39 :: 		SPI1_Write(DATA[1]);     //DATA
	MOVF        _DATA+1, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,40 :: 		SPI1_Write(DATA[2]);     //DATA
	MOVF        _DATA+2, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,41 :: 		SPI1_Write(DATA[3]);     //DATA
	MOVF        _DATA+3, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,42 :: 		SPI1_Write(DATA[4]);     //DATA
	MOVF        _DATA+4, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,43 :: 		SPI1_Write(DATA[5]);     //DATA
	MOVF        _DATA+5, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,44 :: 		SPI1_Write(DATA[6]);     //DATA
	MOVF        _DATA+6, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,45 :: 		SPI1_Write(DATA[7]);     //DATA
	MOVF        _DATA+7, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,46 :: 		SPI1_Write(DATA[8]);     //DATA
	MOVF        _DATA+8, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,47 :: 		SPI1_Write(DATA[9]);     //DATA
	MOVF        _DATA+9, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,48 :: 		SPI1_Write(DATA[10]);    //DATA
	MOVF        _DATA+10, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,49 :: 		SPI1_Write(DATA[11]);    //DATA
	MOVF        _DATA+11, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,50 :: 		SPI1_Write(DATA[12]);    //DATA
	MOVF        _DATA+12, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,51 :: 		SPI1_Write(DATA[13]);    //DATA
	MOVF        _DATA+13, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,52 :: 		SPI1_Write(DATA[14]);    //DATA
	MOVF        _DATA+14, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,53 :: 		SPI1_Write(DATA[15]);    //DATA
	MOVF        _DATA+15, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,55 :: 		Chip_Select = 1;
	BSF         PORTE+0, 0 
;w5500_library.h,57 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;w5500_library.h,58 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;w5500_library.h,59 :: 		BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;w5500_library.h,60 :: 		RWB  = 0x00;  // READ[0]/WRITE[1]
	CLRF        _RWB+0 
;w5500_library.h,61 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,62 :: 		for(i=0;i<16;i++){
	CLRF        _i+0 
L_SPI_FRAME_160:
	MOVLW       16
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SPI_FRAME_161
;w5500_library.h,63 :: 		DATA[i] = 0x00;
	MOVLW       _DATA+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_DATA+0)
	MOVWF       FSR1H 
	MOVF        _i+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;w5500_library.h,62 :: 		for(i=0;i<16;i++){
	INCF        _i+0, 1 
;w5500_library.h,64 :: 		}
	GOTO        L_SPI_FRAME_160
L_SPI_FRAME_161:
;w5500_library.h,65 :: 		}
L_end_SPI_FRAME_16:
	RETURN      0
; end of _SPI_FRAME_16

_SPI_FRAME:

;w5500_library.h,67 :: 		void SPI_FRAME() {     //FDM = 1
;w5500_library.h,69 :: 		BSB = BSB << 3;
	MOVF        _BSB+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _BSB+0 
;w5500_library.h,71 :: 		CONTROL_PHASE = BSB + RWB + OM;
	MOVF        _RWB+0, 0 
	ADDWF       R1, 0 
	MOVWF       R0 
	MOVF        _OM+0, 0 
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,72 :: 		CONTROL_PHASE = BSB + CONTROL_PHASE;
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,76 :: 		Chip_Select = 0;
	BCF         PORTE+0, 0 
;w5500_library.h,79 :: 		SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_HB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,80 :: 		SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_LB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,82 :: 		SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
	MOVF        _CONTROL_PHASE+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,84 :: 		SPI1_Write(DATA_PHASE_1B);    //DATA
	MOVF        _DATA_PHASE_1B+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,86 :: 		Chip_Select = 1;
	BSF         PORTE+0, 0 
;w5500_library.h,88 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;w5500_library.h,89 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;w5500_library.h,90 :: 		BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;w5500_library.h,91 :: 		RWB  = 0x00;  // READ[0]/WRITE[1]
	CLRF        _RWB+0 
;w5500_library.h,92 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,93 :: 		DATA_PHASE_1B = 0x00;
	CLRF        _DATA_PHASE_1B+0 
;w5500_library.h,94 :: 		}
L_end_SPI_FRAME:
	RETURN      0
; end of _SPI_FRAME

_SPI_FRAME_VDM:

;w5500_library.h,96 :: 		void SPI_FRAME_VDM(unsigned short N){
;w5500_library.h,100 :: 		BSB = BSB << 3;
	MOVF        _BSB+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _BSB+0 
;w5500_library.h,101 :: 		RWB.B2 = 0;
	BCF         _RWB+0, 2 
;w5500_library.h,102 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,103 :: 		CONTROL_PHASE = BSB + RWB + OM;
	MOVF        _RWB+0, 0 
	ADDWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,104 :: 		CONTROL_PHASE = BSB + CONTROL_PHASE;
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,108 :: 		Chip_Select = 0;
	BCF         PORTE+0, 0 
;w5500_library.h,111 :: 		SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_HB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,112 :: 		SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_LB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,114 :: 		SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
	MOVF        _CONTROL_PHASE+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,117 :: 		for(i=0;i<N;i++){ // SAVE RECIVED N-BYTES OF DATA
	CLRF        _i+0 
L_SPI_FRAME_VDM3:
	MOVF        FARG_SPI_FRAME_VDM_N+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SPI_FRAME_VDM4
;w5500_library.h,118 :: 		SPI1_Write(DATA[i]);     //DATA
	MOVLW       _DATA+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_DATA+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,117 :: 		for(i=0;i<N;i++){ // SAVE RECIVED N-BYTES OF DATA
	INCF        _i+0, 1 
;w5500_library.h,119 :: 		}
	GOTO        L_SPI_FRAME_VDM3
L_SPI_FRAME_VDM4:
;w5500_library.h,121 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;w5500_library.h,122 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;w5500_library.h,123 :: 		BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;w5500_library.h,124 :: 		RWB  = 0x00;  // READ[0]/WRITE[1]
	CLRF        _RWB+0 
;w5500_library.h,125 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,126 :: 		for(i=0;i<N;i++){
	CLRF        _i+0 
L_SPI_FRAME_VDM6:
	MOVF        FARG_SPI_FRAME_VDM_N+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SPI_FRAME_VDM7
;w5500_library.h,127 :: 		DATA[i] = 0x00;
	MOVLW       _DATA+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_DATA+0)
	MOVWF       FSR1H 
	MOVF        _i+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;w5500_library.h,126 :: 		for(i=0;i<N;i++){
	INCF        _i+0, 1 
;w5500_library.h,128 :: 		}
	GOTO        L_SPI_FRAME_VDM6
L_SPI_FRAME_VDM7:
;w5500_library.h,129 :: 		}
L_end_SPI_FRAME_VDM:
	RETURN      0
; end of _SPI_FRAME_VDM

_SPI_FRAME_READ:

;w5500_library.h,131 :: 		unsigned char SPI_FRAME_READ() {  //FDM = 1
;w5500_library.h,135 :: 		RWB.B2 = 0;
	BCF         _RWB+0, 2 
;w5500_library.h,136 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,138 :: 		BSB = BSB << 3;
	MOVF        _BSB+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _BSB+0 
;w5500_library.h,140 :: 		CONTROL_PHASE = BSB + RWB + OM;
	MOVF        _RWB+0, 0 
	ADDWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,141 :: 		CONTROL_PHASE = BSB + CONTROL_PHASE;
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,145 :: 		Chip_Select = 0;
	BCF         PORTE+0, 0 
;w5500_library.h,148 :: 		SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_HB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,149 :: 		SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_LB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,151 :: 		SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
	MOVF        _CONTROL_PHASE+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,153 :: 		MSG = SPI1_Read(buffer);    //DATA
	MOVF        SPI_FRAME_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
;w5500_library.h,155 :: 		Chip_Select = 1;
	BSF         PORTE+0, 0 
;w5500_library.h,157 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;w5500_library.h,158 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;w5500_library.h,159 :: 		BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;w5500_library.h,160 :: 		RWB  = 0x00;  // READ[0]/WRITE[1]
	CLRF        _RWB+0 
;w5500_library.h,161 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,162 :: 		DATA_PHASE_1B = 0x00;
	CLRF        _DATA_PHASE_1B+0 
;w5500_library.h,164 :: 		return MSG;
;w5500_library.h,165 :: 		}
L_end_SPI_FRAME_READ:
	RETURN      0
; end of _SPI_FRAME_READ

_SPI_FRAME_VDM_READ:

;w5500_library.h,167 :: 		void SPI_FRAME_VDM_READ(unsigned short N){
;w5500_library.h,171 :: 		BSB = BSB << 3;
	MOVF        _BSB+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _BSB+0 
;w5500_library.h,172 :: 		RWB.B2 = 0;
	BCF         _RWB+0, 2 
;w5500_library.h,173 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,174 :: 		CONTROL_PHASE = BSB + RWB + OM;
	MOVF        _RWB+0, 0 
	ADDWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,175 :: 		CONTROL_PHASE = BSB + CONTROL_PHASE;
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,179 :: 		Chip_Select = 0;
	BCF         PORTE+0, 0 
;w5500_library.h,182 :: 		SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_HB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,183 :: 		SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_LB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,185 :: 		SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
	MOVF        _CONTROL_PHASE+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,188 :: 		for(i=0;i<N;i++){ // SAVE RECIVED N-BYTES OF DATA
	CLRF        _i+0 
L_SPI_FRAME_VDM_READ9:
	MOVF        FARG_SPI_FRAME_VDM_READ_N+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SPI_FRAME_VDM_READ10
;w5500_library.h,189 :: 		DATA[i] = SPI1_Read(buffer);
	MOVLW       _DATA+0
	MOVWF       FLOC__SPI_FRAME_VDM_READ+0 
	MOVLW       hi_addr(_DATA+0)
	MOVWF       FLOC__SPI_FRAME_VDM_READ+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__SPI_FRAME_VDM_READ+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__SPI_FRAME_VDM_READ+1, 1 
	MOVF        SPI_FRAME_VDM_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__SPI_FRAME_VDM_READ+0, FSR1
	MOVFF       FLOC__SPI_FRAME_VDM_READ+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;w5500_library.h,188 :: 		for(i=0;i<N;i++){ // SAVE RECIVED N-BYTES OF DATA
	INCF        _i+0, 1 
;w5500_library.h,190 :: 		}
	GOTO        L_SPI_FRAME_VDM_READ9
L_SPI_FRAME_VDM_READ10:
;w5500_library.h,192 :: 		Chip_Select = 1;
	BSF         PORTE+0, 0 
;w5500_library.h,194 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;w5500_library.h,195 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;w5500_library.h,196 :: 		BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;w5500_library.h,197 :: 		RWB  = 0x00;  // READ[0]/WRITE[1]
	CLRF        _RWB+0 
;w5500_library.h,198 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,199 :: 		}
L_end_SPI_FRAME_VDM_READ:
	RETURN      0
; end of _SPI_FRAME_VDM_READ

_SPI_FRAME_16_READ:

;w5500_library.h,201 :: 		void SPI_FRAME_16_READ(){
;w5500_library.h,205 :: 		BSB = BSB << 3;
	MOVF        _BSB+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _BSB+0 
;w5500_library.h,206 :: 		RWB.B2 = 0;
	BCF         _RWB+0, 2 
;w5500_library.h,207 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,208 :: 		CONTROL_PHASE = BSB + RWB + OM;
	MOVF        _RWB+0, 0 
	ADDWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,209 :: 		CONTROL_PHASE = BSB + CONTROL_PHASE;
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       _CONTROL_PHASE+0 
;w5500_library.h,213 :: 		Chip_Select = 0;
	BCF         PORTE+0, 0 
;w5500_library.h,216 :: 		SPI1_Write(ADDRESS_PHASE_HB); //HIGH-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_HB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,217 :: 		SPI1_Write(ADDRESS_PHASE_LB); //LOW-BYTE OF 16 BITS OFFSET ADDRESS
	MOVF        _ADDRESS_PHASE_LB+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,219 :: 		SPI1_Write(CONTROL_PHASE);    //CONFIG READ/WRITE, SPI OPERATION MODE
	MOVF        _CONTROL_PHASE+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;w5500_library.h,222 :: 		DATA[0] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+0 
;w5500_library.h,223 :: 		DATA[1] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+1 
;w5500_library.h,224 :: 		DATA[2] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+2 
;w5500_library.h,225 :: 		DATA[3] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+3 
;w5500_library.h,226 :: 		DATA[4] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+4 
;w5500_library.h,227 :: 		DATA[5] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+5 
;w5500_library.h,228 :: 		DATA[6] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+6 
;w5500_library.h,229 :: 		DATA[7] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+7 
;w5500_library.h,230 :: 		DATA[8] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+8 
;w5500_library.h,231 :: 		DATA[9] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+9 
;w5500_library.h,232 :: 		DATA[10] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+10 
;w5500_library.h,233 :: 		DATA[11] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+11 
;w5500_library.h,234 :: 		DATA[12] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+12 
;w5500_library.h,235 :: 		DATA[13] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+13 
;w5500_library.h,236 :: 		DATA[14] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+14 
;w5500_library.h,237 :: 		DATA[15] = SPI1_Read(buffer);
	MOVF        SPI_FRAME_16_READ_buffer_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _DATA+15 
;w5500_library.h,239 :: 		Chip_Select = 1;
	BSF         PORTE+0, 0 
;w5500_library.h,241 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;w5500_library.h,242 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;w5500_library.h,243 :: 		BSB = 0b00000000;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;w5500_library.h,244 :: 		RWB  = 0x00;  // READ[0]/WRITE[1]
	CLRF        _RWB+0 
;w5500_library.h,245 :: 		OM = 0x00;
	CLRF        _OM+0 
;w5500_library.h,246 :: 		}
L_end_SPI_FRAME_16_READ:
	RETURN      0
; end of _SPI_FRAME_16_READ

_getCurrent_Socket_Rx_Address:

;socket_functions.h,78 :: 		unsigned char getCurrent_Socket_Rx_Address(){     //Choose correct BSB configuration
;socket_functions.h,82 :: 		switch (Current_Sck_Rx) {
	GOTO        L_getCurrent_Socket_Rx_Address12
;socket_functions.h,84 :: 		case 0: Result = 0b00000011; break;
L_getCurrent_Socket_Rx_Address14:
	MOVLW       3
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,85 :: 		case 1: Result = 0b00000111; break;
L_getCurrent_Socket_Rx_Address15:
	MOVLW       7
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,86 :: 		case 2: Result = 0b00001011; break;
L_getCurrent_Socket_Rx_Address16:
	MOVLW       11
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,87 :: 		case 3: Result = 0b00001111; break;
L_getCurrent_Socket_Rx_Address17:
	MOVLW       15
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,88 :: 		case 4: Result = 0b00010011; break;
L_getCurrent_Socket_Rx_Address18:
	MOVLW       19
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,89 :: 		case 5: Result = 0b00010111; break;
L_getCurrent_Socket_Rx_Address19:
	MOVLW       23
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,90 :: 		case 6: Result = 0b00011011; break;
L_getCurrent_Socket_Rx_Address20:
	MOVLW       27
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,91 :: 		case 7: Result = 0b00011111; break;
L_getCurrent_Socket_Rx_Address21:
	MOVLW       31
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Rx_Address13
;socket_functions.h,92 :: 		default: Result = 0b00000011;
L_getCurrent_Socket_Rx_Address22:
	MOVLW       3
	MOVWF       R1 
;socket_functions.h,94 :: 		}
	GOTO        L_getCurrent_Socket_Rx_Address13
L_getCurrent_Socket_Rx_Address12:
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address14
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address15
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address16
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address17
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address18
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address19
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address20
	MOVF        _Current_Sck_Rx+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Rx_Address21
	GOTO        L_getCurrent_Socket_Rx_Address22
L_getCurrent_Socket_Rx_Address13:
;socket_functions.h,96 :: 		return Result;
	MOVF        R1, 0 
	MOVWF       R0 
;socket_functions.h,97 :: 		}
L_end_getCurrent_Socket_Rx_Address:
	RETURN      0
; end of _getCurrent_Socket_Rx_Address

_getCurrent_Socket_Tx_Address:

;socket_functions.h,99 :: 		unsigned char getCurrent_Socket_Tx_Address(){     //Choose correct BSB configuration
;socket_functions.h,103 :: 		switch (Current_Sck_Tx) {
	GOTO        L_getCurrent_Socket_Tx_Address23
;socket_functions.h,105 :: 		case 0: Result = 0b00000010; break;
L_getCurrent_Socket_Tx_Address25:
	MOVLW       2
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,106 :: 		case 1: Result = 0b00000110; break;
L_getCurrent_Socket_Tx_Address26:
	MOVLW       6
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,107 :: 		case 2: Result = 0b00001010; break;
L_getCurrent_Socket_Tx_Address27:
	MOVLW       10
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,108 :: 		case 3: Result = 0b00001110; break;
L_getCurrent_Socket_Tx_Address28:
	MOVLW       14
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,109 :: 		case 4: Result = 0b00010010; break;
L_getCurrent_Socket_Tx_Address29:
	MOVLW       18
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,110 :: 		case 5: Result = 0b00010110; break;
L_getCurrent_Socket_Tx_Address30:
	MOVLW       22
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,111 :: 		case 6: Result = 0b00011010; break;
L_getCurrent_Socket_Tx_Address31:
	MOVLW       26
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,112 :: 		case 7: Result = 0b00011110; break;
L_getCurrent_Socket_Tx_Address32:
	MOVLW       30
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Tx_Address24
;socket_functions.h,113 :: 		default: Result = 0b00000010;
L_getCurrent_Socket_Tx_Address33:
	MOVLW       2
	MOVWF       R1 
;socket_functions.h,115 :: 		}
	GOTO        L_getCurrent_Socket_Tx_Address24
L_getCurrent_Socket_Tx_Address23:
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address25
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address26
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address27
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address28
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address29
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address30
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address31
	MOVF        _Current_Sck_Tx+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Tx_Address32
	GOTO        L_getCurrent_Socket_Tx_Address33
L_getCurrent_Socket_Tx_Address24:
;socket_functions.h,117 :: 		return Result;
	MOVF        R1, 0 
	MOVWF       R0 
;socket_functions.h,118 :: 		}
L_end_getCurrent_Socket_Tx_Address:
	RETURN      0
; end of _getCurrent_Socket_Tx_Address

_getCurrent_Socket_Register_Address:

;socket_functions.h,121 :: 		unsigned char getCurrent_Socket_Register_Address(){     //Choose correct BSB configuration
;socket_functions.h,125 :: 		switch (Current_Sck_Register) {
	GOTO        L_getCurrent_Socket_Register_Address34
;socket_functions.h,127 :: 		case 0: Result = 0b00000001; break;
L_getCurrent_Socket_Register_Address36:
	MOVLW       1
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,128 :: 		case 1: Result = 0b00000101; break;
L_getCurrent_Socket_Register_Address37:
	MOVLW       5
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,129 :: 		case 2: Result = 0b00001001; break;
L_getCurrent_Socket_Register_Address38:
	MOVLW       9
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,130 :: 		case 3: Result = 0b00001101; break;
L_getCurrent_Socket_Register_Address39:
	MOVLW       13
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,131 :: 		case 4: Result = 0b00010001; break;
L_getCurrent_Socket_Register_Address40:
	MOVLW       17
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,132 :: 		case 5: Result = 0b00010110; break;
L_getCurrent_Socket_Register_Address41:
	MOVLW       22
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,133 :: 		case 6: Result = 0b00011001; break;
L_getCurrent_Socket_Register_Address42:
	MOVLW       25
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,134 :: 		case 7: Result = 0b00011101; break;
L_getCurrent_Socket_Register_Address43:
	MOVLW       29
	MOVWF       R1 
	GOTO        L_getCurrent_Socket_Register_Address35
;socket_functions.h,135 :: 		default: Result = 0b00000001;
L_getCurrent_Socket_Register_Address44:
	MOVLW       1
	MOVWF       R1 
;socket_functions.h,137 :: 		}
	GOTO        L_getCurrent_Socket_Register_Address35
L_getCurrent_Socket_Register_Address34:
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address36
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address37
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address38
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address39
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address40
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address41
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address42
	MOVF        _Current_Sck_Register+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_getCurrent_Socket_Register_Address43
	GOTO        L_getCurrent_Socket_Register_Address44
L_getCurrent_Socket_Register_Address35:
;socket_functions.h,139 :: 		return Result;
	MOVF        R1, 0 
	MOVWF       R0 
;socket_functions.h,140 :: 		}
L_end_getCurrent_Socket_Register_Address:
	RETURN      0
; end of _getCurrent_Socket_Register_Address

_Read_Sck_Register:

;socket_functions.h,142 :: 		unsigned short Read_Sck_Register(unsigned short Address){
;socket_functions.h,145 :: 		ADDRESS_PHASE_HB = 0x00;   //
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,146 :: 		ADDRESS_PHASE_LB = Address;
	MOVF        FARG_Read_Sck_Register_Address+0, 0 
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,147 :: 		BSB = getCurrent_Socket_Register_Address();  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,148 :: 		RWB.B2 = 0;  // READ[0]/WRITE[1]
	BCF         _RWB+0, 2 
;socket_functions.h,149 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,150 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,152 :: 		return SPI_FRAME_READ();
	CALL        _SPI_FRAME_READ+0, 0
;socket_functions.h,153 :: 		}
L_end_Read_Sck_Register:
	RETURN      0
; end of _Read_Sck_Register

_Sck_Mode:

;socket_functions.h,155 :: 		void Sck_Mode(unsigned char value){
;socket_functions.h,158 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,159 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;socket_functions.h,160 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,161 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,162 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,163 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,164 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Sck_Mode_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,165 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,167 :: 		}
L_end_Sck_Mode:
	RETURN      0
; end of _Sck_Mode

_SckCMD:

;socket_functions.h,169 :: 		void SckCMD(unsigned char value){
;socket_functions.h,172 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,173 :: 		ADDRESS_PHASE_LB = 0x01;
	MOVLW       1
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,174 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,175 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,176 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,177 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,178 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_SckCMD_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,179 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,181 :: 		}
L_end_SckCMD:
	RETURN      0
; end of _SckCMD

_Source_PORT:

;socket_functions.h,183 :: 		void Source_PORT(unsigned char value[2]){
;socket_functions.h,186 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,187 :: 		ADDRESS_PHASE_LB = 0x04;
	MOVLW       4
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,188 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,189 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,190 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,191 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,192 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Source_PORT_value+0, FSR0
	MOVFF       FARG_Source_PORT_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,193 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,196 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,197 :: 		ADDRESS_PHASE_LB = 0x05;
	MOVLW       5
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,198 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,199 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,200 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,201 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,202 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_Source_PORT_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Source_PORT_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,203 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,205 :: 		}
L_end_Source_PORT:
	RETURN      0
; end of _Source_PORT

_Destination_MAC:

;socket_functions.h,207 :: 		void Destination_MAC(unsigned char value[6]){
;socket_functions.h,211 :: 		for(i=0x00;i<0x06;i++){
	CLRF        Destination_MAC_i_L0+0 
L_Destination_MAC45:
	MOVLW       6
	SUBWF       Destination_MAC_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Destination_MAC46
;socket_functions.h,213 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,214 :: 		ADDRESS_PHASE_LB = 0x06 + i;
	MOVF        Destination_MAC_i_L0+0, 0 
	ADDLW       6
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,215 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,216 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,217 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,218 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,219 :: 		DATA_PHASE_1B = value[i];
	MOVF        Destination_MAC_i_L0+0, 0 
	ADDWF       FARG_Destination_MAC_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Destination_MAC_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,220 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,211 :: 		for(i=0x00;i<0x06;i++){
	INCF        Destination_MAC_i_L0+0, 1 
;socket_functions.h,221 :: 		}
	GOTO        L_Destination_MAC45
L_Destination_MAC46:
;socket_functions.h,223 :: 		}
L_end_Destination_MAC:
	RETURN      0
; end of _Destination_MAC

_Destination_IP:

;socket_functions.h,225 :: 		void Destination_IP(unsigned char value[4]){
;socket_functions.h,229 :: 		for(i=0x00;i<0x04;i++){
	CLRF        Destination_IP_i_L0+0 
L_Destination_IP48:
	MOVLW       4
	SUBWF       Destination_IP_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Destination_IP49
;socket_functions.h,231 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,232 :: 		ADDRESS_PHASE_LB = 0x0C + i;
	MOVF        Destination_IP_i_L0+0, 0 
	ADDLW       12
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,233 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,234 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,235 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,236 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,237 :: 		DATA_PHASE_1B = value[i];
	MOVF        Destination_IP_i_L0+0, 0 
	ADDWF       FARG_Destination_IP_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Destination_IP_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,238 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,229 :: 		for(i=0x00;i<0x04;i++){
	INCF        Destination_IP_i_L0+0, 1 
;socket_functions.h,239 :: 		}
	GOTO        L_Destination_IP48
L_Destination_IP49:
;socket_functions.h,241 :: 		}
L_end_Destination_IP:
	RETURN      0
; end of _Destination_IP

_Destination_PORT:

;socket_functions.h,243 :: 		void Destination_PORT(unsigned char value[2]){
;socket_functions.h,246 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,247 :: 		ADDRESS_PHASE_LB = 0x10;
	MOVLW       16
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,248 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,249 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,250 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,251 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,252 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Destination_PORT_value+0, FSR0
	MOVFF       FARG_Destination_PORT_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,253 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,256 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,257 :: 		ADDRESS_PHASE_LB = 0x11;
	MOVLW       17
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,258 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,259 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,260 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,261 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,262 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_Destination_PORT_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Destination_PORT_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,263 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,265 :: 		}
L_end_Destination_PORT:
	RETURN      0
; end of _Destination_PORT

_MSSR:

;socket_functions.h,267 :: 		void MSSR(unsigned char value[2]){
;socket_functions.h,270 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,271 :: 		ADDRESS_PHASE_LB = 0x12;
	MOVLW       18
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,272 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,273 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,274 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,275 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,276 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_MSSR_value+0, FSR0
	MOVFF       FARG_MSSR_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,277 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,280 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,281 :: 		ADDRESS_PHASE_LB = 0x13;
	MOVLW       19
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,282 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,283 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,284 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,285 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,286 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_MSSR_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_MSSR_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,287 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,289 :: 		}
L_end_MSSR:
	RETURN      0
; end of _MSSR

_TOS:

;socket_functions.h,291 :: 		void TOS(unsigned char value){
;socket_functions.h,294 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,295 :: 		ADDRESS_PHASE_LB = 0x15;
	MOVLW       21
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,296 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,297 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,298 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,299 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,300 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_TOS_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,301 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,303 :: 		}
L_end_TOS:
	RETURN      0
; end of _TOS

_TTL:

;socket_functions.h,305 :: 		void TTL(unsigned char value){
;socket_functions.h,308 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,309 :: 		ADDRESS_PHASE_LB = 0x16;
	MOVLW       22
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,310 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,311 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,312 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,313 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,314 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_TTL_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,315 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,317 :: 		}
L_end_TTL:
	RETURN      0
; end of _TTL

_Set_Rx_Buffer_Sz:

;socket_functions.h,319 :: 		void Set_Rx_Buffer_Sz(unsigned char value){
;socket_functions.h,321 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,322 :: 		ADDRESS_PHASE_LB = 0x1E;
	MOVLW       30
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,323 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,324 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,325 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,326 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,327 :: 		DATA_PHASE_1B = value;;
	MOVF        FARG_Set_Rx_Buffer_Sz_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,328 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,329 :: 		}
L_end_Set_Rx_Buffer_Sz:
	RETURN      0
; end of _Set_Rx_Buffer_Sz

_Set_Tx_Buffer_Sz:

;socket_functions.h,331 :: 		void Set_Tx_Buffer_Sz(unsigned char value){
;socket_functions.h,333 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,334 :: 		ADDRESS_PHASE_LB = 0x1F;
	MOVLW       31
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,335 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,336 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,337 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,338 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,339 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Set_Tx_Buffer_Sz_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,340 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,341 :: 		}
L_end_Set_Tx_Buffer_Sz:
	RETURN      0
; end of _Set_Tx_Buffer_Sz

_Tx_write_Pointer:

;socket_functions.h,343 :: 		void Tx_write_Pointer(unsigned char value[2]){
;socket_functions.h,346 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,347 :: 		ADDRESS_PHASE_LB = 0x24;
	MOVLW       36
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,348 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,349 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,350 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,351 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,352 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Tx_write_Pointer_value+0, FSR0
	MOVFF       FARG_Tx_write_Pointer_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,353 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,356 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,357 :: 		ADDRESS_PHASE_LB = 0x25;
	MOVLW       37
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,358 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,359 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,360 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,361 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,362 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_Tx_write_Pointer_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Tx_write_Pointer_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,363 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,365 :: 		}
L_end_Tx_write_Pointer:
	RETURN      0
; end of _Tx_write_Pointer

_Rx_Read_Pointer:

;socket_functions.h,367 :: 		void Rx_Read_Pointer(unsigned char value[2]){
;socket_functions.h,370 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,371 :: 		ADDRESS_PHASE_LB = 0x28;
	MOVLW       40
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,372 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,373 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,374 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,375 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,376 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Rx_Read_Pointer_value+0, FSR0
	MOVFF       FARG_Rx_Read_Pointer_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,377 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,380 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,381 :: 		ADDRESS_PHASE_LB = 0x29;
	MOVLW       41
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,382 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,383 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,384 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,385 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,386 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_Rx_Read_Pointer_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Rx_Read_Pointer_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,387 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,389 :: 		}
L_end_Rx_Read_Pointer:
	RETURN      0
; end of _Rx_Read_Pointer

_Sck_INT_Mask:

;socket_functions.h,391 :: 		void Sck_INT_Mask(unsigned char value){
;socket_functions.h,394 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,395 :: 		ADDRESS_PHASE_LB = 0x2C;
	MOVLW       44
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,396 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,397 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,398 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,399 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,400 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Sck_INT_Mask_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,401 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,403 :: 		}
L_end_Sck_INT_Mask:
	RETURN      0
; end of _Sck_INT_Mask

_Sck_FRAG:

;socket_functions.h,405 :: 		void Sck_FRAG(unsigned char value[2]){
;socket_functions.h,408 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,409 :: 		ADDRESS_PHASE_LB = 0x2D;
	MOVLW       45
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,410 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,411 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,412 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,413 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,414 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Sck_FRAG_value+0, FSR0
	MOVFF       FARG_Sck_FRAG_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,415 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,418 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,419 :: 		ADDRESS_PHASE_LB = 0x2E;
	MOVLW       46
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,420 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,421 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,422 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,423 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,424 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Sck_FRAG_value+0, FSR0
	MOVFF       FARG_Sck_FRAG_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,425 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,427 :: 		}
L_end_Sck_FRAG:
	RETURN      0
; end of _Sck_FRAG

_Sck_KPALVTR:

;socket_functions.h,429 :: 		void Sck_KPALVTR(unsigned char value){
;socket_functions.h,432 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;socket_functions.h,433 :: 		ADDRESS_PHASE_LB = 0x2F;
	MOVLW       47
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,434 :: 		BSB = getCurrent_Socket_Register_Address();
	CALL        _getCurrent_Socket_Register_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,435 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,436 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,437 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,438 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Sck_KPALVTR_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;socket_functions.h,439 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;socket_functions.h,441 :: 		}
L_end_Sck_KPALVTR:
	RETURN      0
; end of _Sck_KPALVTR

_Write_Tx:

;socket_functions.h,446 :: 		void Write_Tx(unsigned char Address0, unsigned char Address1){    //Write 16 bytes in the current buffer at the Address0 and Adrress1 memory direction
;socket_functions.h,449 :: 		ADDRESS_PHASE_HB = Address0;
	MOVF        FARG_Write_Tx_Address0+0, 0 
	MOVWF       _ADDRESS_PHASE_HB+0 
;socket_functions.h,450 :: 		ADDRESS_PHASE_LB = Address1;
	MOVF        FARG_Write_Tx_Address1+0, 0 
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,451 :: 		BSB = getCurrent_Socket_Tx_Address();
	CALL        _getCurrent_Socket_Tx_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,452 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;socket_functions.h,453 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,454 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,455 :: 		SPI_FRAME_16();
	CALL        _SPI_FRAME_16+0, 0
;socket_functions.h,457 :: 		}
L_end_Write_Tx:
	RETURN      0
; end of _Write_Tx

_Write_Tx_Oneln:

;socket_functions.h,459 :: 		void Write_Tx_Oneln(unsigned char Socket ,unsigned char Pointer[2] ,unsigned char Address0 ,unsigned char Address1){
;socket_functions.h,460 :: 		Current_Sck_Tx = Socket;
	MOVF        FARG_Write_Tx_Oneln_Socket+0, 0 
	MOVWF       _Current_Sck_Tx+0 
;socket_functions.h,461 :: 		Tx_write_Pointer(Pointer);
	MOVF        FARG_Write_Tx_Oneln_Pointer+0, 0 
	MOVWF       FARG_Tx_write_Pointer_value+0 
	MOVF        FARG_Write_Tx_Oneln_Pointer+1, 0 
	MOVWF       FARG_Tx_write_Pointer_value+1 
	CALL        _Tx_write_Pointer+0, 0
;socket_functions.h,462 :: 		Write_Tx(Address0,Address1);
	MOVF        FARG_Write_Tx_Oneln_Address0+0, 0 
	MOVWF       FARG_Write_Tx_Address0+0 
	MOVF        FARG_Write_Tx_Oneln_Address1+0, 0 
	MOVWF       FARG_Write_Tx_Address1+0 
	CALL        _Write_Tx+0, 0
;socket_functions.h,463 :: 		}
L_end_Write_Tx_Oneln:
	RETURN      0
; end of _Write_Tx_Oneln

_Read_Rx:

;socket_functions.h,488 :: 		void Read_Rx(unsigned char Address0, unsigned char Address1){    //Write 16 bytes in the current buffer at the Address0 and Adrress1 memory direction
;socket_functions.h,491 :: 		ADDRESS_PHASE_HB = Address0;
	MOVF        FARG_Read_Rx_Address0+0, 0 
	MOVWF       _ADDRESS_PHASE_HB+0 
;socket_functions.h,492 :: 		ADDRESS_PHASE_LB = Address1;
	MOVF        FARG_Read_Rx_Address1+0, 0 
	MOVWF       _ADDRESS_PHASE_LB+0 
;socket_functions.h,493 :: 		BSB = getCurrent_Socket_Rx_Address();
	CALL        _getCurrent_Socket_Rx_Address+0, 0
	MOVF        R0, 0 
	MOVWF       _BSB+0 
;socket_functions.h,494 :: 		RWB.B2 = 0;  // READ[0]/WRITE[1]
	BCF         _RWB+0, 2 
;socket_functions.h,495 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;socket_functions.h,496 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;socket_functions.h,497 :: 		SPI_FRAME_16_READ();
	CALL        _SPI_FRAME_16_READ+0, 0
;socket_functions.h,499 :: 		}
L_end_Read_Rx:
	RETURN      0
; end of _Read_Rx

_Read_Rx_Oneln:

;socket_functions.h,501 :: 		void Read_Rx_Oneln(unsigned char Socket ,unsigned char Address0 ,unsigned char Address1){
;socket_functions.h,502 :: 		Current_Sck_Rx = Socket;
	MOVF        FARG_Read_Rx_Oneln_Socket+0, 0 
	MOVWF       _Current_Sck_Rx+0 
;socket_functions.h,503 :: 		Read_Rx(Address0,Address1);
	MOVF        FARG_Read_Rx_Oneln_Address0+0, 0 
	MOVWF       FARG_Read_Rx_Address0+0 
	MOVF        FARG_Read_Rx_Oneln_Address1+0, 0 
	MOVWF       FARG_Read_Rx_Address1+0 
	CALL        _Read_Rx+0, 0
;socket_functions.h,504 :: 		}
L_end_Read_Rx_Oneln:
	RETURN      0
; end of _Read_Rx_Oneln

_Read_Common_Register:

;common_registers_functions.h,51 :: 		unsigned short Read_Common_Register(unsigned short Address){
;common_registers_functions.h,54 :: 		ADDRESS_PHASE_HB = 0x00;   //
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,55 :: 		ADDRESS_PHASE_LB = Address;
	MOVF        FARG_Read_Common_Register_Address+0, 0 
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,56 :: 		BSB = 0x00;  // SELECT COMMMON REGISTER OR SOCKET REGISTER
	CLRF        _BSB+0 
;common_registers_functions.h,57 :: 		RWB.B2 = 0;  // READ[0]/WRITE[1]
	BCF         _RWB+0, 2 
;common_registers_functions.h,58 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,59 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,61 :: 		return SPI_FRAME_READ();
	CALL        _SPI_FRAME_READ+0, 0
;common_registers_functions.h,62 :: 		}
L_end_Read_Common_Register:
	RETURN      0
; end of _Read_Common_Register

_Mode:

;common_registers_functions.h,65 :: 		void Mode(unsigned char value){
;common_registers_functions.h,68 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,69 :: 		ADDRESS_PHASE_LB = 0x00;
	CLRF        _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,70 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,71 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,72 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,73 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,74 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Mode_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,75 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,77 :: 		}
L_end_Mode:
	RETURN      0
; end of _Mode

_Config_Gateway:

;common_registers_functions.h,79 :: 		void Config_Gateway(){
;common_registers_functions.h,83 :: 		for(i=0x00;i<0x04;i++){
	CLRF        Config_Gateway_i_L0+0 
L_Config_Gateway51:
	MOVLW       4
	SUBWF       Config_Gateway_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Config_Gateway52
;common_registers_functions.h,85 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,86 :: 		ADDRESS_PHASE_LB = 0x01 + i;
	MOVF        Config_Gateway_i_L0+0, 0 
	ADDLW       1
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,87 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,88 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,89 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,90 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,91 :: 		DATA_PHASE_1B = Gateway[i];
	MOVLW       _Gateway+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_Gateway+0)
	MOVWF       FSR0H 
	MOVF        Config_Gateway_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,92 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,83 :: 		for(i=0x00;i<0x04;i++){
	INCF        Config_Gateway_i_L0+0, 1 
;common_registers_functions.h,93 :: 		}
	GOTO        L_Config_Gateway51
L_Config_Gateway52:
;common_registers_functions.h,95 :: 		}
L_end_Config_Gateway:
	RETURN      0
; end of _Config_Gateway

_Config_Subnet:

;common_registers_functions.h,97 :: 		void Config_Subnet(){
;common_registers_functions.h,101 :: 		for(i=0x00;i<0x04;i++){
	CLRF        Config_Subnet_i_L0+0 
L_Config_Subnet54:
	MOVLW       4
	SUBWF       Config_Subnet_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Config_Subnet55
;common_registers_functions.h,103 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,104 :: 		ADDRESS_PHASE_LB = 0x05 + i;
	MOVF        Config_Subnet_i_L0+0, 0 
	ADDLW       5
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,105 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,106 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,107 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,108 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,109 :: 		DATA_PHASE_1B = Subnet_Mask[i];
	MOVLW       _Subnet_Mask+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_Subnet_Mask+0)
	MOVWF       FSR0H 
	MOVF        Config_Subnet_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,110 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,101 :: 		for(i=0x00;i<0x04;i++){
	INCF        Config_Subnet_i_L0+0, 1 
;common_registers_functions.h,111 :: 		}
	GOTO        L_Config_Subnet54
L_Config_Subnet55:
;common_registers_functions.h,113 :: 		}
L_end_Config_Subnet:
	RETURN      0
; end of _Config_Subnet

_Config_MAC:

;common_registers_functions.h,115 :: 		void Config_MAC(){
;common_registers_functions.h,119 :: 		for(i=0x00;i<0x06;i++){
	CLRF        Config_MAC_i_L0+0 
L_Config_MAC57:
	MOVLW       6
	SUBWF       Config_MAC_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Config_MAC58
;common_registers_functions.h,121 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,122 :: 		ADDRESS_PHASE_LB = 0x09 + i;
	MOVF        Config_MAC_i_L0+0, 0 
	ADDLW       9
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,123 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,124 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,125 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,126 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,127 :: 		DATA_PHASE_1B = MAC[i];
	MOVLW       _MAC+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_MAC+0)
	MOVWF       FSR0H 
	MOVF        Config_MAC_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,128 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,119 :: 		for(i=0x00;i<0x06;i++){
	INCF        Config_MAC_i_L0+0, 1 
;common_registers_functions.h,129 :: 		}
	GOTO        L_Config_MAC57
L_Config_MAC58:
;common_registers_functions.h,131 :: 		}
L_end_Config_MAC:
	RETURN      0
; end of _Config_MAC

_Config_IP:

;common_registers_functions.h,133 :: 		void Config_IP(){
;common_registers_functions.h,137 :: 		for(i=0x00;i<0x04;i++){
	CLRF        Config_IP_i_L0+0 
L_Config_IP60:
	MOVLW       4
	SUBWF       Config_IP_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Config_IP61
;common_registers_functions.h,139 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,140 :: 		ADDRESS_PHASE_LB = 0x0F + i;
	MOVF        Config_IP_i_L0+0, 0 
	ADDLW       15
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,141 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,142 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,143 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,144 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,145 :: 		DATA_PHASE_1B = IP[i];
	MOVLW       _IP+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_IP+0)
	MOVWF       FSR0H 
	MOVF        Config_IP_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,146 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,137 :: 		for(i=0x00;i<0x04;i++){
	INCF        Config_IP_i_L0+0, 1 
;common_registers_functions.h,147 :: 		}
	GOTO        L_Config_IP60
L_Config_IP61:
;common_registers_functions.h,149 :: 		}
L_end_Config_IP:
	RETURN      0
; end of _Config_IP

_INTLEVEL:

;common_registers_functions.h,151 :: 		void INTLEVEL(unsigned char value[2]){
;common_registers_functions.h,154 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,155 :: 		ADDRESS_PHASE_LB = 0x13;
	MOVLW       19
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,156 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,157 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,158 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,159 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,160 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_INTLEVEL_value+0, FSR0
	MOVFF       FARG_INTLEVEL_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,161 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,164 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,165 :: 		ADDRESS_PHASE_LB = 0x14;
	MOVLW       20
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,166 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,167 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,168 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,169 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,170 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_INTLEVEL_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_INTLEVEL_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,171 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,174 :: 		}
L_end_INTLEVEL:
	RETURN      0
; end of _INTLEVEL

_IR:

;common_registers_functions.h,176 :: 		void IR(unsigned char value){
;common_registers_functions.h,179 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,180 :: 		ADDRESS_PHASE_LB = 0x15;
	MOVLW       21
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,181 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,182 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,183 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,184 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,185 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_IR_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,186 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,188 :: 		}
L_end_IR:
	RETURN      0
; end of _IR

_IMR:

;common_registers_functions.h,190 :: 		void IMR(unsigned char value){
;common_registers_functions.h,193 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,194 :: 		ADDRESS_PHASE_LB = 0x16;
	MOVLW       22
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,195 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,196 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,197 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,198 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,199 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_IMR_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,200 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,202 :: 		}
L_end_IMR:
	RETURN      0
; end of _IMR

_Sck_Interrupts:

;common_registers_functions.h,204 :: 		void Sck_Interrupts(unsigned char value){
;common_registers_functions.h,207 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,208 :: 		ADDRESS_PHASE_LB = 0x17;
	MOVLW       23
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,209 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,210 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,211 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,212 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,213 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Sck_Interrupts_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,214 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,216 :: 		}
L_end_Sck_Interrupts:
	RETURN      0
; end of _Sck_Interrupts

_Sck_Interrupts_Mask:

;common_registers_functions.h,218 :: 		void Sck_Interrupts_Mask(unsigned char value){
;common_registers_functions.h,221 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,222 :: 		ADDRESS_PHASE_LB = 0x18;
	MOVLW       24
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,223 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,224 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,225 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,226 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,227 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Sck_Interrupts_Mask_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,228 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,230 :: 		}
L_end_Sck_Interrupts_Mask:
	RETURN      0
; end of _Sck_Interrupts_Mask

_Retry_Time:

;common_registers_functions.h,232 :: 		void Retry_Time(unsigned char value[2]){
;common_registers_functions.h,236 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,237 :: 		ADDRESS_PHASE_LB = 0x19;
	MOVLW       25
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,238 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,239 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,240 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,241 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,242 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_Retry_Time_value+0, FSR0
	MOVFF       FARG_Retry_Time_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,243 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,246 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,247 :: 		ADDRESS_PHASE_LB = 0x1A;
	MOVLW       26
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,248 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,249 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,250 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,251 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,252 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_Retry_Time_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Retry_Time_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,253 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,256 :: 		}
L_end_Retry_Time:
	RETURN      0
; end of _Retry_Time

_Retry_Count:

;common_registers_functions.h,258 :: 		void Retry_Count(unsigned char value){
;common_registers_functions.h,261 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,262 :: 		ADDRESS_PHASE_LB = 0x1B;
	MOVLW       27
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,263 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,264 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,265 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,266 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,267 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_Retry_Count_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,268 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,270 :: 		}
L_end_Retry_Count:
	RETURN      0
; end of _Retry_Count

_PTIMER_W:

;common_registers_functions.h,272 :: 		void PTIMER_W(unsigned char value){
;common_registers_functions.h,277 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,278 :: 		ADDRESS_PHASE_LB = 0x1C;
	MOVLW       28
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,279 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,280 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,281 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,282 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,283 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_PTIMER_W_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,284 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,286 :: 		}
L_end_PTIMER_W:
	RETURN      0
; end of _PTIMER_W

_PMAGIC_W:

;common_registers_functions.h,288 :: 		void PMAGIC_W(unsigned char value){
;common_registers_functions.h,291 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,292 :: 		ADDRESS_PHASE_LB = 0x1D;
	MOVLW       29
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,293 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,294 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,295 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,296 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,297 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_PMAGIC_W_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,298 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,300 :: 		}
L_end_PMAGIC_W:
	RETURN      0
; end of _PMAGIC_W

_PHAR:

;common_registers_functions.h,302 :: 		void PHAR(unsigned char value[6]){
;common_registers_functions.h,306 :: 		for(i=0x00;i<0x06;i++){
	CLRF        PHAR_i_L0+0 
L_PHAR63:
	MOVLW       6
	SUBWF       PHAR_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_PHAR64
;common_registers_functions.h,308 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,309 :: 		ADDRESS_PHASE_LB = 0x1E + i;
	MOVF        PHAR_i_L0+0, 0 
	ADDLW       30
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,310 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,311 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,312 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,313 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,314 :: 		DATA_PHASE_1B = value[i];
	MOVF        PHAR_i_L0+0, 0 
	ADDWF       FARG_PHAR_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_PHAR_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,315 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,306 :: 		for(i=0x00;i<0x06;i++){
	INCF        PHAR_i_L0+0, 1 
;common_registers_functions.h,316 :: 		}
	GOTO        L_PHAR63
L_PHAR64:
;common_registers_functions.h,318 :: 		}
L_end_PHAR:
	RETURN      0
; end of _PHAR

_PSID:

;common_registers_functions.h,320 :: 		void PSID(unsigned char value[2]){
;common_registers_functions.h,323 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,324 :: 		ADDRESS_PHASE_LB = 0x24;
	MOVLW       36
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,325 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,326 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,327 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,328 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,329 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_PSID_value+0, FSR0
	MOVFF       FARG_PSID_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,330 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,333 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,334 :: 		ADDRESS_PHASE_LB = 0x25;
	MOVLW       37
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,335 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,336 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,337 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,338 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,339 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_PSID_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_PSID_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,340 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,343 :: 		}
L_end_PSID:
	RETURN      0
; end of _PSID

_PMRU:

;common_registers_functions.h,345 :: 		void PMRU(unsigned char value[2]){
;common_registers_functions.h,348 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,349 :: 		ADDRESS_PHASE_LB = 0x26;
	MOVLW       38
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,350 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,351 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,352 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,353 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,354 :: 		DATA_PHASE_1B = value[0];
	MOVFF       FARG_PMRU_value+0, FSR0
	MOVFF       FARG_PMRU_value+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,355 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,358 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,359 :: 		ADDRESS_PHASE_LB = 0x27;
	MOVLW       39
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,360 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,361 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,362 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,363 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,364 :: 		DATA_PHASE_1B = value[1];
	MOVLW       1
	ADDWF       FARG_PMRU_value+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_PMRU_value+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,365 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,368 :: 		}
L_end_PMRU:
	RETURN      0
; end of _PMRU

_PHY_Config:

;common_registers_functions.h,370 :: 		void PHY_Config(unsigned char value){
;common_registers_functions.h,373 :: 		ADDRESS_PHASE_HB = 0x00;
	CLRF        _ADDRESS_PHASE_HB+0 
;common_registers_functions.h,374 :: 		ADDRESS_PHASE_LB = 0x2E;
	MOVLW       46
	MOVWF       _ADDRESS_PHASE_LB+0 
;common_registers_functions.h,375 :: 		BSB = 0x00;
	CLRF        _BSB+0 
;common_registers_functions.h,376 :: 		RWB.B2 = 1;  // READ[0]/WRITE[1]
	BSF         _RWB+0, 2 
;common_registers_functions.h,377 :: 		OM.B1  = 0;  // BIT 1 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 1 
;common_registers_functions.h,378 :: 		OM.B2  = 0;  // BIT 2 OF OM (CONFIG VDM OR FDM)
	BCF         _OM+0, 2 
;common_registers_functions.h,379 :: 		DATA_PHASE_1B = value;
	MOVF        FARG_PHY_Config_value+0, 0 
	MOVWF       _DATA_PHASE_1B+0 
;common_registers_functions.h,380 :: 		SPI_FRAME();
	CALL        _SPI_FRAME+0, 0
;common_registers_functions.h,382 :: 		}
L_end_PHY_Config:
	RETURN      0
; end of _PHY_Config

_Config_Bfs_Sz:

;w5500_library.h,251 :: 		void Config_Bfs_Sz(){
;w5500_library.h,253 :: 		for(i=0x00;i<0x08;i++){
	CLRF        _i+0 
L_Config_Bfs_Sz66:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Config_Bfs_Sz67
;w5500_library.h,254 :: 		Current_Sck_Register = i;
	MOVF        _i+0, 0 
	MOVWF       _Current_Sck_Register+0 
;w5500_library.h,255 :: 		Set_Tx_Buffer_Sz(SCKSZ[i]);
	MOVLW       _SCKSZ+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_SCKSZ+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Set_Tx_Buffer_Sz_value+0 
	CALL        _Set_Tx_Buffer_Sz+0, 0
;w5500_library.h,256 :: 		Set_Rx_Buffer_Sz(SCKSZ[i]);
	MOVLW       _SCKSZ+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_SCKSZ+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Set_Rx_Buffer_Sz_value+0 
	CALL        _Set_Rx_Buffer_Sz+0, 0
;w5500_library.h,253 :: 		for(i=0x00;i<0x08;i++){
	INCF        _i+0, 1 
;w5500_library.h,257 :: 		}
	GOTO        L_Config_Bfs_Sz66
L_Config_Bfs_Sz67:
;w5500_library.h,259 :: 		}
L_end_Config_Bfs_Sz:
	RETURN      0
; end of _Config_Bfs_Sz

_W5500_Init:

;w5500_library.h,261 :: 		void W5500_Init(){
;w5500_library.h,263 :: 		Config_IP();
	CALL        _Config_IP+0, 0
;w5500_library.h,264 :: 		Config_Subnet();
	CALL        _Config_Subnet+0, 0
;w5500_library.h,265 :: 		Config_MAC();
	CALL        _Config_MAC+0, 0
;w5500_library.h,266 :: 		Config_Gateway();
	CALL        _Config_Gateway+0, 0
;w5500_library.h,267 :: 		Config_Bfs_Sz();
	CALL        _Config_Bfs_Sz+0, 0
;w5500_library.h,268 :: 		dmy = MODE; // Enable PING (MODE.B4 = 0;)
	CLRF        FARG_Read_Common_Register_Address+0 
	CALL        _Read_Common_Register+0, 0
	MOVF        R0, 0 
	MOVWF       _dmy+0 
;w5500_library.h,269 :: 		dmy.B4 = 0;
	BCF         _dmy+0, 4 
;w5500_library.h,270 :: 		Mode(dmy);
	MOVF        _dmy+0, 0 
	MOVWF       FARG_Mode_value+0 
	CALL        _Mode+0, 0
;w5500_library.h,272 :: 		}
L_end_W5500_Init:
	RETURN      0
; end of _W5500_Init

_init:

;SSDI_Program.c,12 :: 		void init(){
;SSDI_Program.c,14 :: 		OSCCON = 0b01110111;
	MOVLW       119
	MOVWF       OSCCON+0 
;SSDI_Program.c,16 :: 		ANSELA = 0x00;
	CLRF        ANSELA+0 
;SSDI_Program.c,17 :: 		ANSELB = 0x00;
	CLRF        ANSELB+0 
;SSDI_Program.c,18 :: 		ANSELC = 0x00;
	CLRF        ANSELC+0 
;SSDI_Program.c,19 :: 		ANSELD = 0x00;
	CLRF        ANSELD+0 
;SSDI_Program.c,20 :: 		ANSELE = 0x00;
	CLRF        ANSELE+0 
;SSDI_Program.c,22 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;SSDI_Program.c,23 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;SSDI_Program.c,24 :: 		TRISC = 0b00010000;
	MOVLW       16
	MOVWF       TRISC+0 
;SSDI_Program.c,25 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;SSDI_Program.c,26 :: 		TRISE = 0x00;
	CLRF        TRISE+0 
;SSDI_Program.c,28 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;SSDI_Program.c,29 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;SSDI_Program.c,30 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;SSDI_Program.c,31 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;SSDI_Program.c,32 :: 		PORTE = 0x00;
	CLRF        PORTE+0 
;SSDI_Program.c,34 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_init69:
	DECFSZ      R13, 1, 1
	BRA         L_init69
	DECFSZ      R12, 1, 1
	BRA         L_init69
	DECFSZ      R11, 1, 1
	BRA         L_init69
	NOP
;SSDI_Program.c,35 :: 		PORTE.RB1 = 1;
	BSF         PORTE+0, 1 
;SSDI_Program.c,36 :: 		SPI1_init();
	CALL        _SPI1_Init+0, 0
;SSDI_Program.c,37 :: 		Chip_Select = 1;
	BSF         PORTE+0, 0 
;SSDI_Program.c,38 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_init70:
	DECFSZ      R13, 1, 1
	BRA         L_init70
	NOP
;SSDI_Program.c,40 :: 		LED1;
	BSF         PORTB+0, 0 
;SSDI_Program.c,41 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_init71:
	DECFSZ      R13, 1, 1
	BRA         L_init71
	DECFSZ      R12, 1, 1
	BRA         L_init71
	DECFSZ      R11, 1, 1
	BRA         L_init71
	NOP
;SSDI_Program.c,42 :: 		LED0;
	BCF         PORTB+0, 0 
;SSDI_Program.c,43 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_init72:
	DECFSZ      R13, 1, 1
	BRA         L_init72
	DECFSZ      R12, 1, 1
	BRA         L_init72
	DECFSZ      R11, 1, 1
	BRA         L_init72
	NOP
;SSDI_Program.c,44 :: 		LED1;
	BSF         PORTB+0, 0 
;SSDI_Program.c,45 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_init73:
	DECFSZ      R13, 1, 1
	BRA         L_init73
	DECFSZ      R12, 1, 1
	BRA         L_init73
	DECFSZ      R11, 1, 1
	BRA         L_init73
	NOP
;SSDI_Program.c,46 :: 		LED0;
	BCF         PORTB+0, 0 
;SSDI_Program.c,47 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;SSDI_Program.c,48 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_init74:
	DECFSZ      R13, 1, 1
	BRA         L_init74
	DECFSZ      R12, 1, 1
	BRA         L_init74
	DECFSZ      R11, 1, 1
	BRA         L_init74
	NOP
	NOP
;SSDI_Program.c,49 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;SSDI_Program.c,50 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_init75:
	DECFSZ      R13, 1, 1
	BRA         L_init75
	DECFSZ      R12, 1, 1
	BRA         L_init75
	DECFSZ      R11, 1, 1
	BRA         L_init75
	NOP
	NOP
;SSDI_Program.c,51 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;SSDI_Program.c,52 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_init76:
	DECFSZ      R13, 1, 1
	BRA         L_init76
	DECFSZ      R12, 1, 1
	BRA         L_init76
	DECFSZ      R11, 1, 1
	BRA         L_init76
	NOP
	NOP
;SSDI_Program.c,53 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;SSDI_Program.c,54 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_init77:
	DECFSZ      R13, 1, 1
	BRA         L_init77
	DECFSZ      R12, 1, 1
	BRA         L_init77
	DECFSZ      R11, 1, 1
	BRA         L_init77
	NOP
	NOP
;SSDI_Program.c,58 :: 		}
L_end_init:
	RETURN      0
; end of _init

_UDP:

;SSDI_Program.c,60 :: 		void UDP(){
;SSDI_Program.c,62 :: 		Current_Sck_Register = 0;
	CLRF        _Current_Sck_Register+0 
;SSDI_Program.c,63 :: 		Current_Sck_Tx = 0;
	CLRF        _Current_Sck_Tx+0 
;SSDI_Program.c,64 :: 		Current_Sck_Rx = 0;
	CLRF        _Current_Sck_Rx+0 
;SSDI_Program.c,65 :: 		W5500_Init();
	CALL        _W5500_Init+0, 0
;SSDI_Program.c,67 :: 		Socket[SckN].Sck_Mode = 0x02;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       2
	MOVWF       POSTINC1+0 
;SSDI_Program.c,68 :: 		Socket[SckN].Sck_Cmd = OPEN;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	MOVWF       POSTINC1+0 
;SSDI_Program.c,69 :: 		Socket[SckN].SPORT_Register_Address[0] = 0x27;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       39
	MOVWF       POSTINC1+0 
;SSDI_Program.c,70 :: 		Socket[SckN].SPORT_Register_Address[1] = 0x11;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       POSTINC1+0 
;SSDI_Program.c,71 :: 		Socket[SckN].DMAC_Register_Address[0] = 0x90; ///////////////////////////////
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       144
	MOVWF       POSTINC1+0 
;SSDI_Program.c,72 :: 		Socket[SckN].DMAC_Register_Address[1] = 0xB1;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       177
	MOVWF       POSTINC1+0 
;SSDI_Program.c,73 :: 		Socket[SckN].DMAC_Register_Address[2] = 0x1C;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       28
	MOVWF       POSTINC1+0 
;SSDI_Program.c,74 :: 		Socket[SckN].DMAC_Register_Address[3] = 0x94;       //Debes comfirar la DMAC y la DIP
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       148
	MOVWF       POSTINC1+0 
;SSDI_Program.c,75 :: 		Socket[SckN].DMAC_Register_Address[4] = 0x88;           //Esos son datos Dummy
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       136
	MOVWF       POSTINC1+0 
;SSDI_Program.c,76 :: 		Socket[SckN].DMAC_Register_Address[5] = 0x05;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       4
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       5
	MOVWF       POSTINC1+0 
;SSDI_Program.c,77 :: 		Socket[SckN].DIP_Register_Address[0] = 10;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       10
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       10
	MOVWF       POSTINC1+0 
;SSDI_Program.c,78 :: 		Socket[SckN].DIP_Register_Address[1] = 0;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       10
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;SSDI_Program.c,79 :: 		Socket[SckN].DIP_Register_Address[2] = 2;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       10
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       2
	MOVWF       POSTINC1+0 
;SSDI_Program.c,80 :: 		Socket[SckN].DIP_Register_Address[3] = 3; ///////////////////////////
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       10
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       3
	MOVWF       POSTINC1+0 
;SSDI_Program.c,81 :: 		Socket[SckN].DPORT_Register_Address[0] = 0x27;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       14
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       39
	MOVWF       POSTINC1+0 
;SSDI_Program.c,82 :: 		Socket[SckN].DPORT_Register_Address[1] = 0x11;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       14
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       17
	MOVWF       POSTINC1+0 
;SSDI_Program.c,83 :: 		Socket[SckN].Rx_Bf_Sz = 2;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       18
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       2
	MOVWF       POSTINC1+0 
;SSDI_Program.c,84 :: 		Socket[SckN].Tx_Bf_Sz = 2;
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       19
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       2
	MOVWF       POSTINC1+0 
;SSDI_Program.c,86 :: 		Destination_MAC(Socket[SckN].DMAC_Register_Address);
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 0 
	MOVWF       FARG_Destination_MAC_value+0 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Destination_MAC_value+1 
	MOVLW       4
	ADDWF       FARG_Destination_MAC_value+0, 1 
	MOVLW       0
	ADDWFC      FARG_Destination_MAC_value+1, 1 
	CALL        _Destination_MAC+0, 0
;SSDI_Program.c,87 :: 		Destination_IP(Socket[SckN].DIP_Register_Address);
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 0 
	MOVWF       FARG_Destination_IP_value+0 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Destination_IP_value+1 
	MOVLW       10
	ADDWF       FARG_Destination_IP_value+0, 1 
	MOVLW       0
	ADDWFC      FARG_Destination_IP_value+1, 1 
	CALL        _Destination_IP+0, 0
;SSDI_Program.c,88 :: 		Destination_PORT(Socket[SckN].DPORT_Register_Address);
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 0 
	MOVWF       FARG_Destination_PORT_value+0 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Destination_PORT_value+1 
	MOVLW       14
	ADDWF       FARG_Destination_PORT_value+0, 1 
	MOVLW       0
	ADDWFC      FARG_Destination_PORT_value+1, 1 
	CALL        _Destination_PORT+0, 0
;SSDI_Program.c,90 :: 		Sck_Mode(Socket[SckN].Sck_Mode); //Set UDP Mode
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Sck_Mode_value+0 
	CALL        _Sck_Mode+0, 0
;SSDI_Program.c,91 :: 		SckCMD(Socket[SckN].Sck_Cmd);
	MOVLW       33
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _SckN+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _Socket+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_Socket+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SckCMD_value+0 
	CALL        _SckCMD+0, 0
;SSDI_Program.c,93 :: 		DATA[0] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+0 
;SSDI_Program.c,94 :: 		DATA[1] = 0x00;
	CLRF        _DATA+1 
;SSDI_Program.c,95 :: 		DATA[2] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+2 
;SSDI_Program.c,96 :: 		DATA[3] = 0x00;
	CLRF        _DATA+3 
;SSDI_Program.c,97 :: 		DATA[4] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+4 
;SSDI_Program.c,98 :: 		DATA[5] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+5 
;SSDI_Program.c,99 :: 		DATA[6] = 0x00;
	CLRF        _DATA+6 
;SSDI_Program.c,100 :: 		DATA[7] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+7 
;SSDI_Program.c,101 :: 		DATA[8] = 0x00;
	CLRF        _DATA+8 
;SSDI_Program.c,102 :: 		DATA[9] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+9 
;SSDI_Program.c,103 :: 		DATA[10] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+10 
;SSDI_Program.c,104 :: 		DATA[11] = 0x00;
	CLRF        _DATA+11 
;SSDI_Program.c,105 :: 		DATA[12] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+12 
;SSDI_Program.c,106 :: 		DATA[13] = 0x00;
	CLRF        _DATA+13 
;SSDI_Program.c,107 :: 		DATA[14] = 0xFF;
	MOVLW       255
	MOVWF       _DATA+14 
;SSDI_Program.c,108 :: 		DATA[15] = 0x00;
	CLRF        _DATA+15 
;SSDI_Program.c,111 :: 		if(Sck_STAT == 0x22){
	MOVLW       3
	MOVWF       FARG_Read_Sck_Register_Address+0 
	CALL        _Read_Sck_Register+0, 0
	MOVF        R0, 0 
	XORLW       34
	BTFSS       STATUS+0, 2 
	GOTO        L_UDP78
;SSDI_Program.c,112 :: 		PORTD.B7 = 1;
	BSF         PORTD+0, 7 
;SSDI_Program.c,113 :: 		while(1){
L_UDP79:
;SSDI_Program.c,114 :: 		PORTD.B6 = 1;
	BSF         PORTD+0, 6 
;SSDI_Program.c,116 :: 		PORTD.B5 = 1;
	BSF         PORTD+0, 5 
;SSDI_Program.c,118 :: 		SckCMD(SEND_MAC);
	MOVLW       33
	MOVWF       FARG_SckCMD_value+0 
	CALL        _SckCMD+0, 0
;SSDI_Program.c,120 :: 		PORTD.B4 = 1;
	BSF         PORTD+0, 4 
;SSDI_Program.c,121 :: 		SckCMD(CLOSE);
	MOVLW       16
	MOVWF       FARG_SckCMD_value+0 
	CALL        _SckCMD+0, 0
;SSDI_Program.c,122 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;SSDI_Program.c,123 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_UDP81:
	DECFSZ      R13, 1, 1
	BRA         L_UDP81
	DECFSZ      R12, 1, 1
	BRA         L_UDP81
	DECFSZ      R11, 1, 1
	BRA         L_UDP81
	NOP
	NOP
;SSDI_Program.c,124 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;SSDI_Program.c,125 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_UDP82:
	DECFSZ      R13, 1, 1
	BRA         L_UDP82
	DECFSZ      R12, 1, 1
	BRA         L_UDP82
	DECFSZ      R11, 1, 1
	BRA         L_UDP82
	NOP
	NOP
;SSDI_Program.c,126 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;SSDI_Program.c,127 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_UDP83:
	DECFSZ      R13, 1, 1
	BRA         L_UDP83
	DECFSZ      R12, 1, 1
	BRA         L_UDP83
	DECFSZ      R11, 1, 1
	BRA         L_UDP83
	NOP
	NOP
;SSDI_Program.c,128 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;SSDI_Program.c,129 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_UDP84:
	DECFSZ      R13, 1, 1
	BRA         L_UDP84
	DECFSZ      R12, 1, 1
	BRA         L_UDP84
	DECFSZ      R11, 1, 1
	BRA         L_UDP84
	NOP
	NOP
;SSDI_Program.c,131 :: 		PORTD.B3 = 1;
	BSF         PORTD+0, 3 
;SSDI_Program.c,132 :: 		SckCMD(OPEN);
	MOVLW       1
	MOVWF       FARG_SckCMD_value+0 
	CALL        _SckCMD+0, 0
;SSDI_Program.c,133 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_UDP85:
	DECFSZ      R13, 1, 1
	BRA         L_UDP85
	DECFSZ      R12, 1, 1
	BRA         L_UDP85
	NOP
	NOP
;SSDI_Program.c,135 :: 		}
	GOTO        L_UDP79
;SSDI_Program.c,136 :: 		}
L_UDP78:
;SSDI_Program.c,138 :: 		}
L_end_UDP:
	RETURN      0
; end of _UDP

_main:

;SSDI_Program.c,140 :: 		void main() {
;SSDI_Program.c,142 :: 		init();
	CALL        _init+0, 0
;SSDI_Program.c,143 :: 		UDP();
	CALL        _UDP+0, 0
;SSDI_Program.c,155 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
