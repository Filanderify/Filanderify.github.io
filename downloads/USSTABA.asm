* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* DATE        : 22/03/2026                                            *
* APLICACION  : LOGON                                                 *
* MODULO      : USSTABA                                               *
* TYPE PGM    : MACROS ASSEMBLER                                      *
* DESCRIPTION : APLICATION LOGON SCREEN FOR VTAM                      *
* DEVELOPER   : HAESSLER MALDONADO                                    *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
         MACRO                                                         
&NAME    SCREEN &MSG=ª,&TEXT=ª                                         
         AIF   ('&MSG' EQ 'ª' OR '&TEXT' EQ 'ª').END                   
         LCLC  &BFNAME,&BFSTART,&BFEND                                 
*>>                                                                    
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                     VARIABLES DE COLORES                           
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                                                                    
&BLUE    SETC  'X''2902C0F842F1'''                SFE HI,SKIP,BLUE     
&RED     SETC  'X''2902C0F842F2'''                SFE HI,SKIP,RED      
&PINK    SETC  'X''2902C0F842F3'''                SFE HI,SKIP,PINK     
&GREEN   SETC  'X''2902C0F842F4'''                SFE HI,SKIP,GREEN    
&TURQ    SETC  'X''2902C0F842F5'''                SFE HI,SKIP,TURQ     
&YELLOW  SETC  'X''2902C0F842F6'''                SFE HI,SKIP,YELLOW   
&WHITE   SETC  'X''2902C0F842F7'''                SFE HI,SKIP,WHITE    
*>>                                                                    
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                       COLORES DE FONDO                             
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                                                                    
&BBLUE   SETC  'X''290341F2C0F842F1'''            BLUE   BACKFROUND    
&BRED    SETC  'X''290341F2C0F842F2'''            RED    BACKFROUND    
&BPINK   SETC  'X''290341F2C0F842F3'''            PINK   BACKFROUND    
&BGREEN  SETC  'X''290341F2C0F842F4'''            GREEN  BACKFROUND    
&BTURQ   SETC  'X''290341F2C0F842F5'''            TURQ   BACKFROUND    
&BYELLOW SETC  'X''290341F2C0F842F6'''            YELLOW BACKFROUND    
&BWHITE  SETC  'X''290341F2C0F842F7'''            WHITE  BACKFROUND    
*>>                                                                    
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                       COLORES CON BLINK                            
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                                                                    
&HBLUE   SETC  'X''290341F1C0F042F1'''            BLUE   BLINK         
&HRED    SETC  'X''290341F1C0F042F2'''            RED    BLINK         
&HPINK   SETC  'X''290341F1C0F042F3'''            PINK   BLINK         
&HGREEN  SETC  'X''290341F1C0F042F4'''            GREEN  BLINK         
&HTURQ   SETC  'X''290341F1C0F042F5'''            TURQ   BLINK         
&HYELLOW SETC  'X''290341F1C0F042F6'''            YELLOW BLINK         
&HWHITE  SETC  'X''290341F1C0F042F7'''            WHITE  BLINK         
*>>                                                                    
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                         BIGIN PROGRAM                              
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                                                                    
&BFNAME  SETC  'BUF'.'&MSG'                                            
&BFBEGIN SETC  '&BFNAME'.'B'                                           
&BFEND   SETC  '&BFNAME'.'E'                                           
.BEGIN   DS    0F                                                      
&BFNAME  DC    AL2(&BFEND-&BFBEGIN)                                    
&BFBEGIN DC    X'F5'                     ERASE WRITE COMMAND           
         DC    X'C7'                     WCC ALARM (7A)                
         DC    X'11'                     SET BUFFER ADDRESS ORDER      
         DC    X'40C0'                   LINE 1 COLUMN 2               
         DC    &BTURQ                    COLOR TURQUISE                
         DC    C'                                       '               
         DC    C'                                       '               
         DC    &WHITE                    COLOR BLANCO                   
         DC    &BTURQ                    FONDO TURQUESA                 
         DC    C'  '                                                    
         DC    &GREEN                    COLOR VERDE                    
         DC    C'DATE  :'                                               
         DC    X'1DF8'                                                  
         DC    C'@@@@DATE'                                              
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C1E9'                   LINE 2 COLUMN 26               
         DC    &YELLOW                   COLOR AMARILLO                 
         DC    C'IBM z/OS Standard Development'                         
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C24D'                   LINE 2 COLUMN 61               
         DC    &GREEN                    COLOR VERDE                    
         DC    C'TIME:'                                                 
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C2D3'                   LINE 2 COLUMN 68               
         DC    &WHITE                    COLOR BLANCO                   
         DC    C'@@@@TIME'                                              
         DC    &BTURQ                    FONDO TURQUESA                   
         DC    C'  '                                                      
         DC    &WHITE                    COLOR BLANCO                     
         DC    X'11'                     SET BUFFER ADDRESS ORDER         
         DC    X'C260'                   LINE 3 COLUMN 1                  
         DC    &BTURQ                    FONDO TURQUESA                   
         DC    C'  '                                                      
         DC    &WHITE                    COLOR BLANCO                     
         DC    X'11'                     SET BUFFER ADDRESS ORDER         
         DC    X'C2E3'                   LINE 3 COLUMN 4                  
         DC    &GREEN                    COLOR VERDE                      
         DC    C'IPADDR:'                                                 
         DC    X'11'                     SET BUFFER ADDRESS ORDER         
         DC    X'C26B'                                                    
         DC    &WHITE                    COLOR BLANCO                     
         DC    C'@@@@@@@@@IPADDR'                                         
         DC    X'11'                     SET BUFFER ADDRESS ORDER         
         DC    X'C3C5'                   LINE 3 COLUMN 38                 
         DC    &RED                      COLOR ROJO                       
         DC    C'VS01'                                                    
         DC    X'11'                     SET BUFFER ADDRESS ORDER         
         DC    X'C35D'                   LINE 3 COLUMN 62              
         DC    &GREEN                    COLOR VERDE                   
         DC    C'TERM:'                                                
         DC    &WHITE                    COLOR BLANCO                  
         DC    C'@@LUNAME'                                             
         DC    X'11'                     SET BUFFER ADDRESS ORDER      
         DC    X'C36C'                   LINE 3 COLUMN 77              
         DC    &BTURQ                    FONDO TURQUESA                
         DC    C'  '                                                   
         DC    &WHITE                    COLOR BLANCO                  
         DC    X'11'                     SET BUFFER ADDRESS ORDER      
         DC    X'C3F0'                   LINE 4 COLUMN 1               
         DC    &BTURQ                    FONDO TURQUESA                
         DC    C'  '                                                   
         DC    &WHITE                    COLOR BLANCO                  
         DC    X'11'                     SET BUFFER ADDRESS ORDER      
         DC    X'C44D'                   LINE 4 COLUMN 30              
         DC    &YELLOW                   COLOR AMARILLO                
         DC    C'IBM z15 | z/OS v3.1'                                  
         DC    X'11'                     SET BUFFER ADDRESS ORDER      
         DC    X'C47C'                   LINE 4 COLUMN 77              
         DC    &BTURQ                    FONDO TURQUESA                 
         DC    C'  '                                                    
         DC    &WHITE                    COLOR BLANCO                   
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C540'                   LINE 5 COLUMN 1                
         DC    &BTURQ                    FONDO TURQUESA                 
         DC    C'                                       '               
         DC    C'                                       '               
         DC    &WHITE                    COLOR BLANCO                   
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C650'                   LINE 6 COLUMN 1                
         DC    &WHITE                    COLOR BLANCO                   
         DC    C'                                        '              
         DC    C'                                        '              
         DC    &WHITE                                                   
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C8C2'                   LINE 7 COLUMN 35               
         DC    &GREEN                    COLOR VERDE                    
         DC    C'//  OOOOOOO    SSSSS'                                  
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'C9D1'                   LINE 8 COLUMN 34               
         DC    &GREEN                    COLOR VERDE                    
         DC    C'//  OO     OO SS'                                      
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'4AD9'                   LINE 9 COLUMN 10               
         DC    &GREEN                    COLOR VERDE                    
         DC    C'zzzzzz //  OO     OO SS'                               
         DC    X'11'                                                    
         DC    X'4B6B'                   LINE 10 COLUMN 28              
         DC    &GREEN                    COLOR VERDE                    
         DC    C'zz  //  OO     OO SSSS'                                
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'4CF9'                   LINE 11 COLUMN 26              
         DC    &GREEN                    COLOR VERDE                    
         DC    C'zz   //  OO     OO      SS'                            
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'4EC7'                   LINE 12 COLUMN 24              
         DC    &GREEN                    COLOR VERDE                    
         DC    C'zz    //  OO     OO      SS'                           
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'4FD5'                   LINE 13 COLUMN 12              
         DC    &GREEN                    COLOR VERDE                    
         DC    C'zzzzzz //    OOOOOOO  SSSS'                            
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'4FF4'                   LINE 13 COLUMN 53              
         DC    &WHITE                    COLOR BLANCO                   
         DC    C'HERCULES'                                              
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'D160'                   LINE 15 COLUMN 1               
         DC    &RED                      COLOR ROJO                     
         DC    C'CICS V6.1              DFSORT and ICETO'               
         DC    C'OL         ISPF            z/OSMF      '               
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'D2F0'                   LINE 16 COLUMN 1               
         DC    &RED                      COLOR ROJO                     
         DC    C'COBOL V6.4             IMS DB/DC V15.1 '               
         DC    C'           JAVA            RSED        '               
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'D440'                   LINE 17 COLUMN 1               
         DC    &RED                      COLOR ROJO                     
         DC    C'DB2 V13.1              SDSF            '               
         DC    C'           JES2            MQSeries    '               
         DC    X'11'                     SET BUFFER ADDRESS ORDER       
         DC    X'D550'                   LINE 18 COLUMN 1            
         DC    &RED                      COLOR ROJO                  
         DC    C'Debug Tool             UNIX System Serv'            
         DC    C'ices       REXX            zOS Connect '            
         DC    X'11'                     SET BUFFER ADDRESS ORDER    
         DC    X'D7F4'                   COLUMN 47                   
         DC    &TURQ                     COLOR TURQUESA              
         DC    C'T (TSO)  = TSO/ISPF  C (CICS) = CICSTS61'           
         DC    X'11'                     SET BUFFER ADDRESS ORDER    
         DC    X'D9C4'                   LINE 21 COLUMN 5            
         DC    &TURQ                     COLOR TURQUESA              
         DC    C'N (NETV) = NETVIEW   I (IMS)  = IMS15APL'           
         DC    X'11'                     SET BUFFER ADDRESS ORDER    
         DC    X'5B60'                   LINE 23 COLUMN 1            
         DC    &HYELLOW                  BLINK AMARILLO MENSAJES     
         DC    C&TEXT                    USS MESSAGES                
         DC    X'11'                     SET BUFFER ADDRESS ORDER    
         DC    X'5CF0'                   LINE 24 COLUMN 1            
         DC    &GREEN                                                
         DC    C'Comando ===>'                                       
         DC    X'1D4013'                                             
