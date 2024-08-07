#line 1 "C:/Users/W.I/Desktop/Embedded Mikroc/Final Project/Software/Final.c"










int count=0, count2=0 , count3=0;
void main() {
 adcon1=0x07;
 trisc=0b00110000;
 trisa=1;
 trisb=0;
 trisd=0;
 portc=15;
  portb =0;
 portd=0;

 for( ; ; ){
 if( portc.b4 ==0){
 portd=0;
 for(count=0;count<=3;count++){
  portb =count;
 for(count2=0;count2<=9;count2++){
  portb =(count2<<4) | count;
 if(count==0 && count2==0) { portd.b2 =1;  portd.b3 =1;}
 if(count==2 && count2==0) { portd.b2 =0;  portd.b0 =0; portd.b1 =1;}
 if(count==2 && count2==3) { portd.b0 =1;  portd.b4 =1;  portd.b1 =0;  portd.b3 =0; }
 if(count==2 && count2==6) { portd.b5 =1;  portd.b4 =0;}
 delay_ms( 1000 );
 if( portc.b4 ==1) {portd=0;break;}
 if(count==3 && count2==7 )break;
 }
 if( portc.b4 ==1) { portd=0;break;}
 }
 }

 else {

  portb =0;

 if ( portc.b5 ==0){
  portd.b5 =0;  portd.b0 =0;
  portd.b4 =1;  portd.b1 =1;
 for(count3=0;count3<4;count3++){ portb =count3<<4;delay_ms( 1000 );}
  portb =0;
  portd.b4 =0;  portd.b1 =0;
  portd.b2 =1;  portd.b3 =1;
 while( portc.b5 ==0 &&  portc.b4 ==1);
 }
 else {
  portd.b2 =0;  portd.b3 =0;
  portd.b4 =1;  portd.b1 =1;
 for(count3=0;count3<4;count3++){ portb =count3<<4;delay_ms( 1000 );}
  portb =0;
  portd.b4 =0;  portd.b1 =0;
  portd.b5 =1;  portd.b0 =1;
 while( portc.b5 ==1 &&  portc.b4 ==1);
 }
 }
#line 102 "C:/Users/W.I/Desktop/Embedded Mikroc/Final Project/Software/Final.c"
 }




}
