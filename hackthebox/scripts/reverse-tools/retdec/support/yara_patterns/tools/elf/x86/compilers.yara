/*
 * YARA rules for x86 ELF compiler detection.
 * Copyright (c) 2017 Avast Software, licensed under the MIT license
 */

import "elf"

rule gcc_android_ndk_r8_01
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.4.3"
		comment = "Android NDK r8"
		pattern = "5589E553E8E800000081C3????0?0083EC1480BB??0?000000752D8B83??0?0000890424E8??F?FFFF8B83??F?FFFF85C0740E8D83????F?FF890424E8????????C683??0?00000183C4145B5DC366905589E553E89800000081C3????0?0083EC148B83"
	strings:
		$1 = { 55 89 E5 53 E8 E8 00 00 00 81 C3 ?? ?? 0? 00 83 EC 14 80 BB ?? 0? 00 00 00 75 2D 8B 83 ?? 0? 00 00 89 04 24 E8 ?? F? FF FF 8B 83 ?? F? FF FF 85 C0 74 0E 8D 83 ?? ?? F? FF 89 04 24 E8 ?? ?? ?? ?? C6 83 ?? 0? 00 00 01 83 C4 14 5B 5D C3 66 90 55 89 E5 53 E8 98 00 00 00 81 C3 ?? ?? 0? 00 83 EC 14 8B 83 }
	condition:
		$1 at elf.entry_point
}

rule gcc_android_ndk_r8_02
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.4.3"
		comment = "Android NDK r8"
		pattern = "89E0BA?F8?040852BA?A8?040852BA000000005250E8??F?FFFFE9????0000????0?08????0?08????0?08908D7426005589E583EC18803D??????0800751CB80000000085C0740CC70424????0?08E8?C7?FBF7C605??????0801C9C38D760055B80000"
	strings:
		$1 = { 89 E0 BA ?F 8? 04 08 52 BA ?A 8? 04 08 52 BA 00 00 00 00 52 50 E8 ?? F? FF FF E9 ?? ?? 00 00 ?? ?? 0? 08 ?? ?? 0? 08 ?? ?? 0? 08 90 8D 74 26 00 55 89 E5 83 EC 18 80 3D ?? ?? ?? 08 00 75 1C B8 00 00 00 00 85 C0 74 0C C7 04 24 ?? ?? 0? 08 E8 ?C 7? FB F7 C6 05 ?? ?? ?? 08 01 C9 C3 8D 76 00 55 B8 00 00 }
	condition:
		$1 at elf.entry_point
}

rule free_pascal_260
{
	meta:
		tool = "C"
		name = "Free Pascal"
		version = "2.6.0"
		source = "from Detect It Easy signatures"
		pattern = "5989E38D44????83E4??8915????????A3????????890D????????891D????????E8????????8925????????31EDE8????????C3"
	strings:
		$1 = { 59 89 E3 8D 44 ?? ?? 83 E4 ?? 89 15 ?? ?? ?? ?? A3 ?? ?? ?? ?? 89 0D ?? ?? ?? ?? 89 1D ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 25 ?? ?? ?? ?? 31 ED E8 ?? ?? ?? ?? C3 }
	condition:
		$1 at elf.entry_point
}

rule gcc_32x_bsd
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.2.x"
		extra = "BSD"
		pattern = "5557565383EC??8B7424??8B6C24??8B3EC745??????????C74424??????????C74424??????????8B078904248D4424??894424??FF57"
	strings:
		$1 = { 55 57 56 53 83 EC ?? 8B 74 24 ?? 8B 6C 24 ?? 8B 3E C7 45 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 8B 07 89 04 24 8D 44 24 ?? 89 44 24 ?? FF 57 }
	condition:
		$1 at elf.entry_point
}

rule gcc_321_bsd
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.2.1"
		extra = "BSD"
		pattern = "5589E557565383EC??89D18D7D??8B5F??8D74????8935????????85DB7E??837D????74??8B45??A3????????89C28038??74??8DB6????????8DBF????????803A??75??8D42??A3"
	strings:
		$1 = { 55 89 E5 57 56 53 83 EC ?? 89 D1 8D 7D ?? 8B 5F ?? 8D 74 ?? ?? 89 35 ?? ?? ?? ?? 85 DB 7E ?? 83 7D ?? ?? 74 ?? 8B 45 ?? A3 ?? ?? ?? ?? 89 C2 80 38 ?? 74 ?? 8D B6 ?? ?? ?? ?? 8D BF ?? ?? ?? ?? 80 3A ?? 75 ?? 8D 42 ?? A3 }
	condition:
		$1 at elf.entry_point
}