&BFEND   EQU   *                                                       
.END     MEND                                                          
USSTABA  USSTAB   TABLE=STDTRANS,FORMAT=DYNAMIC,DATEFRM=DMY            
         SPACE 4                                                       
*>>                                                                    
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                           COMANDOS                                 
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*>>                                                                    
LOGON    USSCMD  CMD=LOGON,FORMAT=BAL                                  
         USSPARM PARM=P1,REP=DATA                                      
         USSPARM PARM=APPLID,DEFAULT=A06TSO                            
         USSPARM PARM=LOGMODE                                          
L        USSCMD  CMD=L,REP=LOGON,FORMAT=PL1                            
         USSPARM PARM=APPLID,DEFAULT=A06TSO                            
         USSPARM PARM=LOGMODE                                          
         USSPARM PARM=DATA                                             
LOGOFF   USSCMD  CMD=LOGOFF,FORMAT=PL1                                 
         USSPARM PARM=APPLID                                           
         USSPARM PARM=TYPE,DEFAULT=UNCOND                              
         USSPARM PARM=HOLD,DEFAULT=YES                                 
CICSTS6A USSCMD  CMD=C,REP=LOGON,FORMAT=PL1                           
         USSPARM PARM=APPLID,DEFAULT=CICSTS61                         
         USSPARM PARM=LOGMODE                                         
         USSPARM PARM=DATA                                            
