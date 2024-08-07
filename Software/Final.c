#define Display portb
#define LED_RED1 portd.b0
#define LED_YELLOW1 portd.b1
#define LED_GREEN1 portd.b2
#define LED_RED2 portd.b3
#define LED_YELLOW2 portd.b4
#define LED_GREEN2 portd.b5
#define SW_M_A portc.b4
#define SW_M portc.b5
#define Wait 1000
int count=0, count2=0 , count3=0;
void main() {
       adcon1=0x07;
       trisc=0b00110000;
       trisa=1;
       trisb=0;
       trisd=0;
       portc=15;
       Display=0;
       portd=0;
       // Automatic
       for( ; ; ){
         if(SW_M_A==0){
               portd=0;
               for(count=0;count<=3;count++){
                    Display=count;
                    for(count2=0;count2<=9;count2++){
                        Display=(count2<<4) | count;
                        if(count==0 && count2==0) {LED_GREEN1=1;  LED_RED2=1;}
                        if(count==2 && count2==0) {LED_GREEN1=0; LED_RED1=0;LED_YELLOW1=1;}
                        if(count==2 && count2==3) {LED_RED1=1; LED_YELLOW2=1; LED_YELLOW1=0; LED_RED2=0; }
                        if(count==2 && count2==6) {LED_GREEN2=1; LED_YELLOW2=0;}
                        delay_ms(Wait);
                        if(SW_M_A==1) {portd=0;break;}
                        if(count==3 && count2==7 )break;
                    }
                    if(SW_M_A==1) { portd=0;break;}
               }
            }
             // Manual
         else {
              // Automatic OFF
              Display=0;
              // Manual ON
              if (SW_M==0){  //West Street
                  LED_GREEN2=0;   LED_RED1=0;
                  LED_YELLOW2=1;  LED_YELLOW1=1;
                  for(count3=0;count3<4;count3++){Display=count3<<4;delay_ms(Wait);}
                  Display=0;
                  LED_YELLOW2=0;  LED_YELLOW1=0;
                  LED_GREEN1=1;  LED_RED2=1;
                  while(SW_M==0 && SW_M_A==1);
                  }
              else {     //South Street
                  LED_GREEN1=0;   LED_RED2=0;
                  LED_YELLOW2=1;  LED_YELLOW1=1;
                  for(count3=0;count3<4;count3++){Display=count3<<4;delay_ms(Wait);}
                  Display=0;
                  LED_YELLOW2=0;  LED_YELLOW1=0;
                  LED_GREEN2=1;   LED_RED1=1;
                  while(SW_M==1 && SW_M_A==1);
                  }
                  }
//                         Manual
//           else {
//                 Automatic OFF
//                Display=0;
//                 Manual ON
//                if (SW_M==0){  //West Street
//                    LED_GREEN2=0;   LED_RED1=1;
//                    LED_YELLOW2=1;  LED_YELLOW1=0;
//                    for(count3=0;count3<4;count3++){
//                    Display=count3<<4;delay_ms(Wait);if(SW_M==1) {portd=0;break;}}
//                    Display=0;
//                    LED_YELLOW2=0;  LED_YELLOW1=1; LED_RED1=0;  LED_RED2=1;
//                    for(count3=0;count3<4;count3++){
//                    Display=count3<<4;delay_ms(Wait);if(SW_M==1) {portd=0;break;}}
//                    Display=0;
//                    LED_GREEN1=1;  LED_RED2=1; LED_YELLOW1=0;
//                    while(SW_M==0 && SW_M_A==1);
//                    }
//                else {     //South Street
//                    LED_GREEN1=0;   LED_RED2=1;
//                    LED_YELLOW2=0;  LED_YELLOW1=1;
//                    for(count3=0;count3<4;count3++){
//                    Display=count3<<4;delay_ms(Wait);if(SW_M==0) {portd=0;break;}}
//                    Display=0;
//                    LED_YELLOW2=1;  LED_YELLOW1=0; LED_RED2=0;    LED_RED1=1;
//                    for(count3=0;count3<4;count3++){
//                    Display=count3<<4;delay_ms(Wait);if(SW_M==0) {portd=0;break;}}
//                    Display=0;
//                    LED_GREEN2=1;   LED_RED1=1;   LED_YELLOW2=0;
//                    while(SW_M==1 && SW_M_A==1);
//                    }
//                    }
//
//
//
//
//

                  }


         
         
}