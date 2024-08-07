
_main:

;Final.c,12 :: 		void main() {
;Final.c,13 :: 		adcon1=0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;Final.c,14 :: 		trisc=0b00110000;
	MOVLW      48
	MOVWF      TRISC+0
;Final.c,15 :: 		trisa=1;
	MOVLW      1
	MOVWF      TRISA+0
;Final.c,16 :: 		trisb=0;
	CLRF       TRISB+0
;Final.c,17 :: 		trisd=0;
	CLRF       TRISD+0
;Final.c,18 :: 		portc=15;
	MOVLW      15
	MOVWF      PORTC+0
;Final.c,19 :: 		Display=0;
	CLRF       PORTB+0
;Final.c,20 :: 		portd=0;
	CLRF       PORTD+0
;Final.c,22 :: 		for( ; ; ){
L_main0:
;Final.c,23 :: 		if(SW_M_A==0){
	BTFSC      PORTC+0, 4
	GOTO       L_main3
;Final.c,24 :: 		portd=0;
	CLRF       PORTD+0
;Final.c,25 :: 		for(count=0;count<=3;count++){
	CLRF       _count+0
	CLRF       _count+1
L_main4:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVF       _count+0, 0
	SUBLW      3
L__main55:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;Final.c,26 :: 		Display=count;
	MOVF       _count+0, 0
	MOVWF      PORTB+0
;Final.c,27 :: 		for(count2=0;count2<=9;count2++){
	CLRF       _count2+0
	CLRF       _count2+1
L_main7:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       _count2+0, 0
	SUBLW      9
L__main56:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;Final.c,28 :: 		Display=(count2<<4) | count;
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main57:
	BTFSC      STATUS+0, 2
	GOTO       L__main58
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main57
L__main58:
	MOVF       _count+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;Final.c,29 :: 		if(count==0 && count2==0) {LED_GREEN1=1;  LED_RED2=1;}
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVLW      0
	XORWF      _count+0, 0
L__main59:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      0
	XORWF      _count2+0, 0
L__main60:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
L__main53:
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
L_main12:
;Final.c,30 :: 		if(count==2 && count2==0) {LED_GREEN1=0; LED_RED1=0;LED_YELLOW1=1;}
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      2
	XORWF      _count+0, 0
L__main61:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      0
	XORWF      _count2+0, 0
L__main62:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
L__main52:
	BCF        PORTD+0, 2
	BCF        PORTD+0, 0
	BSF        PORTD+0, 1
L_main15:
;Final.c,31 :: 		if(count==2 && count2==3) {LED_RED1=1; LED_YELLOW2=1; LED_YELLOW1=0; LED_RED2=0; }
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      2
	XORWF      _count+0, 0
L__main63:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      3
	XORWF      _count2+0, 0
L__main64:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
L__main51:
	BSF        PORTD+0, 0
	BSF        PORTD+0, 4
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
L_main18:
;Final.c,32 :: 		if(count==2 && count2==6) {LED_GREEN2=1; LED_YELLOW2=0;}
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      2
	XORWF      _count+0, 0
L__main65:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      6
	XORWF      _count2+0, 0
L__main66:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
L__main50:
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
L_main21:
;Final.c,33 :: 		delay_ms(Wait);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;Final.c,34 :: 		if(SW_M_A==1) {portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main23
	CLRF       PORTD+0
	GOTO       L_main8
L_main23:
;Final.c,35 :: 		if(count==3 && count2==7 )break;
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      3
	XORWF      _count+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      7
	XORWF      _count2+0, 0
L__main68:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
L__main49:
	GOTO       L_main8
L_main26:
;Final.c,27 :: 		for(count2=0;count2<=9;count2++){
	INCF       _count2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count2+1, 1
;Final.c,36 :: 		}
	GOTO       L_main7
L_main8:
;Final.c,37 :: 		if(SW_M_A==1) { portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main27
	CLRF       PORTD+0
	GOTO       L_main5
L_main27:
;Final.c,25 :: 		for(count=0;count<=3;count++){
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;Final.c,38 :: 		}
	GOTO       L_main4
L_main5:
;Final.c,39 :: 		}
	GOTO       L_main28
L_main3:
;Final.c,43 :: 		Display=0;
	CLRF       PORTB+0
;Final.c,45 :: 		if (SW_M==0){  //West Street
	BTFSC      PORTC+0, 5
	GOTO       L_main29
;Final.c,46 :: 		LED_GREEN2=0;   LED_RED1=0;
	BCF        PORTD+0, 5
	BCF        PORTD+0, 0
;Final.c,47 :: 		LED_YELLOW2=1;  LED_YELLOW1=1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 1
;Final.c,48 :: 		for(count3=0;count3<4;count3++){Display=count3<<4;delay_ms(Wait);}
	CLRF       _count3+0
	CLRF       _count3+1
L_main30:
	MOVLW      128
	XORWF      _count3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      4
	SUBWF      _count3+0, 0
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main31
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count3+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main70:
	BTFSC      STATUS+0, 2
	GOTO       L__main71
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main70
L__main71:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
	INCF       _count3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count3+1, 1
	GOTO       L_main30
L_main31:
;Final.c,49 :: 		Display=0;
	CLRF       PORTB+0
;Final.c,50 :: 		LED_YELLOW2=0;  LED_YELLOW1=0;
	BCF        PORTD+0, 4
	BCF        PORTD+0, 1
;Final.c,51 :: 		LED_GREEN1=1;  LED_RED2=1;
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
;Final.c,52 :: 		while(SW_M==0 && SW_M_A==1);
L_main34:
	BTFSC      PORTC+0, 5
	GOTO       L_main35
	BTFSS      PORTC+0, 4
	GOTO       L_main35
L__main48:
	GOTO       L_main34
L_main35:
;Final.c,53 :: 		}
	GOTO       L_main38
L_main29:
;Final.c,55 :: 		LED_GREEN1=0;   LED_RED2=0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 3
;Final.c,56 :: 		LED_YELLOW2=1;  LED_YELLOW1=1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 1
;Final.c,57 :: 		for(count3=0;count3<4;count3++){Display=count3<<4;delay_ms(Wait);}
	CLRF       _count3+0
	CLRF       _count3+1
L_main39:
	MOVLW      128
	XORWF      _count3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      4
	SUBWF      _count3+0, 0
L__main72:
	BTFSC      STATUS+0, 0
	GOTO       L_main40
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count3+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main73:
	BTFSC      STATUS+0, 2
	GOTO       L__main74
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main73
L__main74:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	DECFSZ     R11+0, 1
	GOTO       L_main42
	NOP
	NOP
	INCF       _count3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count3+1, 1
	GOTO       L_main39
L_main40:
;Final.c,58 :: 		Display=0;
	CLRF       PORTB+0
;Final.c,59 :: 		LED_YELLOW2=0;  LED_YELLOW1=0;
	BCF        PORTD+0, 4
	BCF        PORTD+0, 1
;Final.c,60 :: 		LED_GREEN2=1;   LED_RED1=1;
	BSF        PORTD+0, 5
	BSF        PORTD+0, 0
;Final.c,61 :: 		while(SW_M==1 && SW_M_A==1);
L_main43:
	BTFSS      PORTC+0, 5
	GOTO       L_main44
	BTFSS      PORTC+0, 4
	GOTO       L_main44
L__main47:
	GOTO       L_main43
L_main44:
;Final.c,62 :: 		}
L_main38:
;Final.c,63 :: 		}
L_main28:
;Final.c,102 :: 		}
	GOTO       L_main0
;Final.c,107 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