CICSTS6B USSCMD  CMD=CICS,REP=LOGON,FORMAT=PL1                        
         USSPARM PARM=APPLID,DEFAULT=CICSTS61                         
         USSPARM PARM=LOGMODE                                         
         USSPARM PARM=DATA                                            
CNM01    USSCMD  CMD=N,REP=LOGON,FORMAT=PL1                           
         USSPARM PARM=APPLID,DEFAULT=CNM01                            
         USSPARM PARM=LOGMODE                                         
         USSPARM PARM=DATA                                            
CNM02    USSCMD  CMD=NETV,REP=LOGON,FORMAT=PL1                        
         USSPARM PARM=APPLID,DEFAULT=CNM01                            
         USSPARM PARM=LOGMODE                                         
         USSPARM PARM=DATA                                            
CNM03    USSCMD  CMD=NETVIEW,REP=LOGON,FORMAT=PL1                     
         USSPARM PARM=APPLID,DEFAULT=CNM01                            
         USSPARM PARM=LOGMODE                                         
         USSPARM PARM=DATA                                            
TSO1     USSCMD  CMD=T,REP=LOGON,FORMAT=PL1                           
         USSPARM PARM=APPLID,DEFAULT=TSO                               
         USSPARM PARM=LOGMODE                                          
         USSPARM PARM=DATA                                             
