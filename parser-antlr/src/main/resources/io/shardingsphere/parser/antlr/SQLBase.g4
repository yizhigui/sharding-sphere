grammar SQLBase ;

import Keyword,Symbol;

itemList:
    LEFT_PAREN item (COMMA  item)* RIGHT_PAREN
    ;
    
item:
	;

STRING: 
	DOUBLE_QUOTA ('\\"'|.)*? DOUBLE_QUOTA
    |SINGLE_QUOTA (SINGLE_QUOTA |.)*? SINGLE_QUOTA
	;
    
NUMBER:
     MINUS? INT DOT [0-9]+ EXP?
     |MINUS? INT | EXP
     |MINUS? INT
     ;
     
fragment INT :
   '0' | [1-9] [0-9]*
   ;
   
EXP :
    E [+\-]? INT
    ;
    
fragment HEX : 
	[0-9a-fA-F] 
	;
	
HEX_DIGIT:
	'0x' HEX+
	|'X' SINGLE_QUOTA HEX+ SINGLE_QUOTA
	;

BIT_NUM:
	('0b' ('0'|'1')+ )
	|
	(B SINGLE_QUOTA ('0'|'1')+ SINGLE_QUOTA) 
	;
	
WS:  
	[ \t\r\n] + ->skip
	;