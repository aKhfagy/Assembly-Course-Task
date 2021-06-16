INCLUDE Irvine32.inc ;DO NOT CHANGE THIS LINE

;###################################################################################;#
;							AUTOGRADER RELATED .DATA								;#
;				DO NOT MODIFY, DELETE NOR ADD ANY LINE HERE							;#
;###################################################################################;#
.data																				;#
																					;#
	prmpt byte "Please enter question number 1, 2, 3, 4, 5, 6 or enter 0 to exit:", 0	        ;#
	wrongChoice byte "Please enter a valid question number!", 0						;#
	tmpstr byte 5 dup(?), 0															;#
;###################################################################################;#
																					
;#######################################################							
;				STUDENTS  .DATA	SECTION     		   #							
;		   THIS SECTION MADE FOR STUDENTS' DATA        #							
;      YOU CAN MODIFY, ADD OR EDIT TO THIS SECTION     #							
;#######################################################							
																					
.data																				
;-------------------------Q1 DATA-----------------------	

strQ1 BYTE 10 DUP(?), 0

;-----------------------Q1 DATA End---------------------	


																					
;-------------------------Q2 DATA-----------------------	

infoToEnterPrompt BYTE "Enter the number of elements: ", 0

;-----------------------Q2 DATA End---------------------	


;-------------------------Q3 DATA-----------------------	

numberCharsToEnterPrompt BYTE "Enter the number of characters you want to check: ", 0
firstCharPrompt BYTE "First char: ", 0
lastCharPrompt BYTE "Last char: ", 0
enterCharPrompt BYTE "Enter character: ", 0
answerPrompt BYTE "Number of characters in range is : ", 0

;-----------------------Q3 DATA End---------------------	


;-------------------------Q4 DATA-----------------------	

numberLowerCasePrompt BYTE "The number of lowercase characters in the original string: ", 0
lowerCaseCharsPrompt BYTE "The lowercase characters are: ", 0
strQ4 BYTE 30 DUP(?), 0
lowerCaseChars BYTE 26 DUP(?), 0

;-----------------------Q4 DATA End---------------------	


;-------------------------Q5 DATA-----------------------	

isItPalindromePrompt BYTE "Is it a palindrome?: ", 0
enterStringToCheckPlanindromePrompt BYTE "Enter the string: ", 0
strQ5 BYTE 30 DUP(?), 0

;-----------------------Q5 DATA End---------------------	


;-------------------------Q6 DATA-----------------------	

strQ6 BYTE 39 DUP(?), 0

;-----------------------Q6 DATA End---------------------	
														
														
.code													
;########################################################
;			AUTOGRADER RELATED METHOD			       ;#
;			  DO NOT MODIFY, DELETE					   ;#
;			  NOR ADD ANY LINE HERE					   ;#
;#######################################################
;#######################################################
MAIN PROC											  ;#
	PROGLOOP:										  ;#
		MOV EDX, OFFSET PRMPT						  ;#
		CALL WRITESTRING							  ;#
		CALL CRLF									  ;#
		CALL READINT								  ;#
		CMP EAX, 0									  ;#
		JE FIN										  ;#
													  ;#
		CMP EAX, 1									  ;#
		JE _Q1										  ;#
													  ;#
		CMP EAX, 2									  ;#
		JE _Q2									      ;#
													  ;#		
		CMP EAX, 3									  ;#
		JE _Q3										  ;#
													  ;#
		CMP EAX, 4									  ;#
		JE _Q4										  ;#
													  ;#		
		CMP EAX, 5								      ;#
		JE _Q5										  ;#
													  ;#
		CMP EAX, 6									  ;#
		JE _Q6										  ;#
		JMP WRONG									  ;#
													  ;#
		_Q1:										  ;#
		CALL Q1										  ;#
		JMP CONT									  ;#
													  ;#
		_Q2:										  ;#		
		CALL Q2										  ;#
		JMP CONT									  ;#
													  ;#
		_Q3:										  ;#		
		CALL Q3										  ;#
		JMP CONT									  ;#
													  ;#
		_Q4:										  ;#		
		CALL Q4										  ;#
		JMP CONT									  ;#
													  ;#		
		_Q5:										  ;#		
		CALL Q5										  ;#
		JMP CONT									  ;#
													  ;#
		_Q6:										  ;#		
		CALL Q6										  ;#
		JMP CONT							   		  ;#
												      ;#
		WRONG:										  ;#
		MOV EDX, OFFSET wrongChoice					  ;#
		CALL WRITESTRING							  ;#
		CALL CRLF									  ;#
													  ;#
		CONT:										  ;#
		JMP PROGLOOP								  ;#
													  ;#
		FIN:										  ;#
													  ;#
	EXIT											  ;#
