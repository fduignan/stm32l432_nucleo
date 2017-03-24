	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initFPU
	.thumb
	.thumb_func
	.type	initFPU, %function
initFPU:
.LFB1:
	.file 1 "main.c"
	.loc 1 47 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 49 0
	ldr	r2, .L2
	ldr	r3, [r2]
	orr	r3, r3, #15728640
	str	r3, [r2]
	.loc 1 50 0
	.syntax unified
@ 50 "main.c" 1
	 DSB 
@ 0 "" 2
	.loc 1 51 0
@ 51 "main.c" 1
	 ISB 
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L3:
	.align	2
.L2:
	.word	-536810104
	.cfi_endproc
.LFE1:
	.size	initFPU, .-initFPU
	.align	2
	.global	initFilter
	.thumb
	.thumb_func
	.type	initFilter, %function
initFilter:
.LFB2:
	.loc 1 55 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	ldr	r1, .L5
	ldr	r2, .L5+4
	movs	r3, #0
	str	r3, [r1]
	str	r3, [r1, #4]
	str	r3, [r1, #8]
	str	r3, [r1, #12]
	str	r3, [r1, #16]
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	bx	lr
.L6:
	.align	2
.L5:
	.word	x
	.word	y
	.cfi_endproc
.LFE2:
	.size	initFilter, .-initFilter
	.align	2
	.global	delay
	.thumb
	.thumb_func
	.type	delay, %function
delay:
.LFB7:
	.loc 1 181 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	bx	lr
	.cfi_endproc
.LFE7:
	.size	delay, .-delay
	.align	2
	.global	initClocks
	.thumb
	.thumb_func
	.type	initClocks, %function
initClocks:
.LFB8:
	.loc 1 185 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 190 0
	ldr	r2, .L13
	.loc 1 212 0
	ldr	r1, .L13+4
	.loc 1 190 0
	ldr	r3, [r2]
	.loc 1 212 0
	ldr	r0, .L13+8
	.loc 1 190 0
	bic	r3, r3, #16777216
	str	r3, [r2]
	.loc 1 212 0
	str	r0, [r1]
	.loc 1 214 0
	ldr	r3, [r2]
	orr	r3, r3, #16777216
	str	r3, [r2]
.L9:
	.loc 1 215 0 discriminator 1
	ldr	r3, [r2]
	lsls	r3, r3, #6
	bpl	.L9
	.loc 1 217 0
	ldr	r3, .L13+12
	.loc 1 219 0
	ldr	r1, .L13+16
	.loc 1 217 0
	ldr	r2, [r3]
	bic	r2, r2, #7
	str	r2, [r3]
	.loc 1 218 0
	ldr	r2, [r3]
	orr	r2, r2, #4
	str	r2, [r3]
	.loc 1 219 0
	ldr	r3, [r1]
	orr	r3, r3, #3
	str	r3, [r1]
	bx	lr
.L14:
	.align	2
.L13:
	.word	1073876992
	.word	1073877004
	.word	56774657
	.word	1073881088
	.word	1073877000
	.cfi_endproc
.LFE8:
	.size	initClocks, .-initClocks
	.align	2
	.global	configPins
	.thumb
	.thumb_func
	.type	configPins, %function
configPins:
.LFB9:
	.loc 1 222 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 225 0
	ldr	r1, .L16
	.loc 1 226 0
	ldr	r3, .L16+4
	.loc 1 225 0
	ldr	r2, [r1]
	orr	r2, r2, #2
	str	r2, [r1]
	.loc 1 226 0
	ldr	r2, [r3]
	orr	r2, r2, #64
	str	r2, [r3]
	.loc 1 227 0
	ldr	r2, [r3]
	bic	r2, r2, #128
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073877068
	.word	1207960576
	.cfi_endproc
.LFE9:
	.size	configPins, .-configPins
	.align	2
	.global	initDAC
	.thumb
	.thumb_func
	.type	initDAC, %function
initDAC:
.LFB10:
	.loc 1 231 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 5, -4
	.loc 1 233 0
	ldr	r5, .L20
	.loc 1 235 0
	ldr	r0, .L20+4
	.loc 1 233 0
	ldr	r2, [r5]
	.loc 1 236 0
	ldr	r1, .L20+8
	.loc 1 237 0
	ldr	r3, .L20+12
	.loc 1 234 0
	mov	r4, #1207959552
	.loc 1 233 0
	orr	r2, r2, #1
	str	r2, [r5]
	.loc 1 234 0
	ldr	r2, [r4]
	orr	r2, r2, #768
	str	r2, [r4]
	.loc 1 235 0
	ldr	r2, [r0]
	orr	r2, r2, #536870912
	str	r2, [r0]
	.loc 1 236 0
	ldr	r2, [r1]
	bic	r2, r2, #536870912
	str	r2, [r1]
	.loc 1 237 0
	ldr	r2, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
	.loc 1 239 0
	ldr	r2, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 241 0
	pop	{r4, r5}
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073877068
	.word	1073877080
	.word	1073877048
	.word	1073771520
	.cfi_endproc
.LFE10:
	.size	initDAC, .-initDAC
	.align	2
	.global	initADC
	.thumb
	.thumb_func
	.type	initADC, %function
initADC:
.LFB11:
	.loc 1 243 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	.loc 1 247 0
	ldr	r3, .L26
	.loc 1 253 0
	ldr	r2, .L26+4
	.loc 1 247 0
	ldr	r1, [r3]
	.loc 1 243 0
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	.loc 1 247 0
	orr	r1, r1, #1
	.loc 1 248 0
	mov	r7, #1207959552
	.loc 1 247 0
	str	r1, [r3]
	.loc 1 248 0
	ldr	r1, [r7]
	.loc 1 250 0
	ldr	r6, .L26+8
	.loc 1 252 0
	ldr	r4, .L26+12
	.loc 1 254 0
	ldr	r5, .L26+16
	.loc 1 248 0
	orr	r1, r1, #192
	str	r1, [r7]
	.loc 1 250 0
	ldr	r1, [r6]
	orr	r1, r1, #805306368
	str	r1, [r6]
	.loc 1 251 0
	ldr	r1, [r3]
	orr	r1, r1, #8192
	str	r1, [r3]
	.loc 1 252 0
	ldr	r3, [r4]
	.loc 1 253 0
	movs	r7, #0
	.loc 1 252 0
	bic	r3, r3, #8192
	.loc 1 254 0
	mov	r6, #4194304
	.loc 1 255 0
	mov	r1, #268435456
	.loc 1 252 0
	str	r3, [r4]
	.loc 1 253 0
	str	r7, [r2]
	.loc 1 254 0
	str	r6, [r5]
	.loc 1 255 0
	str	r1, [r2]
	.loc 1 258 0
	ldr	r3, [r2]
	orr	r3, r3, #-2147483648
	str	r3, [r2]
.L23:
	.loc 1 259 0 discriminator 1
	ldr	r3, [r2]
	ldr	r1, .L26+4
	cmp	r3, #0
	blt	.L23
	.loc 1 260 0
	ldr	r4, .L26+20
	.loc 1 261 0
	ldr	r2, .L26+24
	.loc 1 260 0
	ldr	r3, [r4]
	.loc 1 264 0
	ldr	r7, .L26+28
	.loc 1 265 0
	ldr	r6, .L26+32
	.loc 1 266 0
	ldr	r5, .L26+36
	.loc 1 267 0
	ldr	lr, .L26+64
	.loc 1 260 0
	orr	r3, r3, #1
	str	r3, [r4]
	.loc 1 261 0
	ldr	r3, [r2]
	.loc 1 268 0
	ldr	r4, .L26+40
	.loc 1 261 0
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 263 0
	mov	r3, #1073741824
	movs	r2, #0
	str	r2, [r3]
	.loc 1 264 0
	str	r2, [r7]
	.loc 1 265 0
	str	r2, [r6]
	.loc 1 267 0
	movs	r6, #32
	.loc 1 266 0
	ldr	r2, .L26+44
	udiv	r0, r2, r0
.LVL3:
	str	r0, [r5]
	.loc 1 267 0
	str	r6, [lr]
	.loc 1 268 0
	ldr	r2, [r4]
	.loc 1 273 0
	ldr	r7, .L26+48
	.loc 1 274 0
	ldr	r6, .L26+52
	.loc 1 275 0
	ldr	r5, .L26+56
	.loc 1 276 0
	ldr	r0, .L26+60
	.loc 1 273 0
	ldr	lr, .L26+68
	.loc 1 268 0
	orr	r2, r2, #1
	str	r2, [r4]
	.loc 1 269 0
	ldr	r2, [r3]
	orr	r2, r2, #16
	str	r2, [r3]
	.loc 1 270 0
	ldr	r2, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	.loc 1 275 0
	movs	r3, #4
	.loc 1 274 0
	mov	r2, #512
	.loc 1 273 0
	str	lr, [r7]
	.loc 1 274 0
	str	r2, [r6]
	.loc 1 275 0
	str	r3, [r5]
	.loc 1 276 0
	ldr	r3, [r0]
	orr	r3, r3, #262144
	str	r3, [r0]
	.loc 1 277 0
	ldr	r3, [r1]
	orr	r3, r3, #1
	str	r3, [r1]
	.loc 1 278 0
	ldr	r3, [r1]
	orr	r3, r3, #4
	str	r3, [r1]
	pop	{r4, r5, r6, r7, pc}
.L27:
	.align	2
.L26:
	.word	1073877068
	.word	1342439432
	.word	1073877128
	.word	1073877036
	.word	1342440200
	.word	1073877080
	.word	1073877048
	.word	1073741840
	.word	1073741864
	.word	1073741868
	.word	1073741844
	.word	80000000
	.word	1342439436
	.word	1342439472
	.word	1342439428
	.word	-536813312
	.word	1073741828
	.word	-2147477824
	.cfi_endproc
.LFE11:
	.size	initADC, .-initADC
	.align	2
	.global	ADC_ISR
	.thumb
	.thumb_func
	.type	ADC_ISR, %function
ADC_ISR:
.LFB12:
	.loc 1 282 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
.LBB12:
.LBB13:
	.loc 1 164 0
	ldr	r1, .L30
	.loc 1 167 0
	ldr	r3, .L30+4
	vldr.32	s0, [r1]
	vldr.32	s1, [r3]
	vldr.32	s11, [r3, #4]
	vldr.32	s2, [r1, #4]
	ldr	r4, .L30+8
	vldr.32	s12, [r3, #8]
	vldr.32	s4, [r4, #4]
	vldr.32	s5, [r1, #8]
	vldr.32	s6, [r4, #8]
	vldr.32	s13, [r3, #12]
	vldr.32	s7, [r1, #12]
	vldr.32	s8, [r4, #12]
.LBE13:
.LBE12:
	.loc 1 284 0
	ldr	r5, .L30+12
.LBB24:
.LBB14:
	.loc 1 167 0
	vldr.32	s14, [r3, #16]
.LBE14:
.LBE24:
	.loc 1 284 0
	ldr	r2, [r5]
.LBB25:
.LBB15:
	.loc 1 167 0
	vldr.32	s9, [r1, #16]
.LBE15:
.LBE25:
	.loc 1 285 0
	ldr	r6, .L30+16
.LBB26:
.LBB16:
	.loc 1 167 0
	vldr.32	s10, [r4, #16]
.LBE16:
.LBE26:
	.loc 1 286 0
	ldr	r0, .L30+20
	.loc 1 287 0
	vldr.32	s3, .L30+24
	ldr	r7, .L30+28
	.loc 1 282 0
	vpush.64	{d8}
	.cfi_def_cfa_offset 32
	.cfi_offset 80, -32
	.cfi_offset 81, -28
.LBB27:
.LBB17:
	.loc 1 167 0
	vldr.32	s16, .L30+32
	vfma.f32	s16, s0, s1
.LBE17:
.LBE27:
	.loc 1 284 0
	orr	r2, r2, #8
	str	r2, [r5]
	.loc 1 285 0
	movs	r2, #8
.LBB28:
.LBB18:
	.loc 1 167 0
	vfma.f32	s16, s11, s2
.LBE18:
.LBE28:
	.loc 1 285 0
	str	r2, [r6]
.LBB29:
.LBB19:
	.loc 1 170 0
	mov	r6, r4
.LBE19:
.LBE29:
	.loc 1 286 0
	vldr.32	s15, [r0]	@ int
.LBB30:
.LBB20:
	.loc 1 167 0
	vfms.f32	s16, s4, s11
	adds	r0, r1, #4
	movs	r2, #16
.LBE20:
.LBE30:
	.loc 1 287 0
	vcvt.f32.u32	s15, s15
.LBB31:
.LBB21:
	.loc 1 167 0
	vfma.f32	s16, s12, s5
.LBE21:
.LBE31:
	.loc 1 287 0
	vsub.f32	s15, s15, s3
.LBB32:
.LBB22:
	.loc 1 167 0
	vfms.f32	s16, s6, s12
.LBE22:
.LBE32:
	.loc 1 287 0
	vstr.32	s15, [r7]
.LVL4:
.LBB33:
.LBB23:
	.loc 1 167 0
	vfma.f32	s16, s7, s13
.LVL5:
	vfms.f32	s16, s13, s8
.LVL6:
	vfma.f32	s16, s9, s14
	vfms.f32	s16, s14, s10
.LVL7:
	.loc 1 170 0
	vstmia.32	r6!, {s16}
.LVL8:
	bl	memmove
.LVL9:
	mov	r0, r6
	mov	r1, r4
	movs	r2, #16
	bl	memmove
.LVL10:
.LBE23:
.LBE33:
.LBB34:
.LBB35:
	.loc 1 293 0
	vcvt.s32.f32	s16, s16
.LVL11:
	ldr	r3, .L30+36
	vstr.32	s16, [r3]	@ int
.LBE35:
.LBE34:
	.loc 1 290 0
	vldm	sp!, {d8}
	.cfi_restore 80
	.cfi_restore 81
	.cfi_def_cfa_offset 24
	.loc 1 289 0
	ldr	r3, [r5]
	bic	r3, r3, #8
	str	r3, [r5]
	.loc 1 290 0
	pop	{r3, r4, r5, r6, r7, pc}
.L31:
	.align	2
.L30:
	.word	x
	.word	.LANCHOR1
	.word	y
	.word	1207960596
	.word	1342439424
	.word	1342439488
	.word	1157627904
	.word	.LANCHOR0
	.word	0
	.word	1073771528
	.cfi_endproc
.LFE12:
	.size	ADC_ISR, .-ADC_ISR
	.align	2
	.global	displayRegisters
	.thumb
	.thumb_func
	.type	displayRegisters, %function
displayRegisters:
.LFB14:
	.loc 1 296 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 298 0
	ldr	r0, .L62
	bl	eputs
.LVL12:
.L33:
	.loc 1 299 0 discriminator 1
	bl	transmitting
.LVL13:
	cmp	r0, #0
	bne	.L33
	.loc 1 300 0
	ldr	r0, .L62+4
	bl	eputs
.LVL14:
	.loc 1 301 0
	ldr	r3, .L62+8
	ldr	r0, [r3]
	bl	printHex
.LVL15:
.L34:
	.loc 1 302 0 discriminator 1
	bl	transmitting
.LVL16:
	cmp	r0, #0
	bne	.L34
	.loc 1 303 0
	ldr	r0, .L62+12
	bl	eputs
.LVL17:
	.loc 1 304 0
	ldr	r3, .L62+16
	ldr	r0, [r3]
	bl	printHex
.LVL18:
.L35:
	.loc 1 305 0 discriminator 1
	bl	transmitting
.LVL19:
	cmp	r0, #0
	bne	.L35
	.loc 1 306 0
	ldr	r0, .L62+20
	bl	eputs
.LVL20:
	.loc 1 307 0
	ldr	r3, .L62+24
	ldr	r0, [r3]
	bl	printHex
.LVL21:
.L36:
	.loc 1 308 0 discriminator 1
	bl	transmitting
.LVL22:
	cmp	r0, #0
	bne	.L36
	.loc 1 309 0
	ldr	r0, .L62+28
	bl	eputs
.LVL23:
	.loc 1 310 0
	ldr	r3, .L62+32
	ldr	r0, [r3]
	bl	printHex
.LVL24:
.L37:
	.loc 1 311 0 discriminator 1
	bl	transmitting
.LVL25:
	cmp	r0, #0
	bne	.L37
	.loc 1 312 0
	ldr	r0, .L62+36
	bl	eputs
.LVL26:
	.loc 1 313 0
	ldr	r3, .L62+40
	ldr	r0, [r3]
	bl	printHex
.LVL27:
.L38:
	.loc 1 314 0 discriminator 1
	bl	transmitting
.LVL28:
	cmp	r0, #0
	bne	.L38
	.loc 1 315 0
	ldr	r0, .L62+44
	bl	eputs
.LVL29:
	.loc 1 316 0
	ldr	r3, .L62+48
	ldr	r0, [r3]
	bl	printHex
.LVL30:
.L39:
	.loc 1 317 0 discriminator 1
	bl	transmitting
.LVL31:
	cmp	r0, #0
	bne	.L39
	.loc 1 318 0
	ldr	r0, .L62+52
	bl	eputs
.LVL32:
	.loc 1 319 0
	ldr	r3, .L62+56
	ldr	r0, [r3]
	bl	printHex
.LVL33:
.L40:
	.loc 1 321 0 discriminator 1
	bl	transmitting
.LVL34:
	cmp	r0, #0
	bne	.L40
	.loc 1 322 0
	ldr	r0, .L62+60
	bl	eputs
.LVL35:
	.loc 1 323 0
	mov	r3, #1073741824
	ldr	r0, [r3]
	bl	printHex
.LVL36:
.L41:
	.loc 1 325 0 discriminator 1
	bl	transmitting
.LVL37:
	cmp	r0, #0
	bne	.L41
	.loc 1 326 0
	ldr	r0, .L62+64
	bl	eputs
.LVL38:
	.loc 1 327 0
	ldr	r3, .L62+68
	ldr	r0, [r3]
	bl	printHex
.LVL39:
.L42:
	.loc 1 329 0 discriminator 1
	bl	transmitting
.LVL40:
	cmp	r0, #0
	bne	.L42
	.loc 1 330 0
	ldr	r0, .L62+72
	bl	eputs
.LVL41:
	.loc 1 331 0
	ldr	r3, .L62+76
	ldr	r0, [r3]
	bl	printHex
.LVL42:
.L43:
	.loc 1 333 0 discriminator 1
	bl	transmitting
.LVL43:
	cmp	r0, #0
	bne	.L43
	.loc 1 334 0
	ldr	r0, .L62+80
	bl	eputs
.LVL44:
	.loc 1 335 0
	ldr	r3, .L62+84
	ldr	r0, [r3]
	bl	printHex
.LVL45:
.L44:
	.loc 1 337 0 discriminator 1
	bl	transmitting
.LVL46:
	cmp	r0, #0
	bne	.L44
	.loc 1 338 0
	ldr	r0, .L62+88
	bl	eputs
.LVL47:
	.loc 1 339 0
	ldr	r3, .L62+92
	ldr	r0, [r3]
	bl	printHex
.LVL48:
.L45:
	.loc 1 341 0 discriminator 1
	bl	transmitting
.LVL49:
	cmp	r0, #0
	bne	.L45
	.loc 1 342 0
	ldr	r0, .L62+96
	bl	eputs
.LVL50:
	.loc 1 343 0
	ldr	r3, .L62+100
	ldr	r0, [r3]
	bl	printHex
.LVL51:
.L46:
	.loc 1 345 0 discriminator 1
	bl	transmitting
.LVL52:
	cmp	r0, #0
	bne	.L46
	.loc 1 346 0
	pop	{r3, pc}
.L63:
	.align	2
.L62:
	.word	.LC0
	.word	.LC1
	.word	1342439424
	.word	.LC2
	.word	1342439428
	.word	.LC3
	.word	1342439432
	.word	.LC4
	.word	1342439436
	.word	.LC5
	.word	1342439440
	.word	.LC6
	.word	1342439488
	.word	.LC7
	.word	1342439472
	.word	.LC8
	.word	.LC9
	.word	1073741828
	.word	.LC10
	.word	1073741832
	.word	.LC11
	.word	1073741836
	.word	.LC12
	.word	1073741840
	.word	.LC13
	.word	1073818644
	.cfi_endproc
.LFE14:
	.size	displayRegisters, .-displayRegisters
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.loc 1 29 0
	.cfi_startproc
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 31 0
	bl	initClocks
.LVL53:
.LBB36:
.LBB37:
	.loc 1 49 0
	ldr	r2, .L67
	ldr	r3, [r2]
	orr	r3, r3, #15728640
	str	r3, [r2]
	.loc 1 50 0
	.syntax unified
@ 50 "main.c" 1
	 DSB 
@ 0 "" 2
	.loc 1 51 0
@ 51 "main.c" 1
	 ISB 
@ 0 "" 2
.LVL54:
	.thumb
	.syntax unified
	ldr	r1, .L67+4
	ldr	r2, .L67+8
.LBE37:
.LBE36:
.LBB38:
.LBB39:
	.loc 1 225 0
	ldr	r5, .L67+12
	.loc 1 226 0
	ldr	r0, .L67+16
	movs	r3, #0
	str	r3, [r1]
	str	r3, [r2]
	.loc 1 225 0
	ldr	r4, [r5]
	str	r3, [r1, #4]
	orr	r4, r4, #2
	str	r4, [r5]
	.loc 1 226 0
	ldr	r4, [r0]
	str	r3, [r1, #8]
	orr	r4, r4, #64
	str	r4, [r0]
	.loc 1 227 0
	ldr	r4, [r0]
	str	r3, [r1, #12]
	bic	r4, r4, #128
	str	r4, [r0]
	str	r3, [r1, #16]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
.LVL55:
.LBE39:
.LBE38:
	.loc 1 35 0
	mov	r0, #9600
	bl	initUART
.LVL56:
	.loc 1 36 0
	bl	initDAC
.LVL57:
	.loc 1 37 0
	ldr	r0, .L67+20
	bl	initADC
.LVL58:
	.loc 1 38 0
	.syntax unified
@ 38 "main.c" 1
	 cpsie i 
@ 0 "" 2
	.loc 1 39 0
	.thumb
	.syntax unified
	bl	displayRegisters
.LVL59:
.L65:
	.loc 1 42 0 discriminator 1
	.syntax unified
@ 42 "main.c" 1
	 wfi   
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L65
.L68:
	.align	2
.L67:
	.word	-536810104
	.word	x
	.word	y
	.word	1073877068
	.word	1207960576
	.word	400000
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.global	ADCValue
	.global	b
	.global	a
	.comm	y,20,4
	.comm	x,20,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	b, %object
	.size	b, 20
b:
	.word	970615579
	.word	987392795
	.word	992202836
	.word	987392795
	.word	970615579
	.type	a, %object
	.size	a, 20
a:
	.word	1065353216
	.word	-1068789861
	.word	1081548221
	.word	-1073271391
	.word	1054893293
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Ready to filter!  Diagnostics follow:\015\012\000"
.LC1:
	.ascii	"\015\012ADC1_ISR: \000"
	.space	3
.LC2:
	.ascii	"\015\012ADC1_IER: \000"
	.space	3
.LC3:
	.ascii	"\015\012ADC1_CR: \000"
.LC4:
	.ascii	"\015\012ADC1_CFGR: \000"
	.space	2
.LC5:
	.ascii	"\015\012ADC1_CFGR2: \000"
	.space	1
.LC6:
	.ascii	"\015\012ADC1_DR: \000"
.LC7:
	.ascii	"\015\012ADC1_SQR1: \000"
	.space	2
.LC8:
	.ascii	"\015\012TIM2_CR1: \000"
	.space	3
.LC9:
	.ascii	"\015\012TIM2_CR2: \000"
	.space	3
.LC10:
	.ascii	"\015\012TIM2_SMCR: \000"
	.space	2
.LC11:
	.ascii	"\015\012TIM2_DIER: \000"
	.space	2
.LC12:
	.ascii	"\015\012TIM2_SR: \000"
.LC13:
	.ascii	"\015\012TIM1_EGR: \000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ADCValue, %object
	.size	ADCValue, 4
ADCValue:
	.space	4
	.text
.Letext0:
	.file 2 "/usr/local/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/usr/local/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "serial.h"
	.file 5 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5d1
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0xc
	.4byte	.LASF31
	.4byte	.LASF32
	.4byte	.Ldebug_ranges0+0x60
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x41
	.4byte	0x61
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x30
	.4byte	0x56
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x123
	.byte	0x3
	.4byte	0xa2
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x123
	.4byte	0x2c
	.byte	0
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x1
	.byte	0x9e
	.4byte	0x25
	.byte	0x3
	.4byte	0xd3
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x9e
	.4byte	0x25
	.uleb128 0x9
	.ascii	"yn\000"
	.byte	0x1
	.byte	0xa1
	.4byte	0x25
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa2
	.4byte	0x2c
	.byte	0
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x1
	.byte	0xdd
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.4byte	0xf1
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x2c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.uleb128 0xe
	.4byte	0xf1
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	0xdb
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x122
	.uleb128 0x10
	.4byte	0xe7
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb4
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x147
	.uleb128 0x12
	.ascii	"dly\000"
	.byte	0x1
	.byte	0xb4
	.4byte	0x76
	.4byte	.LLST0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF17
	.byte	0x1
	.byte	0xb8
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	0xd3
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF18
	.byte	0x1
	.byte	0xe6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF20
	.byte	0x1
	.byte	0xf2
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19d
	.uleb128 0x14
	.4byte	.LASF21
	.byte	0x1
	.byte	0xf2
	.4byte	0x76
	.4byte	.LLST1
	.byte	0
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x119
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x248
	.uleb128 0x16
	.4byte	0xa2
	.4byte	.LBB12
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.2byte	0x120
	.4byte	0x1e9
	.uleb128 0x17
	.4byte	0xb2
	.4byte	.LLST2
	.uleb128 0x18
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x19
	.4byte	0xbd
	.4byte	.LLST3
	.uleb128 0x19
	.4byte	0xc7
	.4byte	.LLST4
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0x88
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.byte	0x1
	.2byte	0x120
	.4byte	0x207
	.uleb128 0x17
	.4byte	0x95
	.4byte	.LLST5
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL9
	.4byte	0x599
	.4byte	0x22c
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	x+4
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	x
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL10
	.4byte	0x599
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x127
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x494
	.uleb128 0x1b
	.4byte	.LVL12
	.4byte	0x5a8
	.4byte	0x275
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL13
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL14
	.4byte	0x5a8
	.4byte	0x295
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL15
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL16
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL17
	.4byte	0x5a8
	.4byte	0x2be
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL18
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL19
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL20
	.4byte	0x5a8
	.4byte	0x2e7
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL21
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL22
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL23
	.4byte	0x5a8
	.4byte	0x310
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL24
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL25
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL26
	.4byte	0x5a8
	.4byte	0x339
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL27
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL28
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL29
	.4byte	0x5a8
	.4byte	0x362
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL30
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL31
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL32
	.4byte	0x5a8
	.4byte	0x38b
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL33
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL34
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL35
	.4byte	0x5a8
	.4byte	0x3b4
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL36
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL37
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL38
	.4byte	0x5a8
	.4byte	0x3dd
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC9
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL39
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL40
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL41
	.4byte	0x5a8
	.4byte	0x406
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC10
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL42
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL43
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL44
	.4byte	0x5a8
	.4byte	0x42f
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL45
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL46
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL47
	.4byte	0x5a8
	.4byte	0x458
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC12
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL48
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL49
	.4byte	0x5b3
	.uleb128 0x1b
	.4byte	.LVL50
	.4byte	0x5a8
	.4byte	0x481
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC13
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL51
	.4byte	0x5be
	.uleb128 0x1f
	.4byte	.LVL52
	.4byte	0x5b3
	.byte	0
	.uleb128 0x20
	.4byte	.LASF37
	.byte	0x1
	.byte	0x1c
	.4byte	0x2c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x51e
	.uleb128 0x9
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x1e
	.4byte	0x51e
	.uleb128 0x21
	.4byte	0xf1
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x1
	.byte	0x20
	.uleb128 0x21
	.4byte	0xd3
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x1
	.byte	0x22
	.uleb128 0x1f
	.4byte	.LVL53
	.4byte	0x147
	.uleb128 0x1b
	.4byte	.LVL56
	.4byte	0x5c9
	.4byte	0x4f4
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x2580
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL57
	.4byte	0x167
	.uleb128 0x1b
	.4byte	.LVL58
	.4byte	0x178
	.4byte	0x514
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x61a80
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL59
	.4byte	0x248
	.byte	0
	.uleb128 0x22
	.4byte	0x535
	.4byte	0x52e
	.uleb128 0x23
	.4byte	0x52e
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF23
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF24
	.uleb128 0x22
	.4byte	0x25
	.4byte	0x54c
	.uleb128 0x23
	.4byte	0x52e
	.byte	0x4
	.byte	0
	.uleb128 0x24
	.ascii	"x\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x53c
	.uleb128 0x5
	.byte	0x3
	.4byte	x
	.uleb128 0x24
	.ascii	"y\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x53c
	.uleb128 0x5
	.byte	0x3
	.4byte	y
	.uleb128 0x24
	.ascii	"a\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x53c
	.uleb128 0x5
	.byte	0x3
	.4byte	a
	.uleb128 0x24
	.ascii	"b\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x53c
	.uleb128 0x5
	.byte	0x3
	.4byte	b
	.uleb128 0x25
	.4byte	.LASF25
	.byte	0x1
	.byte	0x1b
	.4byte	0x25
	.uleb128 0x5
	.byte	0x3
	.4byte	ADCValue
	.uleb128 0x26
	.4byte	.LASF38
	.4byte	.LASF39
	.byte	0x5
	.byte	0
	.4byte	.LASF38
	.uleb128 0x27
	.4byte	.LASF26
	.4byte	.LASF26
	.byte	0x4
	.byte	0xa
	.uleb128 0x27
	.4byte	.LASF27
	.4byte	.LASF27
	.byte	0x4
	.byte	0xe
	.uleb128 0x27
	.4byte	.LASF28
	.4byte	.LASF28
	.byte	0x4
	.byte	0xf
	.uleb128 0x27
	.4byte	.LASF29
	.4byte	.LASF29
	.byte	0x4
	.byte	0x7
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LFE7
	.2byte	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL9-1
	.2byte	0xc
	.byte	0xf5
	.uleb128 0x4f
	.uleb128 0x25
	.byte	0xf4
	.uleb128 0x25
	.byte	0x4
	.4byte	0x45000000
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL10
	.2byte	0x2
	.byte	0x90
	.uleb128 0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x35
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x8
	.byte	0xf5
	.uleb128 0x50
	.uleb128 0x25
	.byte	0xf7
	.uleb128 0x2c
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB12
	.4byte	.LBE12
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	.LBB30
	.4byte	.LBE30
	.4byte	.LBB31
	.4byte	.LBE31
	.4byte	.LBB32
	.4byte	.LBE32
	.4byte	.LBB33
	.4byte	.LBE33
	.4byte	0
	.4byte	0
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF38:
	.ascii	"memmove\000"
.LASF25:
	.ascii	"ADCValue\000"
.LASF28:
	.ascii	"printHex\000"
.LASF0:
	.ascii	"float\000"
.LASF19:
	.ascii	"delay\000"
.LASF32:
	.ascii	"/home/frank/Documents/programming/stm32l432Nucleo/B"
	.ascii	"areMetal/Filter\000"
.LASF13:
	.ascii	"input\000"
.LASF29:
	.ascii	"initUART\000"
.LASF6:
	.ascii	"long unsigned int\000"
.LASF4:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"writeDAC\000"
.LASF20:
	.ascii	"initADC\000"
.LASF33:
	.ascii	"filter\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF22:
	.ascii	"displayRegisters\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF39:
	.ascii	"__builtin_memmove\000"
.LASF37:
	.ascii	"main\000"
.LASF34:
	.ascii	"configPins\000"
.LASF9:
	.ascii	"unsigned int\000"
.LASF35:
	.ascii	"initFPU\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF30:
	.ascii	"GNU C11 5.4.1 20160919 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 240496] -mcpu=cortex-m4 -mthumb -mflo"
	.ascii	"at-abi=hard -mfpu=fpv4-sp-d16 -g -O3 -fsingle-preci"
	.ascii	"sion-constant\000"
.LASF21:
	.ascii	"SampleRate\000"
.LASF17:
	.ascii	"initClocks\000"
.LASF36:
	.ascii	"ADC_ISR\000"
.LASF23:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"long long int\000"
.LASF31:
	.ascii	"main.c\000"
.LASF12:
	.ascii	"Output\000"
.LASF14:
	.ascii	"index\000"
.LASF3:
	.ascii	"short int\000"
.LASF18:
	.ascii	"initDAC\000"
.LASF27:
	.ascii	"transmitting\000"
.LASF11:
	.ascii	"uint32_t\000"
.LASF5:
	.ascii	"long int\000"
.LASF24:
	.ascii	"char\000"
.LASF1:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"initFilter\000"
.LASF26:
	.ascii	"eputs\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.4.1 20160919 (release) [ARM/embedded-5-branch revision 240496]"