rule gcc_346_bsd
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.4.6"
		extra = "BSD"
		pattern = "5589E557565383EC??83E4??8B5D??89D78D74????85DB8935????????7E??8B45??85C074??A3????????89C10FB601"
	strings:
		$1 = { 55 89 E5 57 56 53 83 EC ?? 83 E4 ?? 8B 5D ?? 89 D7 8D 74 ?? ?? 85 DB 89 35 ?? ?? ?? ?? 7E ?? 8B 45 ?? 85 C0 74 ?? A3 ?? ?? ?? ?? 89 C1 0F B6 01 }
	condition:
		$1 at elf.entry_point
}

rule gcc_421_bsd
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.2.1"
		extra = "BSD"
		pattern = "5589E5565383EC??83E4??8B5D??89D18D74????85DB8935????????7E??8B45??85C074??A3????????0FB610"
	strings:
		$1 = { 55 89 E5 56 53 83 EC ?? 83 E4 ?? 8B 5D ?? 89 D1 8D 74 ?? ?? 85 DB 89 35 ?? ?? ?? ?? 7E ?? 8B 45 ?? 85 C0 74 ?? A3 ?? ?? ?? ?? 0F B6 10 }
	condition:
		$1 at elf.entry_point
}

rule gcc_42x_freebsd8
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.2.x"
		extra = "FreeBSD 8"
		pattern = "31ED5589E583E4F08D450883EC0450FF750452E808000000CC909090909090905589E557565383EC0C8B750C8B5D1085F68D7CB304893D????0?087E358B0385C0742FA3????0?080FB61084D2742383C001EB0A0FB61083C00184D2741480FA2F75F1A3????0?080FB61083C00184D275ECB8????0?0?85C074348B4508890424E8????????C70424????0?08E8????????E8??F?FFFF897C2408895C2404893424E8??0?0000890424E8????????E8????????EBD090905589E583EC08803D????0?0800740FEB388D760083C004A3????0?08FFD2A1????0?088B1085D275EBB80000000085C0741083EC0C68????0?08E8?97?FBF783C410C605????0?0801C9C3905589E583EC08B80000000085C0741583EC0868????0?0868????0?08E8?B7?FBF783C410A1????0?0885C07416B80000000085C0740D83EC0C68????0?08FFD083C410C9C3909090"
	strings:
		$1 = { 31 ED 55 89 E5 83 E4 F0 8D 45 08 83 EC 04 50 FF 75 04 52 E8 08 00 00 00 CC 90 90 90 90 90 90 90 55 89 E5 57 56 53 83 EC 0C 8B 75 0C 8B 5D 10 85 F6 8D 7C B3 04 89 3D ?? ?? 0? 08 7E 35 8B 03 85 C0 74 2F A3 ?? ?? 0? 08 0F B6 10 84 D2 74 23 83 C0 01 EB 0A 0F B6 10 83 C0 01 84 D2 74 14 80 FA 2F 75 F1 A3 ?? ?? 0? 08 0F B6 10 83 C0 01 84 D2 75 EC B8 ?? ?? 0? 0? 85 C0 74 34 8B 45 08 89 04 24 E8 ?? ?? ?? ?? C7 04 24 ?? ?? 0? 08 E8 ?? ?? ?? ?? E8 ?? F? FF FF 89 7C 24 08 89 5C 24 04 89 34 24 E8 ?? 0? 00 00 89 04 24 E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? EB D0 90 90 55 89 E5 83 EC 08 80 3D ?? ?? 0? 08 00 74 0F EB 38 8D 76 00 83 C0 04 A3 ?? ?? 0? 08 FF D2 A1 ?? ?? 0? 08 8B 10 85 D2 75 EB B8 00 00 00 00 85 C0 74 10 83 EC 0C 68 ?? ?? 0? 08 E8 ?9 7? FB F7 83 C4 10 C6 05 ?? ?? 0? 08 01 C9 C3 90 55 89 E5 83 EC 08 B8 00 00 00 00 85 C0 74 15 83 EC 08 68 ?? ?? 0? 08 68 ?? ?? 0? 08 E8 ?B 7? FB F7 83 C4 10 A1 ?? ?? 0? 08 85 C0 74 16 B8 00 00 00 00 85 C0 74 0D 83 EC 0C 68 ?? ?? 0? 08 FF D0 83 C4 10 C9 C3 90 90 90 }
	condition:
		$1 at elf.entry_point
}