MAIN ENDP											  ;#
;#######################################################


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question one procedure here
;----------------------------------------------------------
;Built-In functions used:
;	ReadString:
;		edx -> OFFSET of the string
;		ecx -> max number of characters allowed
;		eax -> lenght of actual string
;	ReadInt:
;		eax -> number entered by user
;	WriteString:
;		edx -> OFFSET of the string
;	CRLF:
;		Writes new line
;
;Registers Used:
;	edx -> OFFSET of string
;	eax -> length of string
;	esi -> first char to replace (index)
;	edi -> second char to be replaced (index)
;	ebx -> used in swaping (only bl and bh are used)
;----------------------------------------------------------
Q1 PROC uses edx ecx eax esi edi ebx
	; reading the indices of the chars to replace
	CALL ReadInt ; first index
	MOV esi, eax
	CALL ReadInt ; second index
	MOV edi, eax

	; turn index from one based to zero based
	DEC esi
	DEC edi

	; reading the string
	MOV edx, OFFSET strQ1
	MOV ecx, LENGTHOF strQ1
	CALL ReadString

	; swapping part
	MOV bh, [edx + esi] ; store first char in bh
	MOV bl, [edx + edi] ; store second char in bl
	MOV [edx + esi], bl
	MOV [edx + edi], bh

	; write string to console
	CALL WriteString
	CALL CRLF

	RET

Q1 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question two procedure here
;----------------------------------------------------------
;Built-In functions used:
;	ReadInt:
;		eax -> number entered by user
;	WriteInt:
;		eax -> number entered by user
;	WriteString:
;		edx -> OFFSET of the string
;	CRLF:
;		Writes new line
;Registers Used:
;	ecx -> loop counter
;	ebx -> previous fib number
;	eax -> current fib number
;	esi -> temp variable
;	edx -> OFFSET of infoToEnter
;----------------------------------------------------------
Q2 PROC uses ecx eax ebx edx
	; print information string
	MOV edx, OFFSET infoToEnterPrompt
	CALL WriteString

	; Read Number N
	CALL ReadInt
	MOV ecx, eax ; move it to loop register
	MOV ebx, +0 ; first fib number
	MOV eax, ebx

	; +0 is always printed
	CALL WriteInt
	CALL CRLF

	INC eax ; first fib number

	; start of loop
	FIB:
		; write ith fib number
		CALL WriteInt 
		CALL CRLF
		; move numbers
		MOV esi, eax
		ADD eax, ebx
		MOV ebx, esi
	LOOP FIB
	RET

Q2 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question three procedure here
;----------------------------------------------------------
;Built-In functions used:
;	ReadInt:
;		eax -> number entered by user
;	ReadChar:
;		al -> char entered by user
;	WriteInt:
;		eax -> number entered by user
;	WriteString:
;		edx -> OFFSET of the string
;	CRLF:
;		Writes new line
;Registers Used:
;	ecx -> loop counter
;	edx -> OFFSET of string to print to screen
;	eax -> Read integer into
;	ebx -> store low and high integers in bl and bh
;	esi -> Counter
;	al	-> Read Char
;----------------------------------------------------------
Q3 PROC uses edx ecx eax ebx esi
	; get number of chars
	MOV edx, OFFSET numberCharsToEnterPrompt
	CALL WriteString
	CALL ReadInt
	MOV ecx, eax

	; get first char
	MOV edx, OFFSET firstCharPrompt
	CALL WriteString
	CALL ReadChar
	MOV bl, al

	; get last char
	MOV edx, OFFSET lastCharPrompt
	CALL WriteString
	CALL ReadChar
	MOV bh, al

	; initialize counter
	MOV esi, +0

	CHARS_TO_CHECK:
		; get chars
		MOV edx, OFFSET enterCharPrompt
		CALL WriteString
		CALL ReadChar

		; check in range
		CMP al, bl
		JB END_IF
		CMP al, bh
		JA END_IF
			INC esi

		END_IF:

	LOOP CHARS_TO_CHECK

	; display answer
	MOV edx, OFFSET answerPrompt
	CALL WriteString
	MOV eax, esi
	CALL WriteInt
	CALL CRLF

	RET

