; Listing generated by Microsoft (R) Optimizing Compiler Version 19.13.26128.0 

	TITLE	C:\hub\cryptarm\xtea\t2.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_xtea
; Function compile flags: /Ogspy
; File c:\hub\cryptarm\xtea\t2.c
;	COMDAT _xtea
_TEXT	SEGMENT
_mk$ = 8						; size = 4
tv335 = 12						; size = 4
_p$ = 12						; size = 4
_xtea	PROC						; COMDAT

; 30   : void xtea(void*mk,void*p){

	push	ebx
	push	ebp
	push	esi
	push	edi

; 31   :     unsigned int t,i=65,s=0,*k=mk,*x=p;

	mov	edi, DWORD PTR _p$[esp+12]
	xor	esi, esi
	push	64					; 00000040H
	pop	ebx
	mov	edx, DWORD PTR [edi]
	mov	ebp, DWORD PTR [edi+4]
	mov	DWORD PTR tv335[esp+12], edx
$LL2@xtea:

; 32   : 
; 33   :     while(--i)t=x[1],x[1]=*x+=((((t<<4)^(t>>5))+t)^(s+k[((i&1)?s+=0x9E3779B9,s>>11:s)&3])),*x=t;

	mov	ecx, ebx
	and	ecx, 1
	je	SHORT $LN5@xtea
	lea	edx, DWORD PTR [esi-1640531527]
	shr	edx, 11					; 0000000bH
	jmp	SHORT $LN6@xtea
$LN5@xtea:
	mov	edx, esi
$LN6@xtea:
	test	ecx, ecx
	lea	eax, DWORD PTR [esi-1640531527]
	mov	ecx, ebp
	cmove	eax, esi
	shr	ecx, 5
	mov	esi, eax
	and	edx, 3
	mov	eax, ebp
	shl	eax, 4
	xor	ecx, eax
	mov	eax, DWORD PTR _mk$[esp+12]
	add	ecx, ebp
	mov	eax, DWORD PTR [eax+edx*4]
	add	eax, esi
	mov	DWORD PTR [edi], ebp
	xor	ecx, eax
	mov	eax, DWORD PTR tv335[esp+12]
	add	eax, ecx
	mov	DWORD PTR tv335[esp+12], ebp
	mov	DWORD PTR [edi+4], eax
	mov	ebp, eax
	sub	ebx, 1
	jne	SHORT $LL2@xtea

; 34   : }

	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret	0
_xtea	ENDP
_TEXT	ENDS
END
