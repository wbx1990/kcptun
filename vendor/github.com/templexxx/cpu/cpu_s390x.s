// Copyright 2018 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// func stfle() facilityList
TEXT ·stfle(SB), 4|512, $0-32
	MOVD $ret+0(FP), R1
	MOVD $3, R0          // last doubleword index to store
	XC   $32, (R1), (R1) // clear 4 doublewords (32 bytes)
	WORD $0xb2b01000     // store facility list extended (STFLE)
	RET

// func kmQuery() queryResult
TEXT ·kmQuery(SB), 4|512, $0-16
	MOVD $0, R0         // set function code to 0 (KM-Query)
	MOVD $ret+0(FP), R1 // address of 16-byte return value
	WORD $0xB92E0024    // cipher message (KM)
	RET

// func kmcQuery() queryResult
TEXT ·kmcQuery(SB), 4|512, $0-16
	MOVD $0, R0         // set function code to 0 (KMC-Query)
	MOVD $ret+0(FP), R1 // address of 16-byte return value
	WORD $0xB92F0024    // cipher message with chaining (KMC)
	RET

// func kmctrQuery() queryResult
TEXT ·kmctrQuery(SB), 4|512, $0-16
	MOVD $0, R0         // set function code to 0 (KMCTR-Query)
	MOVD $ret+0(FP), R1 // address of 16-byte return value
	WORD $0xB92D4024    // cipher message with counter (KMCTR)
	RET

// func kmaQuery() queryResult
TEXT ·kmaQuery(SB), 4|512, $0-16
	MOVD $0, R0         // set function code to 0 (KMA-Query)
	MOVD $ret+0(FP), R1 // address of 16-byte return value
	WORD $0xb9296024    // cipher message with authentication (KMA)
	RET

// func kimdQuery() queryResult
TEXT ·kimdQuery(SB), 4|512, $0-16
	MOVD $0, R0         // set function code to 0 (KIMD-Query)
	MOVD $ret+0(FP), R1 // address of 16-byte return value
	WORD $0xB93E0024    // compute intermediate message digest (KIMD)
	RET

// func klmdQuery() queryResult
TEXT ·klmdQuery(SB), 4|512, $0-16
	MOVD $0, R0         // set function code to 0 (KLMD-Query)
	MOVD $ret+0(FP), R1 // address of 16-byte return value
	WORD $0xB93F0024    // compute last message digest (KLMD)
	RET