rule gcc_45x_freebsd8
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.5"
		extra = "FreeBSD 8"
		pattern = "31ED5589E583E4F08D450883EC0450FF750452E808000000CC909090909090905589E557565383EC0C8B750C8B5D1085F68D7CB304893D????0?087E358B0385C0742FA3????0?080FB61084D2742383C001EB0A0FB61083C00184D2741480FA2F75F1A3????0?080FB61083C00184D275ECB8????0?0?85C074348B4508890424E8????????C70424?8??0?08E8????????E8??F?FFFF897C2408895C2404893424E8??0?0000890424E8????????E8????????EBD0909090909090909090905589E55383EC04803D????0?0800753FA1????0?08BB????0?0881EB????0?08C1FB0283EB0139D8731E8DB60000000083C001A3????0?08FF1485????0?08A1????0?0839D872E8C605????0?080183C4045B5DC38D7426008DBC27000000005589E583EC18A1????0?0885C07412B80000000085C07409C70424????0?08FFD0C9C390"
	strings:
		$1 = { 31 ED 55 89 E5 83 E4 F0 8D 45 08 83 EC 04 50 FF 75 04 52 E8 08 00 00 00 CC 90 90 90 90 90 90 90 55 89 E5 57 56 53 83 EC 0C 8B 75 0C 8B 5D 10 85 F6 8D 7C B3 04 89 3D ?? ?? 0? 08 7E 35 8B 03 85 C0 74 2F A3 ?? ?? 0? 08 0F B6 10 84 D2 74 23 83 C0 01 EB 0A 0F B6 10 83 C0 01 84 D2 74 14 80 FA 2F 75 F1 A3 ?? ?? 0? 08 0F B6 10 83 C0 01 84 D2 75 EC B8 ?? ?? 0? 0? 85 C0 74 34 8B 45 08 89 04 24 E8 ?? ?? ?? ?? C7 04 24 ?8 ?? 0? 08 E8 ?? ?? ?? ?? E8 ?? F? FF FF 89 7C 24 08 89 5C 24 04 89 34 24 E8 ?? 0? 00 00 89 04 24 E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? EB D0 90 90 90 90 90 90 90 90 90 90 55 89 E5 53 83 EC 04 80 3D ?? ?? 0? 08 00 75 3F A1 ?? ?? 0? 08 BB ?? ?? 0? 08 81 EB ?? ?? 0? 08 C1 FB 02 83 EB 01 39 D8 73 1E 8D B6 00 00 00 00 83 C0 01 A3 ?? ?? 0? 08 FF 14 85 ?? ?? 0? 08 A1 ?? ?? 0? 08 39 D8 72 E8 C6 05 ?? ?? 0? 08 01 83 C4 04 5B 5D C3 8D 74 26 00 8D BC 27 00 00 00 00 55 89 E5 83 EC 18 A1 ?? ?? 0? 08 85 C0 74 12 B8 00 00 00 00 85 C0 74 09 C7 04 24 ?? ?? 0? 08 FF D0 C9 C3 90 }
	condition:
		$1 at elf.entry_point
}

