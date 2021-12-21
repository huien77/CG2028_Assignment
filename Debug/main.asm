   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 61736D3A 		.ascii	"asm: class = %d \012\000"
  21      20636C61 
  21      7373203D 
  21      20256420 
  21      0A00
  22 0012 0000     		.align	2
  23              	.LC2:
  24 0014 4320203A 		.ascii	"C  : class = %d \012\000"
  24      20636C61 
  24      7373203D 
  24      20256420 
  24      0A00
  25 0026 0000     		.align	2
  26              	.LC0:
  27 0028 0F000000 		.word	15
  28 002c 14000000 		.word	20
  29              		.section	.text.main,"ax",%progbits
  30              		.align	2
  31              		.global	main
  32              		.thumb
  33              		.thumb_func
  35              	main:
  36              	.LFB0:
  37              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define k 1
   3:../src/main.c **** 
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment, Sem 1, AY 2021/22
   6:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2021
   7:../src/main.c **** 
   8:../src/main.c **** extern int classification(int N, int* points, int* label, int* sample); // asm implementation
   9:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample); // reference C implementation
  10:../src/main.c **** 
  11:../src/main.c **** int main(void)
  12:../src/main.c **** {
  38              		.loc 1 12 0
  39              		.cfi_startproc
  40              		@ args = 0, pretend = 0, frame = 40
  41              		@ frame_needed = 1, uses_anonymous_args = 0
  42 0000 90B5     		push	{r4, r7, lr}
  43              	.LCFI0:
  44              		.cfi_def_cfa_offset 12
  45              		.cfi_offset 14, -4
  46              		.cfi_offset 7, -8
  47              		.cfi_offset 4, -12
  48 0002 8BB0     		sub	sp, sp, #44
  49              	.LCFI1:
  50              		.cfi_def_cfa_offset 56
  51 0004 00AF     		add	r7, sp, #0
  52              	.LCFI2:
  53              		.cfi_def_cfa_register 7
  13:../src/main.c **** 	//variables
  14:../src/main.c **** 	//int N = 8;
  15:../src/main.c **** 	int N = 2;
  54              		.loc 1 15 0
  55 0006 4FF00203 		mov	r3, #2
  56 000a 7B62     		str	r3, [r7, #36]
  16:../src/main.c **** 	// think of the values below as numbers of the form x.y
  17:../src/main.c **** 	// (decimal fixed point with 1 fractional decimal digits precision)
  18:../src/main.c **** 	// which are scaled up to allow them to be used integers
  19:../src/main.c **** 
  20:../src/main.c **** 	//int points[16] = {35, 0, 0, 15, 10, 10, 10, 0, 30, 0, 30, 10, 40, 0, 40, 10};
  21:../src/main.c **** 	//int label[8] = {1, 1, 0, 0, 1, 0, 1, 0};
  22:../src/main.c **** 	//int sample[2] = {15, 20};
  23:../src/main.c **** 
  24:../src/main.c **** 	int points[4] = {35, 0, 0, 0};
  57              		.loc 1 24 0
  58 000c 4FF02303 		mov	r3, #35
  59 0010 7B61     		str	r3, [r7, #20]
  60 0012 4FF00003 		mov	r3, #0
  61 0016 BB61     		str	r3, [r7, #24]
  62 0018 4FF00003 		mov	r3, #0
  63 001c FB61     		str	r3, [r7, #28]
  64 001e 4FF00003 		mov	r3, #0
  65 0022 3B62     		str	r3, [r7, #32]
  25:../src/main.c **** 	int label[2] = {100, 0};
  66              		.loc 1 25 0
  67 0024 4FF06403 		mov	r3, #100
  68 0028 FB60     		str	r3, [r7, #12]
  69 002a 4FF00003 		mov	r3, #0
  70 002e 3B61     		str	r3, [r7, #16]
  26:../src/main.c **** 	int sample[2] = {15, 20};
  71              		.loc 1 26 0
  72 0030 40F20003 		movw	r3, #:lower16:.LC0
  73 0034 C0F20003 		movt	r3, #:upper16:.LC0
  74 0038 07F10402 		add	r2, r7, #4
  75 003c 93E80300 		ldmia	r3, {r0, r1}
  76 0040 82E80300 		stmia	r2, {r0, r1}
  27:../src/main.c **** 	// Call assembly language function to perform classification
  28:../src/main.c **** 	printf( "asm: class = %d \n", classification(N, points, label, sample) ) ;
  77              		.loc 1 28 0
  78 0044 40F20004 		movw	r4, #:lower16:.LC1
  79 0048 C0F20004 		movt	r4, #:upper16:.LC1
  80 004c 07F11401 		add	r1, r7, #20
  81 0050 07F10C02 		add	r2, r7, #12
  82 0054 07F10403 		add	r3, r7, #4
  83 0058 786A     		ldr	r0, [r7, #36]
  84 005a FFF7FEFF 		bl	classification
  85 005e 0346     		mov	r3, r0
  86 0060 2046     		mov	r0, r4
  87 0062 1946     		mov	r1, r3
  88 0064 FFF7FEFF 		bl	printf
  29:../src/main.c **** 	printf( "C  : class = %d \n", classification_c(N, points, label, sample) ) ;
  89              		.loc 1 29 0
  90 0068 40F20004 		movw	r4, #:lower16:.LC2
  91 006c C0F20004 		movt	r4, #:upper16:.LC2
  92 0070 07F11401 		add	r1, r7, #20
  93 0074 07F10C02 		add	r2, r7, #12
  94 0078 07F10403 		add	r3, r7, #4
  95 007c 786A     		ldr	r0, [r7, #36]
  96 007e FFF7FEFF 		bl	classification_c
  97 0082 0346     		mov	r3, r0
  98 0084 2046     		mov	r0, r4
  99 0086 1946     		mov	r1, r3
 100 0088 FFF7FEFF 		bl	printf
 101              	.L2:
  30:../src/main.c **** 
  31:../src/main.c **** 	while (1); //halt
 102              		.loc 1 31 0 discriminator 1
 103 008c FEE7     		b	.L2
 104              		.cfi_endproc
 105              	.LFE0:
 107 008e 00BF     		.section	.text.classification_c,"ax",%progbits
 108              		.align	2
 109              		.global	classification_c
 110              		.thumb
 111              		.thumb_func
 113              	classification_c:
 114              	.LFB1:
  32:../src/main.c **** }
  33:../src/main.c **** 
  34:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample)
  35:../src/main.c **** { 	// The implementation below is meant only for verifying your results.
 115              		.loc 1 35 0
 116              		.cfi_startproc
 117              		@ args = 0, pretend = 0, frame = 40
 118              		@ frame_needed = 1, uses_anonymous_args = 0
 119              		@ link register save eliminated.
 120 0000 2DE9F003 		push	{r4, r5, r6, r7, r8, r9}
 121              	.LCFI3:
 122              		.cfi_def_cfa_offset 24
 123              		.cfi_offset 9, -4
 124              		.cfi_offset 8, -8
 125              		.cfi_offset 7, -12
 126              		.cfi_offset 6, -16
 127              		.cfi_offset 5, -20
 128              		.cfi_offset 4, -24
 129 0004 8AB0     		sub	sp, sp, #40
 130              	.LCFI4:
 131              		.cfi_def_cfa_offset 64
 132 0006 00AF     		add	r7, sp, #0
 133              	.LCFI5:
 134              		.cfi_def_cfa_register 7
 135 0008 F860     		str	r0, [r7, #12]
 136 000a B960     		str	r1, [r7, #8]
 137 000c 7A60     		str	r2, [r7, #4]
 138 000e 3B60     		str	r3, [r7, #0]
 139              		.loc 1 35 0
 140 0010 6B46     		mov	r3, sp
 141 0012 1E46     		mov	r6, r3
  36:../src/main.c **** 	
  37:../src/main.c **** 	int i,j,n;
  38:../src/main.c **** 	int class;// returned labels of k=1 nearest neighbors
  39:../src/main.c **** 	int d[N]; // squared Euclidean distance
 142              		.loc 1 39 0
 143 0014 F868     		ldr	r0, [r7, #12]
 144 0016 00F1FF33 		add	r3, r0, #-1
 145 001a 7B61     		str	r3, [r7, #20]
 146 001c 0146     		mov	r1, r0
 147 001e 0A46     		mov	r2, r1
 148 0020 4FF00003 		mov	r3, #0
 149 0024 4FEAD261 		lsr	r1, r2, #27
 150 0028 4FEA4319 		lsl	r9, r3, #5
 151 002c 41EA0909 		orr	r9, r1, r9
 152 0030 4FEA4218 		lsl	r8, r2, #5
 153 0034 0146     		mov	r1, r0
 154 0036 0A46     		mov	r2, r1
 155 0038 4FF00003 		mov	r3, #0
 156 003c 4FEAD261 		lsr	r1, r2, #27
 157 0040 4FEA4315 		lsl	r5, r3, #5
 158 0044 0D43     		orrs	r5, r5, r1
 159 0046 4FEA4214 		lsl	r4, r2, #5
 160 004a 0346     		mov	r3, r0
 161 004c 4FEA8303 		lsl	r3, r3, #2
 162 0050 03F10703 		add	r3, r3, #7
 163 0054 03F10703 		add	r3, r3, #7
 164 0058 4FEAD303 		lsr	r3, r3, #3
 165 005c 4FEAC303 		lsl	r3, r3, #3
 166 0060 ADEB030D 		sub	sp, sp, r3
 167 0064 6B46     		mov	r3, sp
 168 0066 03F10703 		add	r3, r3, #7
 169 006a 4FEAD303 		lsr	r3, r3, #3
 170 006e 4FEAC303 		lsl	r3, r3, #3
 171 0072 3B61     		str	r3, [r7, #16]
  40:../src/main.c **** 	int d1;
  41:../src/main.c **** 
  42:../src/main.c **** 	
  43:../src/main.c **** 	// calculate the squared distance between test sample and each training data points
  44:../src/main.c **** 	for (i=0; i<N; i++){
 172              		.loc 1 44 0
 173 0074 4FF00003 		mov	r3, #0
 174 0078 7B62     		str	r3, [r7, #36]
 175 007a 38E0     		b	.L4
 176              	.L5:
  45:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 177              		.loc 1 45 0 discriminator 2
 178 007c 7B6A     		ldr	r3, [r7, #36]
 179 007e 4FEAC303 		lsl	r3, r3, #3
 180 0082 BA68     		ldr	r2, [r7, #8]
 181 0084 D318     		adds	r3, r2, r3
 182 0086 1A68     		ldr	r2, [r3, #0]
 183 0088 3B68     		ldr	r3, [r7, #0]
 184 008a 1B68     		ldr	r3, [r3, #0]
 185 008c D31A     		subs	r3, r2, r3
 186 008e 7A6A     		ldr	r2, [r7, #36]
 187 0090 4FEAC202 		lsl	r2, r2, #3
 188 0094 B968     		ldr	r1, [r7, #8]
 189 0096 8A18     		adds	r2, r1, r2
 190 0098 1168     		ldr	r1, [r2, #0]
 191 009a 3A68     		ldr	r2, [r7, #0]
 192 009c 1268     		ldr	r2, [r2, #0]
 193 009e 8A1A     		subs	r2, r1, r2
 194 00a0 02FB03F2 		mul	r2, r2, r3
  46:../src/main.c **** 		+ (points[2*i+1]-sample[1])*(points[2*i+1]-sample[1]);
 195              		.loc 1 46 0 discriminator 2
 196 00a4 7B6A     		ldr	r3, [r7, #36]
 197 00a6 4FEAC303 		lsl	r3, r3, #3
 198 00aa 03F10403 		add	r3, r3, #4
 199 00ae B968     		ldr	r1, [r7, #8]
 200 00b0 CB18     		adds	r3, r1, r3
 201 00b2 1968     		ldr	r1, [r3, #0]
 202 00b4 3B68     		ldr	r3, [r7, #0]
 203 00b6 03F10403 		add	r3, r3, #4
 204 00ba 1B68     		ldr	r3, [r3, #0]
 205 00bc CB1A     		subs	r3, r1, r3
 206 00be 796A     		ldr	r1, [r7, #36]
 207 00c0 4FEAC101 		lsl	r1, r1, #3
 208 00c4 01F10401 		add	r1, r1, #4
 209 00c8 B868     		ldr	r0, [r7, #8]
 210 00ca 4118     		adds	r1, r0, r1
 211 00cc 0868     		ldr	r0, [r1, #0]
 212 00ce 3968     		ldr	r1, [r7, #0]
 213 00d0 01F10401 		add	r1, r1, #4
 214 00d4 0968     		ldr	r1, [r1, #0]
 215 00d6 411A     		subs	r1, r0, r1
 216 00d8 01FB03F3 		mul	r3, r1, r3
 217 00dc D118     		adds	r1, r2, r3
  45:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 218              		.loc 1 45 0 discriminator 2
 219 00de 3B69     		ldr	r3, [r7, #16]
 220 00e0 7A6A     		ldr	r2, [r7, #36]
 221 00e2 43F82210 		str	r1, [r3, r2, lsl #2]
  44:../src/main.c **** 	for (i=0; i<N; i++){
 222              		.loc 1 44 0 discriminator 2
 223 00e6 7B6A     		ldr	r3, [r7, #36]
 224 00e8 03F10103 		add	r3, r3, #1
 225 00ec 7B62     		str	r3, [r7, #36]
 226              	.L4:
  44:../src/main.c **** 	for (i=0; i<N; i++){
 227              		.loc 1 44 0 is_stmt 0 discriminator 1
 228 00ee 7A6A     		ldr	r2, [r7, #36]
 229 00f0 FB68     		ldr	r3, [r7, #12]
 230 00f2 9A42     		cmp	r2, r3
 231 00f4 C2DB     		blt	.L5
  47:../src/main.c **** 	}
  48:../src/main.c **** 
  49:../src/main.c **** 	// print all distances
  50:../src/main.c **** 	//for (i=0; i<N; i++){
  51:../src/main.c **** 	//	printf( "d%d = %d, class = %d \n",i+1, d[i],label[i]) ;
  52:../src/main.c **** 	//}
  53:../src/main.c **** 
  54:../src/main.c **** 	// find the k=1 nearest neighbors
  55:../src/main.c **** 
  56:../src/main.c **** 	d1 = d[0];
 232              		.loc 1 56 0 is_stmt 1
 233 00f6 3B69     		ldr	r3, [r7, #16]
 234 00f8 1B68     		ldr	r3, [r3, #0]
 235 00fa BB61     		str	r3, [r7, #24]
  57:../src/main.c **** 	class = label[0];
 236              		.loc 1 57 0
 237 00fc 7B68     		ldr	r3, [r7, #4]
 238 00fe 1B68     		ldr	r3, [r3, #0]
 239 0100 FB61     		str	r3, [r7, #28]
  58:../src/main.c **** 	for (j=0; j<N; j++){
 240              		.loc 1 58 0
 241 0102 4FF00003 		mov	r3, #0
 242 0106 3B62     		str	r3, [r7, #32]
 243 0108 16E0     		b	.L6
 244              	.L8:
  59:../src/main.c **** 		if (d[j]<d1){
 245              		.loc 1 59 0
 246 010a 3B69     		ldr	r3, [r7, #16]
 247 010c 3A6A     		ldr	r2, [r7, #32]
 248 010e 53F82220 		ldr	r2, [r3, r2, lsl #2]
 249 0112 BB69     		ldr	r3, [r7, #24]
 250 0114 9A42     		cmp	r2, r3
 251 0116 0BDA     		bge	.L7
  60:../src/main.c **** 			class = label[j];
 252              		.loc 1 60 0
 253 0118 3B6A     		ldr	r3, [r7, #32]
 254 011a 4FEA8303 		lsl	r3, r3, #2
 255 011e 7A68     		ldr	r2, [r7, #4]
 256 0120 D318     		adds	r3, r2, r3
 257 0122 1B68     		ldr	r3, [r3, #0]
 258 0124 FB61     		str	r3, [r7, #28]
  61:../src/main.c **** 			d1 = d[j];
 259              		.loc 1 61 0
 260 0126 3B69     		ldr	r3, [r7, #16]
 261 0128 3A6A     		ldr	r2, [r7, #32]
 262 012a 53F82230 		ldr	r3, [r3, r2, lsl #2]
 263 012e BB61     		str	r3, [r7, #24]
 264              	.L7:
  58:../src/main.c **** 	for (j=0; j<N; j++){
 265              		.loc 1 58 0
 266 0130 3B6A     		ldr	r3, [r7, #32]
 267 0132 03F10103 		add	r3, r3, #1
 268 0136 3B62     		str	r3, [r7, #32]
 269              	.L6:
  58:../src/main.c **** 	for (j=0; j<N; j++){
 270              		.loc 1 58 0 is_stmt 0 discriminator 1
 271 0138 3A6A     		ldr	r2, [r7, #32]
 272 013a FB68     		ldr	r3, [r7, #12]
 273 013c 9A42     		cmp	r2, r3
 274 013e E4DB     		blt	.L8
  62:../src/main.c **** 		}
  63:../src/main.c **** 	}
  64:../src/main.c **** 	
  65:../src/main.c **** 	return class;
 275              		.loc 1 65 0 is_stmt 1
 276 0140 FB69     		ldr	r3, [r7, #28]
 277 0142 B546     		mov	sp, r6
  66:../src/main.c **** }
 278              		.loc 1 66 0
 279 0144 1846     		mov	r0, r3
 280 0146 07F12807 		add	r7, r7, #40
 281 014a BD46     		mov	sp, r7
 282 014c BDE8F003 		pop	{r4, r5, r6, r7, r8, r9}
 283 0150 7047     		bx	lr
 284              		.cfi_endproc
 285              	.LFE1:
 287 0152 00BF     		.text
 288              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:19     .rodata:00000000 $d
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:20     .rodata:00000000 .LC1
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:23     .rodata:00000014 .LC2
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:26     .rodata:00000028 .LC0
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:30     .text.main:00000000 $t
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:35     .text.main:00000000 main
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:113    .text.classification_c:00000000 classification_c
C:\Users\huien\AppData\Local\Temp\cc11kU7b.s:108    .text.classification_c:00000000 $t
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
classification
printf
