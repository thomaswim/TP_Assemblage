		

;************************************************************************
	THUMB	
	REQUIRE8
	PRESERVE8
;************************************************************************

	include REG_UTILES.inc


;************************************************************************
; 					IMPORT/EXPORT Système
;************************************************************************

	IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]




; IMPORT/EXPORT de procédure           

	IMPORT Init_Cible
	

	EXPORT main
	
;*******************************************************************************


;*******************************************************************************
	AREA  mesdonnees, data, readwrite

	


;*******************************************************************************
	
	AREA  moncode, code, readonly
		

;*******************************************************************************
; Procédureallumer LED
;*******************************************************************************
Allume_LED	PROC
	
	






;*******************************************************************************
; Procédure principale et point d'entrée du projet
;*******************************************************************************
main  	PROC 
;*******************************************************************************

		
		MOV R0,#0
		BL Init_Cible;
		
SET		LDR R1,=GPIOBASEB;Adresse du set GPIOB (0X40010C00 + 0x10)
		ADD R2,R1,#OffsetSet
RESET	ADD R3,R1,#OffsetReset ;Adresse du set GPIOB (0X40010C00 + 0x14)
		
		MOV R4,#0x01
		LSL R4,#10
		STRH R4,[R2] ;Allumer la led avc le SET
		STRH R4,[R3] ; etteidre la led avec le RESET
		
ETATB	ADD R2,R1,#OffsetOutput ;Addr output
		LDRH R3,[R2] ;contenue de output
		ORR R3,R4
		STRH R3,[R2]
		
		LDRH R3,[R2] ;contenue de output
		MVN R4,R4 ;negation de R4
		AND R3,R4
		STRH R3,[R2]
		
		
		
		
		
		B .			 ; boucle inifinie terminale...




		ENDP

	END

;*******************************************************************************
