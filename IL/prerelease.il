.class private auto ansi beforefieldinit prerelease.PreRelease
	extends [mscorlib]System.Object
{
	// Methods
	.method private hidebysig static
		bool GetChoice (
			[opt] string prompt
		) cil managed
	{
		.param [1] = "Yes or no?"
		// Method begins at RVA 0x2050
		// Code size 102 (0x66)
		.maxstack 2
		.locals init (
			[0] string input,
			[1] bool,
			[2] bool,
			[3] bool,
			[4] bool
		)

		IL_0000: nop
		IL_0001: ldarg.0
		IL_0002: ldstr " (y/n)"
		IL_0007: call string [mscorlib]System.String::Concat(string, string)
		IL_000c: call void [mscorlib]System.Console::WriteLine(string)
		IL_0011: nop
		IL_0012: call string [mscorlib]System.Console::ReadLine()
		IL_0017: callvirt instance string [mscorlib]System.String::ToLower()
		IL_001c: stloc.0
		IL_001d: br.s IL_005f
		// loop start (head: IL_005f)
			IL_001f: nop
			IL_0020: ldloc.0
			IL_0021: ldstr "n"
			IL_0026: call bool [mscorlib]System.String::op_Equality(string, string)
			IL_002b: stloc.1
			IL_002c: ldloc.1
			IL_002d: brfalse.s IL_0033

			IL_002f: ldc.i4.0
			IL_0030: stloc.2
			IL_0031: br.s IL_0064

			IL_0033: ldloc.0
			IL_0034: ldstr "y"
			IL_0039: call bool [mscorlib]System.String::op_Equality(string, string)
			IL_003e: stloc.3
			IL_003f: ldloc.3
			IL_0040: brfalse.s IL_0046

			IL_0042: ldc.i4.1
			IL_0043: stloc.2
			IL_0044: br.s IL_0064

			IL_0046: nop
			IL_0047: ldstr "Please input 'y' for yes and 'n' for no. Please try again:"
			IL_004c: call void [mscorlib]System.Console::WriteLine(string)
			IL_0051: nop
			IL_0052: call string [mscorlib]System.Console::ReadLine()
			IL_0057: callvirt instance string [mscorlib]System.String::ToLower()
			IL_005c: stloc.0
			IL_005d: nop
			IL_005e: nop

			IL_005f: ldc.i4.1
			IL_0060: stloc.s 4
			IL_0062: br.s IL_001f
		// end loop

		IL_0064: ldloc.2
		IL_0065: ret
	} // end of method PreRelease::GetChoice

	.method private hidebysig static
		void Main (
			string[] args
		) cil managed
	{
		// Method begins at RVA 0x20c4
		// Code size 1660 (0x67c)
		.maxstack 6
		.entrypoint
		.locals init (
			[0] string[] component_types,
			[1] int32[] section_lengths,
			[2] string[] components,
			[3] int32[] prices,
			[4] int32[] stock,
			[5] int32[] num_components_sold,
			[6] class [mscorlib]System.Collections.Generic.List`1<int32> order_numbers,
			[7] int32 estimate_no,
			[8] class [mscorlib]System.Collections.Generic.List`1<float64> order_values,
			[9] bool done,
			[10] int32 num_orders,
			[11] float64 total_value,
			[12] class [mscorlib]System.Collections.Generic.List`1<int32> choices,
			[13] int32 offset,
			[14] string summary,
			[15] float64 estimate,
			[16] int32 component_type_index,
			[17] int32 section_length,
			[18] int32 relative_component_index,
			[19] int32 absolute_component_index,
			[20] bool,
			[21] string input,
			[22] int32 selection,
			[23] bool,
			[24] bool,
			[25] bool,
			[26] bool,
			[27] int32 choice_index,
			[28] float64 price,
			[29] bool,
			[30] bool,
			[31] bool is_in_stock,
			[32] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>,
			[33] int32 choice_index,
			[34] bool,
			[35] bool,
			[36] string order_summary,
			[37] string input,
			[38] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>,
			[39] int32 choice_index,
			[40] int32 counter,
			[41] bool,
			[42] bool,
			[43] bool,
			[44] bool,
			[45] int32 index,
			[46] bool,
			[47] int32 index,
			[48] bool
		)

		IL_0000: nop
		IL_0001: ldc.i4.6
		IL_0002: newarr [mscorlib]System.String
		IL_0007: dup
		IL_0008: ldc.i4.0
		IL_0009: ldstr "processor"
		IL_000e: stelem.ref
		IL_000f: dup
		IL_0010: ldc.i4.1
		IL_0011: ldstr "ram"
		IL_0016: stelem.ref
		IL_0017: dup
		IL_0018: ldc.i4.2
		IL_0019: ldstr "storage"
		IL_001e: stelem.ref
		IL_001f: dup
		IL_0020: ldc.i4.3
		IL_0021: ldstr "screen"
		IL_0026: stelem.ref
		IL_0027: dup
		IL_0028: ldc.i4.4
		IL_0029: ldstr "case"
		IL_002e: stelem.ref
		IL_002f: dup
		IL_0030: ldc.i4.5
		IL_0031: ldstr "usb ports"
		IL_0036: stelem.ref
		IL_0037: stloc.0
		IL_0038: ldc.i4.6
		IL_0039: newarr [mscorlib]System.Int32
		IL_003e: dup
		IL_003f: ldtoken field valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=24' '<PrivateImplementationDetails>'::'725136601713B39898CBB319822859A73B4A1837'
		IL_0044: call void [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(class [mscorlib]System.Array, valuetype [mscorlib]System.RuntimeFieldHandle)
		IL_0049: stloc.1
		IL_004a: ldc.i4.s 13
		IL_004c: newarr [mscorlib]System.String
		IL_0051: dup
		IL_0052: ldc.i4.0
		IL_0053: ldstr "p3"
		IL_0058: stelem.ref
		IL_0059: dup
		IL_005a: ldc.i4.1
		IL_005b: ldstr "p5"
		IL_0060: stelem.ref
		IL_0061: dup
		IL_0062: ldc.i4.2
		IL_0063: ldstr "p7"
		IL_0068: stelem.ref
		IL_0069: dup
		IL_006a: ldc.i4.3
		IL_006b: ldstr "16GB"
		IL_0070: stelem.ref
		IL_0071: dup
		IL_0072: ldc.i4.4
		IL_0073: ldstr "32GB"
		IL_0078: stelem.ref
		IL_0079: dup
		IL_007a: ldc.i4.5
		IL_007b: ldstr "1TB"
		IL_0080: stelem.ref
		IL_0081: dup
		IL_0082: ldc.i4.6
		IL_0083: ldstr "2TB"
		IL_0088: stelem.ref
		IL_0089: dup
		IL_008a: ldc.i4.7
		IL_008b: ldstr "19\""
		IL_0090: stelem.ref
		IL_0091: dup
		IL_0092: ldc.i4.8
		IL_0093: ldstr "23\""
		IL_0098: stelem.ref
		IL_0099: dup
		IL_009a: ldc.i4.s 9
		IL_009c: ldstr "Mini Tower"
		IL_00a1: stelem.ref
		IL_00a2: dup
		IL_00a3: ldc.i4.s 10
		IL_00a5: ldstr "Midi Tower"
		IL_00aa: stelem.ref
		IL_00ab: dup
		IL_00ac: ldc.i4.s 11
		IL_00ae: ldstr "2 ports"
		IL_00b3: stelem.ref
		IL_00b4: dup
		IL_00b5: ldc.i4.s 12
		IL_00b7: ldstr "4 ports"
		IL_00bc: stelem.ref
		IL_00bd: stloc.2
		IL_00be: ldc.i4.s 13
		IL_00c0: newarr [mscorlib]System.Int32
		IL_00c5: dup
		IL_00c6: ldtoken field valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=52' '<PrivateImplementationDetails>'::'7F24B82E50D6C39C2EEDAAC6583BB545E8DBB71F'
		IL_00cb: call void [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(class [mscorlib]System.Array, valuetype [mscorlib]System.RuntimeFieldHandle)
		IL_00d0: stloc.3
		IL_00d1: ldc.i4.s 13
		IL_00d3: newarr [mscorlib]System.Int32
		IL_00d8: dup
		IL_00d9: ldtoken field valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=52' '<PrivateImplementationDetails>'::'3440D7F33DE6BE0FE528B702EA3A4F14E9C1E59E'
		IL_00de: call void [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(class [mscorlib]System.Array, valuetype [mscorlib]System.RuntimeFieldHandle)
		IL_00e3: stloc.s stock
		IL_00e5: ldc.i4.s 13
		IL_00e7: newarr [mscorlib]System.Int32
		IL_00ec: stloc.s num_components_sold
		IL_00ee: newobj instance void class [mscorlib]System.Collections.Generic.List`1<int32>::.ctor()
		IL_00f3: stloc.s order_numbers
		IL_00f5: ldc.i4.1
		IL_00f6: stloc.s estimate_no
		IL_00f8: newobj instance void class [mscorlib]System.Collections.Generic.List`1<float64>::.ctor()
		IL_00fd: stloc.s order_values
		IL_00ff: ldc.i4.0
		IL_0100: stloc.s done
		IL_0102: br IL_0573
		// loop start (head: IL_0573)
			IL_0107: nop
			IL_0108: newobj instance void class [mscorlib]System.Collections.Generic.List`1<int32>::.ctor()
			IL_010d: stloc.s choices
			IL_010f: ldc.i4.0
			IL_0110: stloc.s offset
			IL_0112: ldc.i4.0
			IL_0113: stloc.s component_type_index
			IL_0115: br IL_026d
			// loop start (head: IL_026d)
				IL_011a: nop
				IL_011b: ldloc.1
				IL_011c: ldloc.s component_type_index
				IL_011e: ldelem.i4
				IL_011f: stloc.s section_length
				IL_0121: ldc.i4.5
				IL_0122: newarr [mscorlib]System.Object
				IL_0127: dup
				IL_0128: ldc.i4.0
				IL_0129: ldstr "Please select your desired "
				IL_012e: stelem.ref
				IL_012f: dup
				IL_0130: ldc.i4.1
				IL_0131: ldloc.0
				IL_0132: ldloc.s component_type_index
				IL_0134: ldelem.ref
				IL_0135: stelem.ref
				IL_0136: dup
				IL_0137: ldc.i4.2
				IL_0138: ldstr " (1-"
				IL_013d: stelem.ref
				IL_013e: dup
				IL_013f: ldc.i4.3
				IL_0140: ldloc.s section_length
				IL_0142: box [mscorlib]System.Int32
				IL_0147: stelem.ref
				IL_0148: dup
				IL_0149: ldc.i4.4
				IL_014a: ldstr "): "
				IL_014f: stelem.ref
				IL_0150: call string [mscorlib]System.String::Concat(object[])
				IL_0155: call void [mscorlib]System.Console::WriteLine(string)
				IL_015a: nop
				IL_015b: ldc.i4.0
				IL_015c: stloc.s relative_component_index
				IL_015e: br.s IL_01cc
				// loop start (head: IL_01cc)
					IL_0160: nop
					IL_0161: ldloc.s offset
					IL_0163: ldloc.s relative_component_index
					IL_0165: add
					IL_0166: stloc.s absolute_component_index
					IL_0168: ldc.i4.8
					IL_0169: newarr [mscorlib]System.Object
					IL_016e: dup
					IL_016f: ldc.i4.0
					IL_0170: ldloc.s relative_component_index
					IL_0172: ldc.i4.1
					IL_0173: add
					IL_0174: box [mscorlib]System.Int32
					IL_0179: stelem.ref
					IL_017a: dup
					IL_017b: ldc.i4.1
					IL_017c: ldstr ") "
					IL_0181: stelem.ref
					IL_0182: dup
					IL_0183: ldc.i4.2
					IL_0184: ldloc.2
					IL_0185: ldloc.s absolute_component_index
					IL_0187: ldelem.ref
					IL_0188: stelem.ref
					IL_0189: dup
					IL_018a: ldc.i4.3
					IL_018b: ldstr " - $"
					IL_0190: stelem.ref
					IL_0191: dup
					IL_0192: ldc.i4.4
					IL_0193: ldloc.3
					IL_0194: ldloc.s absolute_component_index
					IL_0196: ldelem.i4
					IL_0197: box [mscorlib]System.Int32
					IL_019c: stelem.ref
					IL_019d: dup
					IL_019e: ldc.i4.5
					IL_019f: ldstr " - "
					IL_01a4: stelem.ref
					IL_01a5: dup
					IL_01a6: ldc.i4.6
					IL_01a7: ldloc.s stock
					IL_01a9: ldloc.s absolute_component_index
					IL_01ab: ldelem.i4
					IL_01ac: box [mscorlib]System.Int32
					IL_01b1: stelem.ref
					IL_01b2: dup
					IL_01b3: ldc.i4.7
					IL_01b4: ldstr " in stock."
					IL_01b9: stelem.ref
					IL_01ba: call string [mscorlib]System.String::Concat(object[])
					IL_01bf: call void [mscorlib]System.Console::WriteLine(string)
					IL_01c4: nop
					IL_01c5: nop
					IL_01c6: ldloc.s relative_component_index
					IL_01c8: ldc.i4.1
					IL_01c9: add
					IL_01ca: stloc.s relative_component_index

					IL_01cc: ldloc.s relative_component_index
					IL_01ce: ldloc.s section_length
					IL_01d0: clt
					IL_01d2: stloc.s 20
					IL_01d4: ldloc.s 20
					IL_01d6: brtrue.s IL_0160
				// end loop

				IL_01d8: br.s IL_0257
				// loop start (head: IL_0257)
					IL_01da: nop
					IL_01db: call string [mscorlib]System.Console::ReadLine()
					IL_01e0: stloc.s input
					IL_01e2: ldloc.s input
					IL_01e4: ldloca.s selection
					IL_01e6: call bool [mscorlib]System.Int32::TryParse(string, int32&)
					IL_01eb: ldc.i4.0
					IL_01ec: ceq
					IL_01ee: stloc.s 23
					IL_01f0: ldloc.s 23
					IL_01f2: brfalse.s IL_0213

					IL_01f4: nop
					IL_01f5: ldstr "Error parsing input. Please input digits only. Please enter a number (1-"
					IL_01fa: ldloc.s section_length
					IL_01fc: box [mscorlib]System.Int32
					IL_0201: ldstr "). Please try again."
					IL_0206: call string [mscorlib]System.String::Concat(object, object, object)
					IL_020b: call void [mscorlib]System.Console::WriteLine(string)
					IL_0210: nop
					IL_0211: br.s IL_0257

					IL_0213: ldloc.s selection
					IL_0215: ldc.i4.1
					IL_0216: blt.s IL_0220

					IL_0218: ldloc.s selection
					IL_021a: ldloc.s section_length
					IL_021c: cgt
					IL_021e: br.s IL_0221

					IL_0220: ldc.i4.1

					IL_0221: stloc.s 24
					IL_0223: ldloc.s 24
					IL_0225: brfalse.s IL_0246

					IL_0227: nop
					IL_0228: ldstr "Selection out of range. Please enter a number (1-"
					IL_022d: ldloc.s section_length
					IL_022f: box [mscorlib]System.Int32
					IL_0234: ldstr "). Please try again."
					IL_0239: call string [mscorlib]System.String::Concat(object, object, object)
					IL_023e: call void [mscorlib]System.Console::WriteLine(string)
					IL_0243: nop
					IL_0244: br.s IL_0257

					IL_0246: ldloc.s choices
					IL_0248: ldloc.s offset
					IL_024a: ldloc.s selection
					IL_024c: add
					IL_024d: ldc.i4.1
					IL_024e: sub
					IL_024f: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<int32>::Add(!0)
					IL_0254: nop
					IL_0255: br.s IL_025f

					IL_0257: ldc.i4.1
					IL_0258: stloc.s 25
					IL_025a: br IL_01da
				// end loop

				IL_025f: ldloc.s offset
				IL_0261: ldloc.s section_length
				IL_0263: add
				IL_0264: stloc.s offset
				IL_0266: nop
				IL_0267: ldloc.s component_type_index
				IL_0269: ldc.i4.1
				IL_026a: add
				IL_026b: stloc.s component_type_index

				IL_026d: ldloc.s component_type_index
				IL_026f: ldloc.0
				IL_0270: ldlen
				IL_0271: conv.i4
				IL_0272: clt
				IL_0274: stloc.s 26
				IL_0276: ldloc.s 26
				IL_0278: brtrue IL_011a
			// end loop

			IL_027d: ldstr ""
			IL_0282: stloc.s summary
			IL_0284: ldc.r8 0.0
			IL_028d: stloc.s estimate
			IL_028f: ldc.i4.0
			IL_0290: stloc.s choice_index
			IL_0292: br.s IL_02fa
			// loop start (head: IL_02fa)
				IL_0294: nop
				IL_0295: ldloc.3
				IL_0296: ldloc.s choices
				IL_0298: ldloc.s choice_index
				IL_029a: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<int32>::get_Item(int32)
				IL_029f: ldelem.i4
				IL_02a0: conv.r8
				IL_02a1: stloc.s price
				IL_02a3: ldloc.s estimate
				IL_02a5: ldloc.s price
				IL_02a7: add
				IL_02a8: stloc.s estimate
				IL_02aa: ldc.i4.7
				IL_02ab: newarr [mscorlib]System.Object
				IL_02b0: dup
				IL_02b1: ldc.i4.0
				IL_02b2: ldloc.s summary
				IL_02b4: stelem.ref
				IL_02b5: dup
				IL_02b6: ldc.i4.1
				IL_02b7: ldloc.0
				IL_02b8: ldloc.s choice_index
				IL_02ba: ldelem.ref
				IL_02bb: stelem.ref
				IL_02bc: dup
				IL_02bd: ldc.i4.2
				IL_02be: ldstr ": "
				IL_02c3: stelem.ref
				IL_02c4: dup
				IL_02c5: ldc.i4.3
				IL_02c6: ldloc.2
				IL_02c7: ldloc.s choices
				IL_02c9: ldloc.s choice_index
				IL_02cb: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<int32>::get_Item(int32)
				IL_02d0: ldelem.ref
				IL_02d1: stelem.ref
				IL_02d2: dup
				IL_02d3: ldc.i4.4
				IL_02d4: ldstr " - $"
				IL_02d9: stelem.ref
				IL_02da: dup
				IL_02db: ldc.i4.5
				IL_02dc: ldloc.s price
				IL_02de: box [mscorlib]System.Double
				IL_02e3: stelem.ref
				IL_02e4: dup
				IL_02e5: ldc.i4.6
				IL_02e6: call string [mscorlib]System.Environment::get_NewLine()
				IL_02eb: stelem.ref
				IL_02ec: call string [mscorlib]System.String::Concat(object[])
				IL_02f1: stloc.s summary
				IL_02f3: nop
				IL_02f4: ldloc.s choice_index
				IL_02f6: ldc.i4.1
				IL_02f7: add
				IL_02f8: stloc.s choice_index

				IL_02fa: ldloc.s choice_index
				IL_02fc: ldloc.s choices
				IL_02fe: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<int32>::get_Count()
				IL_0303: clt
				IL_0305: stloc.s 29
				IL_0307: ldloc.s 29
				IL_0309: brtrue.s IL_0294
			// end loop

			IL_030b: ldloc.s estimate
			IL_030d: ldc.r8 1.2
			IL_0316: mul
			IL_0317: stloc.s estimate
			IL_0319: ldstr "Estimation Summary:"
			IL_031e: call void [mscorlib]System.Console::WriteLine(string)
			IL_0323: nop
			IL_0324: ldstr "Estimation number: "
			IL_0329: ldloc.s estimate_no
			IL_032b: box [mscorlib]System.Int32
			IL_0330: call string [mscorlib]System.String::Concat(object, object)
			IL_0335: call void [mscorlib]System.Console::WriteLine(string)
			IL_033a: nop
			IL_033b: ldloc.s summary
			IL_033d: call void [mscorlib]System.Console::WriteLine(string)
			IL_0342: nop
			IL_0343: ldstr "Estimated total cost: $"
			IL_0348: ldloc.s estimate
			IL_034a: box [mscorlib]System.Double
			IL_034f: call string [mscorlib]System.String::Concat(object, object)
			IL_0354: call void [mscorlib]System.Console::WriteLine(string)
			IL_0359: nop
			IL_035a: ldstr "Would you like to order this?"
			IL_035f: call bool prerelease.PreRelease::GetChoice(string)
			IL_0364: stloc.s 30
			IL_0366: ldloc.s 30
			IL_0368: brfalse IL_0572

			IL_036d: nop
			IL_036e: ldc.i4.1
			IL_036f: stloc.s is_in_stock
			IL_0371: nop
			IL_0372: ldloc.s choices
			IL_0374: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<int32>::GetEnumerator()
			IL_0379: stloc.s 32
			.try
			{
				IL_037b: br.s IL_039f
				// loop start (head: IL_039f)
					IL_037d: ldloca.s 32
					IL_037f: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>::get_Current()
					IL_0384: stloc.s choice_index
					IL_0386: nop
					IL_0387: ldloc.s stock
					IL_0389: ldloc.s choice_index
					IL_038b: ldelem.i4
					IL_038c: ldc.i4.0
					IL_038d: cgt
					IL_038f: ldc.i4.0
					IL_0390: ceq
					IL_0392: stloc.s 34
					IL_0394: ldloc.s 34
					IL_0396: brfalse.s IL_039e

					IL_0398: nop
					IL_0399: ldc.i4.0
					IL_039a: stloc.s is_in_stock
					IL_039c: br.s IL_03a8

					IL_039e: nop

					IL_039f: ldloca.s 32
					IL_03a1: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>::MoveNext()
					IL_03a6: brtrue.s IL_037d
				// end loop

				IL_03a8: leave.s IL_03b9
			} // end .try
			finally
			{
				IL_03aa: ldloca.s 32
				IL_03ac: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>
				IL_03b2: callvirt instance void [mscorlib]System.IDisposable::Dispose()
				IL_03b7: nop
				IL_03b8: endfinally
			} // end handler

			IL_03b9: ldloc.s is_in_stock
			IL_03bb: ldc.i4.0
			IL_03bc: ceq
			IL_03be: stloc.s 35
			IL_03c0: ldloc.s 35
			IL_03c2: brfalse.s IL_03d6

			IL_03c4: nop
			IL_03c5: ldstr "Unfortunately, one or more of your selected components are out of stock. Please try again later."
			IL_03ca: call void [mscorlib]System.Console::WriteLine(string)
			IL_03cf: nop
			IL_03d0: nop
			IL_03d1: br IL_0552

			IL_03d6: nop
			IL_03d7: nop
			IL_03d8: ldloc.s choices
			IL_03da: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<int32>::GetEnumerator()
			IL_03df: stloc.s 38
			.try
			{
				IL_03e1: br.s IL_040a
				// loop start (head: IL_040a)
					IL_03e3: ldloca.s 38
					IL_03e5: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>::get_Current()
					IL_03ea: stloc.s choice_index
					IL_03ec: nop
					IL_03ed: ldloc.s stock
					IL_03ef: ldloc.s choice_index
					IL_03f1: ldelema [mscorlib]System.Int32
					IL_03f6: dup
					IL_03f7: ldind.i4
					IL_03f8: ldc.i4.1
					IL_03f9: sub
					IL_03fa: stind.i4
					IL_03fb: ldloc.s num_components_sold
					IL_03fd: ldloc.s choice_index
					IL_03ff: ldelema [mscorlib]System.Int32
					IL_0404: dup
					IL_0405: ldind.i4
					IL_0406: ldc.i4.1
					IL_0407: add
					IL_0408: stind.i4
					IL_0409: nop

					IL_040a: ldloca.s 38
					IL_040c: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>::MoveNext()
					IL_0411: brtrue.s IL_03e3
				// end loop

				IL_0413: leave.s IL_0424
			} // end .try
			finally
			{
				IL_0415: ldloca.s 38
				IL_0417: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<int32>
				IL_041d: callvirt instance void [mscorlib]System.IDisposable::Dispose()
				IL_0422: nop
				IL_0423: endfinally
			} // end handler

			IL_0424: ldloc.s order_numbers
			IL_0426: ldloc.s estimate_no
			IL_0428: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<int32>::Add(!0)
			IL_042d: nop
			IL_042e: ldloc.s order_values
			IL_0430: ldloc.s estimate
			IL_0432: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<float64>::Add(!0)
			IL_0437: nop
			IL_0438: ldstr ""
			IL_043d: stloc.s order_summary
			IL_043f: ldloc.s order_summary
			IL_0441: ldstr "Order Summary:"
			IL_0446: call string [mscorlib]System.Environment::get_NewLine()
			IL_044b: call string [mscorlib]System.String::Concat(string, string, string)
			IL_0450: stloc.s order_summary
			IL_0452: ldc.i4.4
			IL_0453: newarr [mscorlib]System.Object
			IL_0458: dup
			IL_0459: ldc.i4.0
			IL_045a: ldloc.s order_summary
			IL_045c: stelem.ref
			IL_045d: dup
			IL_045e: ldc.i4.1
			IL_045f: ldstr "Estimation number: "
			IL_0464: stelem.ref
			IL_0465: dup
			IL_0466: ldc.i4.2
			IL_0467: ldloc.s estimate_no
			IL_0469: box [mscorlib]System.Int32
			IL_046e: stelem.ref
			IL_046f: dup
			IL_0470: ldc.i4.3
			IL_0471: call string [mscorlib]System.Environment::get_NewLine()
			IL_0476: stelem.ref
			IL_0477: call string [mscorlib]System.String::Concat(object[])
			IL_047c: stloc.s order_summary
			IL_047e: ldloc.s order_summary
			IL_0480: ldloc.s summary
			IL_0482: call string [mscorlib]System.Environment::get_NewLine()
			IL_0487: call string [mscorlib]System.String::Concat(string, string, string)
			IL_048c: stloc.s order_summary
			IL_048e: ldc.i4.4
			IL_048f: newarr [mscorlib]System.Object
			IL_0494: dup
			IL_0495: ldc.i4.0
			IL_0496: ldloc.s order_summary
			IL_0498: stelem.ref
			IL_0499: dup
			IL_049a: ldc.i4.1
			IL_049b: ldstr "Estimated total cost: $"
			IL_04a0: stelem.ref
			IL_04a1: dup
			IL_04a2: ldc.i4.2
			IL_04a3: ldloc.s estimate
			IL_04a5: box [mscorlib]System.Double
			IL_04aa: stelem.ref
			IL_04ab: dup
			IL_04ac: ldc.i4.3
			IL_04ad: call string [mscorlib]System.Environment::get_NewLine()
			IL_04b2: stelem.ref
			IL_04b3: call string [mscorlib]System.String::Concat(object[])
			IL_04b8: stloc.s order_summary
			IL_04ba: ldloc.s order_summary
			IL_04bc: ldstr "------------------------------"
			IL_04c1: call string [mscorlib]System.Environment::get_NewLine()
			IL_04c6: call string [mscorlib]System.String::Concat(string, string, string)
			IL_04cb: stloc.s order_summary
			IL_04cd: ldstr "Please enter your details:"
			IL_04d2: call void [mscorlib]System.Console::WriteLine(string)
			IL_04d7: nop
			IL_04d8: call string [mscorlib]System.Console::ReadLine()
			IL_04dd: stloc.s input
			IL_04df: ldloc.s order_summary
			IL_04e1: ldstr "Customer's details: "
			IL_04e6: ldloc.s input
			IL_04e8: call string [mscorlib]System.Environment::get_NewLine()
			IL_04ed: call string [mscorlib]System.String::Concat(string, string, string, string)
			IL_04f2: stloc.s order_summary
			IL_04f4: ldloc.s order_summary
			IL_04f6: ldstr "Date: "
			IL_04fb: call valuetype [mscorlib]System.DateTime [mscorlib]System.DateTime::get_Now()
			IL_0500: box [mscorlib]System.DateTime
			IL_0505: call string [mscorlib]System.String::Concat(object, object, object)
			IL_050a: stloc.s order_summary
			IL_050c: ldc.i4.0
			IL_050d: stloc.s counter
			IL_050f: br.s IL_0546
			// loop start (head: IL_0546)
				IL_0511: nop
				IL_0512: ldloc.s counter
				IL_0514: ldc.i4.2
				IL_0515: rem
				IL_0516: ldc.i4.0
				IL_0517: ceq
				IL_0519: stloc.s 41
				IL_051b: ldloc.s 41
				IL_051d: brfalse.s IL_052c

				IL_051f: ldstr "Customer Copy:"
				IL_0524: call void [mscorlib]System.Console::WriteLine(string)
				IL_0529: nop
				IL_052a: br.s IL_0537

				IL_052c: ldstr "Shop Copy:"
				IL_0531: call void [mscorlib]System.Console::WriteLine(string)
				IL_0536: nop

				IL_0537: ldloc.s order_summary
				IL_0539: call void [mscorlib]System.Console::WriteLine(string)
				IL_053e: nop
				IL_053f: nop
				IL_0540: ldloc.s counter
				IL_0542: ldc.i4.1
				IL_0543: add
				IL_0544: stloc.s counter

				IL_0546: ldloc.s counter
				IL_0548: ldc.i4.2
				IL_0549: clt
				IL_054b: stloc.s 42
				IL_054d: ldloc.s 42
				IL_054f: brtrue.s IL_0511
			// end loop

			IL_0551: nop

			IL_0552: ldstr "Is there another order?"
			IL_0557: call bool prerelease.PreRelease::GetChoice(string)
			IL_055c: ldc.i4.0
			IL_055d: ceq
			IL_055f: stloc.s 43
			IL_0561: ldloc.s 43
			IL_0563: brfalse.s IL_056b

			IL_0565: nop
			IL_0566: ldc.i4.1
			IL_0567: stloc.s done
			IL_0569: br.s IL_0581

			IL_056b: ldloc.s estimate_no
			IL_056d: ldc.i4.1
			IL_056e: add
			IL_056f: stloc.s estimate_no
			IL_0571: nop

			IL_0572: nop

			IL_0573: ldloc.s done
			IL_0575: ldc.i4.0
			IL_0576: ceq
			IL_0578: stloc.s 44
			IL_057a: ldloc.s 44
			IL_057c: brtrue IL_0107
		// end loop

		IL_0581: ldstr "End of day Summary:"
		IL_0586: call void [mscorlib]System.Console::WriteLine(string)
		IL_058b: nop
		IL_058c: ldloc.s order_numbers
		IL_058e: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<int32>::get_Count()
		IL_0593: stloc.s num_orders
		IL_0595: ldc.r8 0.0
		IL_059e: stloc.s total_value
		IL_05a0: ldc.i4.0
		IL_05a1: stloc.s index
		IL_05a3: br.s IL_05fe
		// loop start (head: IL_05fe)
			IL_05a5: nop
			IL_05a6: ldc.i4.4
			IL_05a7: newarr [mscorlib]System.Object
			IL_05ac: dup
			IL_05ad: ldc.i4.0
			IL_05ae: ldstr "\tOrder number "
			IL_05b3: stelem.ref
			IL_05b4: dup
			IL_05b5: ldc.i4.1
			IL_05b6: ldloc.s order_numbers
			IL_05b8: ldloc.s index
			IL_05ba: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<int32>::get_Item(int32)
			IL_05bf: box [mscorlib]System.Int32
			IL_05c4: stelem.ref
			IL_05c5: dup
			IL_05c6: ldc.i4.2
			IL_05c7: ldstr " - $"
			IL_05cc: stelem.ref
			IL_05cd: dup
			IL_05ce: ldc.i4.3
			IL_05cf: ldloc.s order_values
			IL_05d1: ldloc.s index
			IL_05d3: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<float64>::get_Item(int32)
			IL_05d8: box [mscorlib]System.Double
			IL_05dd: stelem.ref
			IL_05de: call string [mscorlib]System.String::Concat(object[])
			IL_05e3: call void [mscorlib]System.Console::WriteLine(string)
			IL_05e8: nop
			IL_05e9: ldloc.s total_value
			IL_05eb: ldloc.s order_values
			IL_05ed: ldloc.s index
			IL_05ef: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<float64>::get_Item(int32)
			IL_05f4: add
			IL_05f5: stloc.s total_value
			IL_05f7: nop
			IL_05f8: ldloc.s index
			IL_05fa: ldc.i4.1
			IL_05fb: add
			IL_05fc: stloc.s index

			IL_05fe: ldloc.s index
			IL_0600: ldloc.s num_orders
			IL_0602: clt
			IL_0604: stloc.s 46
			IL_0606: ldloc.s 46
			IL_0608: brtrue.s IL_05a5
		// end loop

		IL_060a: ldstr "Total value of the orders: $"
		IL_060f: ldloc.s total_value
		IL_0611: box [mscorlib]System.Double
		IL_0616: call string [mscorlib]System.String::Concat(object, object)
		IL_061b: call void [mscorlib]System.Console::WriteLine(string)
		IL_0620: nop
		IL_0621: ldstr "Total component sales:"
		IL_0626: call void [mscorlib]System.Console::WriteLine(string)
		IL_062b: nop
		IL_062c: ldc.i4.0
		IL_062d: stloc.s index
		IL_062f: br.s IL_066e
		// loop start (head: IL_066e)
			IL_0631: nop
			IL_0632: ldc.i4.4
			IL_0633: newarr [mscorlib]System.Object
			IL_0638: dup
			IL_0639: ldc.i4.0
			IL_063a: ldstr "\t"
			IL_063f: stelem.ref
			IL_0640: dup
			IL_0641: ldc.i4.1
			IL_0642: ldloc.2
			IL_0643: ldloc.s index
			IL_0645: ldelem.ref
			IL_0646: stelem.ref
			IL_0647: dup
			IL_0648: ldc.i4.2
			IL_0649: ldstr ": "
			IL_064e: stelem.ref
			IL_064f: dup
			IL_0650: ldc.i4.3
			IL_0651: ldloc.s num_components_sold
			IL_0653: ldloc.s index
			IL_0655: ldelem.i4
			IL_0656: box [mscorlib]System.Int32
			IL_065b: stelem.ref
			IL_065c: call string [mscorlib]System.String::Concat(object[])
			IL_0661: call void [mscorlib]System.Console::WriteLine(string)
			IL_0666: nop
			IL_0667: nop
			IL_0668: ldloc.s index
			IL_066a: ldc.i4.1
			IL_066b: add
			IL_066c: stloc.s index

			IL_066e: ldloc.s index
			IL_0670: ldloc.2
			IL_0671: ldlen
			IL_0672: conv.i4
			IL_0673: clt
			IL_0675: stloc.s 48
			IL_0677: ldloc.s 48
			IL_0679: brtrue.s IL_0631
		// end loop

		IL_067b: ret
	} // end of method PreRelease::Main

	.method public hidebysig specialname rtspecialname
		instance void .ctor () cil managed
	{
		// Method begins at RVA 0x2768
		// Code size 8 (0x8)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [mscorlib]System.Object::.ctor()
		IL_0006: nop
		IL_0007: ret
	} // end of method PreRelease::.ctor

} // end of class prerelease.PreRelease