TSO2     USSCMD  CMD=TSO,REP=LOGON,FORMAT=PL1                          
         USSPARM PARM=APPLID,DEFAULT=TSO                               
         USSPARM PARM=LOGMODE                                          
         USSPARM PARM=DATA                                             
IMS15APL USSCMD  CMD=I,REP=LOGON,FORMAT=PL1                            
         USSPARM PARM=APPLID,DEFAULT=IMS15APL                          
         USSPARM PARM=LOGMODE                                          
         USSPARM PARM=DATA                                             
IMS15AP1 USSCMD  CMD=IMS,REP=LOGON,FORMAT=PL1                          
         USSPARM PARM=APPLID,DEFAULT=IMS15APL                          
         USSPARM PARM=LOGMODE                                          
         USSPARM PARM=DATA                                             
         USSMSG MSG=00,BUFFER=(BUF00,SCAN)                             
         USSMSG MSG=01,BUFFER=(BUF01,SCAN)                             
         USSMSG MSG=02,BUFFER=(BUF02,SCAN)                             
         USSMSG MSG=03,BUFFER=(BUF03,SCAN)                             
         USSMSG MSG=04,BUFFER=(BUF04,SCAN)                             
         USSMSG MSG=05,BUFFER=(BUF05,SCAN)                             
         USSMSG MSG=06,BUFFER=(BUF06,SCAN)                              
         USSMSG MSG=07,BUFFER=(BUF07,SCAN)                              
         USSMSG MSG=08,BUFFER=(BUF08,SCAN)                              
         USSMSG MSG=09,BUFFER=(BUF09,SCAN)                              
         USSMSG MSG=10,BUFFER=(BUF10,SCAN)                              
         USSMSG MSG=11,BUFFER=(BUF11,SCAN)                              
         USSMSG MSG=12,BUFFER=(BUF12,SCAN)                              
         USSMSG MSG=13,BUFFER=(BUF13,SCAN)                              
         USSMSG MSG=14,BUFFER=(BUF14,SCAN)                              
STDTRANS DC       X'000102030440060708090A0B0C0D0E0F'                   
         DC       X'101112131415161718191A1B1C1D1E1F'                   
         DC       X'202122232425262728292A2B2C2D2E2F'                   
         DC       X'303132333435363738393A3B3C3D3E3F'                   
         DC       X'404142434445464748494A4B4C4D4E4F'                   
         DC       X'505152535455565758595A5B5C5D5E5F'                   
         DC       X'606162636465666768696A6B6C6D6E6F'                   
         DC       X'707172737475767778797A7B7C7D7E7F'                   
         DC       X'80C1C2C3C4C5C6C7C8C98A8B8C8D8E8F'                   
         DC       X'90D1D2D3D4D5D6D7D8D99A9B9C9D9E9F'                   
         DC       X'A0A1E2E3E4E5E6E7E8E9AAABACADAEAF'                   
         DC       X'B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF'                   
         DC       X'C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF'                    
         DC       X'D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF'                    
         DC       X'E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF'                    
         DC       X'F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF'                    
END      USSEND                                                          
*>>                                                                      
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
*>>                            MENSAJES                                  
*>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
*>>                                                                      
         SCREEN   MSG=00,TEXT='LOGGING INTO THE APP'                     
         SCREEN   MSG=01,TEXT='Invalid command syntax'                   
         SCREEN   MSG=02,TEXT='SELECT AN OPTION OR ENTER A COMMAND'      
         SCREEN   MSG=03,TEXT='Invalid parameter'                        
         SCREEN   MSG=04,TEXT='Invalid parameter value'                  
         SCREEN   MSG=05,TEXT='Function not supported'                   
         SCREEN   MSG=06,TEXT='Sequence error'                           
         SCREEN   MSG=07,TEXT='%(1) UNABLE TO LOG IN - %(2) ERROR WITH S-
               SENSE %(3)'                                               
         SCREEN   MSG=08,TEXT='Insufficient memory'                      
         SCREEN   MSG=09,TEXT='Magnetic card error'                      
         SCREEN   MSG=10,TEXT='                          '              
         SCREEN   MSG=11,TEXT='Session ended'                           
         SCREEN   MSG=12,TEXT='Required or omitted parameter'           
         SCREEN   MSG=13,TEXT='IBMECHO   '                              
         SCREEN   MSG=14,TEXT='USS MESSAGE % Undefined'                 
         END     ,                                                      
         