rule gcc_470_freebsdports
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.7.0"
		extra = "FreeBSD Ports Collection"
		pattern = "31ED5589E583E4F08D450883EC0450FF750452E808000000CC909090909090905589E557565383EC0C8B750C8B5D1085F68D7CB304893D????0?087E358B0385C0742FA3????0?080FB61084D2742383C001EB0A0FB61083C00184D2741480FA2F75F1A3????0?080FB61083C00184D275ECB8????0?0?85C074348B4508890424E8????????C70424?8??0?08E8????????E8??F?FFFF897C2408895C2404893424E8????????890424E8????????E8????????EBD0909090909090909090905589E55383EC04803D????0?0800753FA1????0?08BB????0?0881EB????0?08C1FB0283EB0139D8731E8DB60000000083C001A3????0?08FF1485????0?08A1????0?0839D872E8C605????0?080183C4045B5DC38D7426008DBC27000000005589E583EC18A1????0?0885C07412B80000000085C07409C70424????0?08FFD0C9C390"
	strings:
		$1 = { 31 ED 55 89 E5 83 E4 F0 8D 45 08 83 EC 04 50 FF 75 04 52 E8 08 00 00 00 CC 90 90 90 90 90 90 90 55 89 E5 57 56 53 83 EC 0C 8B 75 0C 8B 5D 10 85 F6 8D 7C B3 04 89 3D ?? ?? 0? 08 7E 35 8B 03 85 C0 74 2F A3 ?? ?? 0? 08 0F B6 10 84 D2 74 23 83 C0 01 EB 0A 0F B6 10 83 C0 01 84 D2 74 14 80 FA 2F 75 F1 A3 ?? ?? 0? 08 0F B6 10 83 C0 01 84 D2 75 EC B8 ?? ?? 0? 0? 85 C0 74 34 8B 45 08 89 04 24 E8 ?? ?? ?? ?? C7 04 24 ?8 ?? 0? 08 E8 ?? ?? ?? ?? E8 ?? F? FF FF 89 7C 24 08 89 5C 24 04 89 34 24 E8 ?? ?? ?? ?? 89 04 24 E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? EB D0 90 90 90 90 90 90 90 90 90 90 55 89 E5 53 83 EC 04 80 3D ?? ?? 0? 08 00 75 3F A1 ?? ?? 0? 08 BB ?? ?? 0? 08 81 EB ?? ?? 0? 08 C1 FB 02 83 EB 01 39 D8 73 1E 8D B6 00 00 00 00 83 C0 01 A3 ?? ?? 0? 08 FF 14 85 ?? ?? 0? 08 A1 ?? ?? 0? 08 39 D8 72 E8 C6 05 ?? ?? 0? 08 01 83 C4 04 5B 5D C3 8D 74 26 00 8D BC 27 00 00 00 00 55 89 E5 83 EC 18 A1 ?? ?? 0? 08 85 C0 74 12 B8 00 00 00 00 85 C0 74 09 C7 04 24 ?? ?? 0? 08 FF D0 C9 C3 90 }
	condition:
		$1 at elf.entry_point
}

rule gcc_33x_centos54
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.3.x"
		comment = "CentOS 5.4"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668??8?0408E8????????F490905589E55383EC04E8000000005B81C3????0?008B93FCFFFFFF85D27405E8????F?F?585BC9C39090909090905589E583EC08803D????0?080075??A1????0?088B1085D2741B8DB60000000083C004A3????0?08FFD2A1????0?088B1085D275EB"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? 8? 04 08 E8 ?? ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? 0? 00 8B 93 FC FF FF FF 85 D2 74 05 E8 ?? ?? F? F? 58 5B C9 C3 90 90 90 90 90 90 55 89 E5 83 EC 08 80 3D ?? ?? 0? 08 00 75 ?? A1 ?? ?? 0? 08 8B 10 85 D2 74 1B 8D B6 00 00 00 00 83 C0 04 A3 ?? ?? 0? 08 FF D2 A1 ?? ?? 0? 08 8B 10 85 D2 75 EB }
	condition:
		$1 at elf.entry_point
}

rule gcc_34x
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.4.x"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668??8?0408E8????????F490905589E55383EC04E8000000005B81C3????0?008B93FCFFFFFF85D27405E8????F?F?585BC9C39090909090905589E583EC08803D????0?0800740CEB??83C004A3????0?08FFD2A1????0?088B1085D275EB"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? 8? 04 08 E8 ?? ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? 0? 00 8B 93 FC FF FF FF 85 D2 74 05 E8 ?? ?? F? F? 58 5B C9 C3 90 90 90 90 90 90 55 89 E5 83 EC 08 80 3D ?? ?? 0? 08 00 74 0C EB ?? 83 C0 04 A3 ?? ?? 0? 08 FF D2 A1 ?? ?? 0? 08 8B 10 85 D2 75 EB }
	condition:
		$1 at elf.entry_point
}

rule gcc_40x_42x
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.0.x - 4.2.x"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668??8?0408E8????????F490905589E55383EC04E8000000005B81C3????0?008B93FCFFFFFF85D27405E8????F?F?585BC9C390905589E583EC08803D????0?0800740CEB??83C004A3????0?08FFD2A1????0?088B1085D275EB"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? 8? 04 08 E8 ?? ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? 0? 00 8B 93 FC FF FF FF 85 D2 74 05 E8 ?? ?? F? F? 58 5B C9 C3 90 90 55 89 E5 83 EC 08 80 3D ?? ?? 0? 08 00 74 0C EB ?? 83 C0 04 A3 ?? ?? 0? 08 FF D2 A1 ?? ?? 0? 08 8B 10 85 D2 75 EB }
	condition:
		$1 at elf.entry_point
}