Q3 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question four procedure here
;----------------------------------------------------------
;Built-In functions used:
;	WriteDec:
;		eax -> unsigned integer 
;	WriteChar:
;		al -> has char to be written
;	ReadString:
;		edx -> OFFSET of the string
;		ecx -> max number of characters allowed
;		eax -> lenght of actual string
;	WriteString:
;		edx -> OFFSET of the string
;	CRLF:
;		Writes new line
;Registers Used:
;	ecx -> loop counter
;	edx -> OFFSET of string to print to screen
;	eax -> the actual size of the input array
;	ebx -> store low and high integers in bl and bh
;	esi -> OFFSET of result string
;	edi -> counter of lower case chars
;----------------------------------------------------------
Q4 PROC uses edx ecx eax ebx esi edi
	
	; Read input string
	MOV edx, OFFSET strQ4
	MOV ecx, LENGTHOF strQ4
	CALL ReadString

	; initialize loop iterator
	MOV ecx, eax

	; initialize counter
	MOV edi, 0

	MOV esi, OFFSET lowerCaseChars

	; bh -> last char
	MOV bh, 'z'
	; bl -> first char
	MOV bl, 'a'

	STRING_LOOP:
		MOV al, [edx] ; mpve char to al

		; IF
		CMP al, bl
		JB END_IF
		CMP al, bh
		JA END_IF

		; add char to answer array and add one to counter
		; also move the start of the answer array
		MOV [esi], al
		INC edi
		INC esi

		END_IF:

		INC edx

	LOOP STRING_LOOP

	MOV edx, OFFSET numberLowerCasePrompt
	CALL WriteString
	MOV eax, edi
	CALL WriteDec
	CALL CRLF
	

	MOV edx, OFFSET lowerCaseCharsPrompt
	CALL WriteString
	; MOV start to edx
	MOV esi, OFFSET lowerCaseChars
	
	; init loop counter again
	MOV ecx, edi

	; to prevent errors with loop
	CMP ecx, 0
	JE END_OUTPUT
	
	; init index
	MOV edi, 0

	OUTPUT_LOOP:
		CMP edi, 0
		; IF
		JE ELSE_COND ; any other index print comma before letter
			MOV al, ','
			CALL WriteChar
			MOV al, [esi]
			CALL WriteChar
			JMP INC_COND

		ELSE_COND: ; start index only print letter
			MOV al, [esi]
			CALL WriteChar
		INC_COND:

		INC edi
		INC esi

	LOOP OUTPUT_LOOP

	CALL CRLF

	END_OUTPUT:

	RET

Q4 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question five procedure here
;----------------------------------------------------------
;Built-In functions used:
;	WriteChar:
;		al -> has char to be written
;	ReadString:
;		edx -> OFFSET of the string
;		ecx -> max number of characters allowed
;		eax -> lenght of actual string
;	WriteString:
;		edx -> OFFSET of the string
;	CRLF:
;		Writes new line
;Registers Used:
;	ecx -> loop counter
;	edx -> OFFSET of string to print to screen
;	eax -> the actual size of the input array
;	ebx -> boolean to see if it is palindrome or not
;	esi -> start index of string (initially)
;	edi -> end index of string (initially)
;----------------------------------------------------------
Q5 PROC uses edx ecx eax esi edi ebx
	; prompt to take string
	MOV edx, OFFSET enterStringToCheckPlanindromePrompt
	CALL WriteString

	; read string and get it ready to be looped on
	MOV edx, OFFSET strQ5
	MOV ecx, LENGTHOF strQ5
	CALL ReadString
	MOV ecx, eax

	; set start and end indexies respectively
	MOV esi, 0
	MOV edi, eax
	DEC edi

	; initialize boolean
	MOV ebx, 1

	PALINDROME_CHECK:
		MOV al, [edx + esi]
		CMP al, [edx + edi]
		JE END_CHECK
			MOV ebx, 0
		END_CHECK:

		; move indecies
		INC esi
		DEC edi
	LOOP PALINDROME_CHECK

	CMP ebx, 1
	JE IS_PALINDROME
		MOV al, 'N'
		JMP NEXT
	IS_PALINDROME:
		MOV al, 'Y'
	NEXT:

	MOV edx, OFFSET isItPalindromePrompt
	CALL WriteString
	CALL WriteChar
	CALL CRLF

	RET

Q5 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question six procedure here
;----------------------------------------------------------
;Built-In functions used:
;	ReadInt:
;		eax -> read number to it
;	WriteString:
;		edx -> OFFSET of the string
;	CRLF:
;		Writes new line
;Registers Used:
;	ecx -> loop counter
;	edx -> OFFSET of string to print to screen
;	eax -> N, number of lines required
;	bl  -> Char to place in array
;	esi -> index offset
;	edi -> OFFSET of middle of array
;----------------------------------------------------------
Q6 PROC uses edx ecx eax esi edi
	; Read N
	CALL ReadInt

	; Init counter
	MOV ecx, eax

	; set offset
	MOV edx, OFFSET strQ6

	FILL_N_SPACES:
		MOV bl, ' '
		MOV [edx], bl
		INC edx
	LOOP FILL_N_SPACES

	; get last index and move * to it
	DEC edx
	MOV bl, '*'
	MOV [edx], bl
	; set to correct offset
	MOV edx, OFFSET strQ6
	CALL WriteString
	CALL CRLF

	; prevent errors
	CMP eax, 1
	JE NEXT

	; set loop counter
	DEC eax
	MOV ecx, eax

	; set index offset
	MOV esi, 1

	; set char to set to *
	MOV bl, '*'

	; set offset of mid char
	MOV edi, OFFSET strQ6
	ADD edi, eax

	; set one character before and after the last and first * in the array
	; print the array to the screen after that
	ITERATE:
		MOV [edi + esi], bl
		SUB edi, esi
		MOV [edi], bl
		ADD edi, esi
		INC esi
		CALL WriteString
		CALL CRLF
	LOOP ITERATE

	NEXT:
	
	RET

Q6 ENDP

END MAIN