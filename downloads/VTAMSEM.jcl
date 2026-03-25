//VTAMSEM  JOB Z,'HAESSLER MALDONADO',CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID         
//*********************************************************************         
//* COMPILA USSTAB                                                              
//*********************************************************************         
//ASM      EXEC PGM=ASMA90,REGION=4M,PARM='NODECK,OBJECT'                       
//SYSPRINT DD SYSOUT=*                                                          
//SYSLIB   DD DSNAME=SYS1.MACLIB,DISP=SHR                                       
//         DD DSNAME=SYS1.SISTMAC1,DISP=SHR                                     
//*        DD DSNAME=NETVIEW.V6R4M0.SCNMMAC1,DISP=SHR                           
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(1,1))                                      
//SYSUT2   DD UNIT=SYSDA,SPACE=(CYL,(1,1))                                      
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(1,1))                                      
//SYSLIN   DD DSNAME=&&SYSGO,DISP=(,PASS),UNIT=SYSDA,                           
//         SPACE=(CYL,(1,1))                                                    
//SYSIN    DD DSN=SYS1.VTAMLST(USSTABA),DISP=SHR                                
//LINK     EXEC PGM=HEWL,REGION=4M,COND=(4,LT),                                 
//         PARM='LIST,MAP,XREF,RENT'                                            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUT1   DD SPACE=(CYL,(1,1)),DISP=(NEW,PASS),UNIT=SYSDA                      
//SYSLMOD  DD DSN=SYS1.LINKLIB(USSTABA),DISP=SHR                                
//SYSLIN   DD DSNAME=&&SYSGO,DISP=(OLD,DELETE)                                  
//*