rule gcc_43x
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.3.x"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668??8?0408E8????????F490905589E55383EC04E8000000005B81C3????0?008B93FCFFFFFF85D27405E8????F?F?585BC9C39090909090905589E55383EC04803D????0?080075??8B15????0?08B8????0?082D????0?08C1F8028D58FF39DA731F8DB6000000008D4201A3????0?08FF1485????0?088B15????0?0839DA72E7"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? 8? 04 08 E8 ?? ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? 0? 00 8B 93 FC FF FF FF 85 D2 74 05 E8 ?? ?? F? F? 58 5B C9 C3 90 90 90 90 90 90 55 89 E5 53 83 EC 04 80 3D ?? ?? 0? 08 00 75 ?? 8B 15 ?? ?? 0? 08 B8 ?? ?? 0? 08 2D ?? ?? 0? 08 C1 F8 02 8D 58 FF 39 DA 73 1F 8D B6 00 00 00 00 8D 42 01 A3 ?? ?? 0? 08 FF 14 85 ?? ?? 0? 08 8B 15 ?? ?? 0? 08 39 DA 72 E7 }
	condition:
		$1 at elf.entry_point
}

rule gcc_44x_45x
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.4.x - 4.5.x"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668??8?0408E8????????F490905589E55383EC04E8000000005B81C3????0?008B93FCFFFFFF85D27405E8????F?F?585BC9C39090909090905589E55383EC?4803D????0?080075??A1????0?08BB????0?0881EB????0?08C1FB024B39D8731E908DB4260000000040A3????0?08FF1485????0?08A1????0?0839D872EA"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? 8? 04 08 E8 ?? ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? 0? 00 8B 93 FC FF FF FF 85 D2 74 05 E8 ?? ?? F? F? 58 5B C9 C3 90 90 90 90 90 90 55 89 E5 53 83 EC ?4 80 3D ?? ?? 0? 08 00 75 ?? A1 ?? ?? 0? 08 BB ?? ?? 0? 08 81 EB ?? ?? 0? 08 C1 FB 02 4B 39 D8 73 1E 90 8D B4 26 00 00 00 00 40 A3 ?? ?? 0? 08 FF 14 85 ?? ?? 0? 08 A1 ?? ?? 0? 08 39 D8 72 EA }
	condition:
		$1 at elf.entry_point
}

rule gcc_45x
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.5.x"
		extra = "Ubuntu"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668????0408E8????????F490909090909090909090909090905589E55383EC?4803D????0?080075??A1????0?08BB???F0?0881EB???F0?08C1FB0283EB0139D8731E8DB60000000083C001A3????0?08FF1485???F0?08A1????0?0839D872E8"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? ?? 04 08 E8 ?? ?? ?? ?? F4 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 89 E5 53 83 EC ?4 80 3D ?? ?? 0? 08 00 75 ?? A1 ?? ?? 0? 08 BB ?? ?F 0? 08 81 EB ?? ?F 0? 08 C1 FB 02 83 EB 01 39 D8 73 1E 8D B6 00 00 00 00 83 C0 01 A3 ?? ?? 0? 08 FF 14 85 ?? ?F 0? 08 A1 ?? ?? 0? 08 39 D8 72 E8 }
	condition:
		$1 at elf.entry_point
}

rule gcc_46x
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.6.x"
		pattern = "31ED5E89E183E4F050545268?0??040868?0??0408515668??8?0408E8????????F490905589E55383EC04E8000000005B81C3????0?008B93FCFFFFFF85D27405E8????F?F?585BC9C39090909090905589E55383EC?4803D????0?080075??A1????0?08BB????0?0881EB????0?08C1FB0283EB0139D8731E8DB60000000083C001A3????0?08FF1485????0?08A1????0?0839D872E8"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 04 08 68 ?0 ?? 04 08 51 56 68 ?? 8? 04 08 E8 ?? ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? 0? 00 8B 93 FC FF FF FF 85 D2 74 05 E8 ?? ?? F? F? 58 5B C9 C3 90 90 90 90 90 90 55 89 E5 53 83 EC ?4 80 3D ?? ?? 0? 08 00 75 ?? A1 ?? ?? 0? 08 BB ?? ?? 0? 08 81 EB ?? ?? 0? 08 C1 FB 02 83 EB 01 39 D8 73 1E 8D B6 00 00 00 00 83 C0 01 A3 ?? ?? 0? 08 FF 14 85 ?? ?? 0? 08 A1 ?? ?? 0? 08 39 D8 72 E8 }
	condition:
		$1 at elf.entry_point
}

rule gcc_346
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.4.6"
		pattern = "31ED5E89E183E4F050545268?0????0?68?0????0?515668??????0?E8?F??????F490905589E55383EC04E8000000005B81C3??????0?8B93FCFFFFFF85D27405E8?A??F?F?585BC9C39090909090905589E583EC08803D??????0?00740CEB??83C004"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? ?? 0? 68 ?0 ?? ?? 0? 51 56 68 ?? ?? ?? 0? E8 ?F ?? ?? ?? F4 90 90 55 89 E5 53 83 EC 04 E8 00 00 00 00 5B 81 C3 ?? ?? ?? 0? 8B 93 FC FF FF FF 85 D2 74 05 E8 ?A ?? F? F? 58 5B C9 C3 90 90 90 90 90 90 55 89 E5 83 EC 08 80 3D ?? ?? ?? 0? 00 74 0C EB ?? 83 C0 04 }
	condition:
		$1 at elf.entry_point
}

rule gcc_451_rhel
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.5.1"
		extra = "RHEL"
		pattern = "31ED5E89E183E4F050545268?0????0868?0????08515668??????08E8????????F490909090909090909090909090905589E5538D6424?C803D??????080075??BB??????08A1??????0881EB??????08C1FB0283EB0139D8731D908D7426008D4001A3"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? ?? 08 68 ?0 ?? ?? 08 51 56 68 ?? ?? ?? 08 E8 ?? ?? ?? ?? F4 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 89 E5 53 8D 64 24 ?C 80 3D ?? ?? ?? 08 00 75 ?? BB ?? ?? ?? 08 A1 ?? ?? ?? 08 81 EB ?? ?? ?? 08 C1 FB 02 83 EB 01 39 D8 73 1D 90 8D 74 26 00 8D 40 01 A3 }
	condition:
		$1 at elf.entry_point
}

rule gcc_463_rhel
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.6.3"
		extra = "RHEL"
		pattern = "31ED5E89E183E4F050545268?0????0868?0????08515668?????408E8????????F49090"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? ?? 08 68 ?0 ?? ?? 08 51 56 68 ?? ?? ?4 08 E8 ?? ?? ?? ?? F4 90 90 }
	condition:
		$1 at elf.entry_point
}

rule gcc_470_rhel
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.7.0"
		extra = "RHEL"
		pattern = "31ED5E89E183E4F050545268?0????0?68?0????0?515668??????0?E8????????F466908B1C24C3"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? ?? 0? 68 ?0 ?? ?? 0? 51 56 68 ?? ?? ?? 0? E8 ?? ?? ?? ?? F4 66 90 8B 1C 24 C3 }
	condition:
		$1 at elf.entry_point
}

rule gcc_472
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.7.2"
		pattern = "55575653E8????????81C3????????83EC??8B93????????8B8B????????8B83????????8B2A8B93????????890C24895424??8B93????????895424??EB"
	strings:
		$1 = { 55 57 56 53 E8 ?? ?? ?? ?? 81 C3 ?? ?? ?? ?? 83 EC ?? 8B 93 ?? ?? ?? ?? 8B 8B ?? ?? ?? ?? 8B 83 ?? ?? ?? ?? 8B 2A 8B 93 ?? ?? ?? ?? 89 0C 24 89 54 24 ?? 8B 93 ?? ?? ?? ?? 89 54 24 ?? EB }
	condition:
		$1 at elf.entry_point
}

rule gcc_343_solaris211
{
	meta:
		tool = "C"
		name = "GCC"
		version = "3.4.3"
		extra = "Solaris 2.11"
		pattern = "6A006A008BECB8??1?060885C0740952E8?BF?FFFF83C40468?0??0508E8?EF?FFFF83C4048D05??1?06088B0085C074158D05??1?06088B0085C0740950E8?DFEFFFF83C4048B45088B15??1?060885D2750A8D5485108915??1?060883E4F083EC04528D550C8915??1?06085250E8?CFEFFFFE823000000E8??0?0000E8??0?000089042489442404E8?1FEFFFF8B442404890424E8?5FEFFFFF4558BEC525183EC048D0D??1?06088B09D1E983F90074609BD97C24008BD183E21F8A82??1?060820442400F7C100020000740580642400FD8BD183E26074188BC283E020D1E033D0C1E2056681642400FFF3660954240081E180010000741481F180010000D1E16681642400FFFC66094C2400D96C240083C404595A5DC39090C39090905589E553E8000000005B81C3??0?01005280BB??0?000000740DEB3A83C0048983??0?0000FFD28B83??0?00008B1085D275E98B831C00000085C0741283EC0C8D83??01000050E8?4F?FFFF83C410C683??0?0000018B5DFCC9C3905589E553E8000000005B81C3??0?0100508B832400000085C07419536A008D83??0?0000508D83??01000050E8?3FDFFFF83C4108B83??0?000085C0741E8B8B2C00000085C9741483EC0C8D83??0?000050E8?DFDFFFF83C41066908B5DFCC9C3909090"
	strings:
		$1 = { 6A 00 6A 00 8B EC B8 ?? 1? 06 08 85 C0 74 09 52 E8 ?B F? FF FF 83 C4 04 68 ?0 ?? 05 08 E8 ?E F? FF FF 83 C4 04 8D 05 ?? 1? 06 08 8B 00 85 C0 74 15 8D 05 ?? 1? 06 08 8B 00 85 C0 74 09 50 E8 ?D FE FF FF 83 C4 04 8B 45 08 8B 15 ?? 1? 06 08 85 D2 75 0A 8D 54 85 10 89 15 ?? 1? 06 08 83 E4 F0 83 EC 04 52 8D 55 0C 89 15 ?? 1? 06 08 52 50 E8 ?C FE FF FF E8 23 00 00 00 E8 ?? 0? 00 00 E8 ?? 0? 00 00 89 04 24 89 44 24 04 E8 ?1 FE FF FF 8B 44 24 04 89 04 24 E8 ?5 FE FF FF F4 55 8B EC 52 51 83 EC 04 8D 0D ?? 1? 06 08 8B 09 D1 E9 83 F9 00 74 60 9B D9 7C 24 00 8B D1 83 E2 1F 8A 82 ?? 1? 06 08 20 44 24 00 F7 C1 00 02 00 00 74 05 80 64 24 00 FD 8B D1 83 E2 60 74 18 8B C2 83 E0 20 D1 E0 33 D0 C1 E2 05 66 81 64 24 00 FF F3 66 09 54 24 00 81 E1 80 01 00 00 74 14 81 F1 80 01 00 00 D1 E1 66 81 64 24 00 FF FC 66 09 4C 24 00 D9 6C 24 00 83 C4 04 59 5A 5D C3 90 90 C3 90 90 90 55 89 E5 53 E8 00 00 00 00 5B 81 C3 ?? 0? 01 00 52 80 BB ?? 0? 00 00 00 74 0D EB 3A 83 C0 04 89 83 ?? 0? 00 00 FF D2 8B 83 ?? 0? 00 00 8B 10 85 D2 75 E9 8B 83 1C 00 00 00 85 C0 74 12 83 EC 0C 8D 83 ?? 01 00 00 50 E8 ?4 F? FF FF 83 C4 10 C6 83 ?? 0? 00 00 01 8B 5D FC C9 C3 90 55 89 E5 53 E8 00 00 00 00 5B 81 C3 ?? 0? 01 00 50 8B 83 24 00 00 00 85 C0 74 19 53 6A 00 8D 83 ?? 0? 00 00 50 8D 83 ?? 01 00 00 50 E8 ?3 FD FF FF 83 C4 10 8B 83 ?? 0? 00 00 85 C0 74 1E 8B 8B 2C 00 00 00 85 C9 74 14 83 EC 0C 8D 83 ?? 0? 00 00 50 E8 ?D FD FF FF 83 C4 10 66 90 8B 5D FC C9 C3 90 90 90 }
	condition:
		$1 at elf.entry_point
}

rule gc
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "83EC088B4424088D5C240C890424895C2404E809000000CD03??????????????E9"
	strings:
		$1 = { 83 EC 08 8B 44 24 08 8D 5C 24 0C 89 04 24 89 5C 24 04 E8 09 00 00 00 CD 03 ?? ?? ?? ?? ?? ?? ?? E9 }
	condition:
		$1 at elf.entry_point
}
