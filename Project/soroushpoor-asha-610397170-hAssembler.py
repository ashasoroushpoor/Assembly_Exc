log = False
# lists for cheking
eightbit_reg = ['al', 'cl', 'dl', 'bl', 'ah', 'ch', 'dh', 'bh']
sixteenbit_reg = ['ax', 'cx', 'dx', 'bx', 'sp', 'bp', 'si', 'di']
thirtytwo_reg = ['eax', 'ecx', 'edx', 'ebx', 'esp', 'ebp', 'esi', 'edi']
sixtyfour_reg = ['rax', 'rcx', 'rdx', 'rbx', 'rsp', 'rbp', 'rsi', 'rdi']
neweight_reg = ['r8b', 'r9b', 'r10b', 'r11b', 'r12b', 'r13b', 'r14b', 'r15b']
newsixteen_reg = ['r8w', 'r9w', 'r10w', 'r11w', 'r12w', 'r13w', 'r14w', 'r15w']
newthirtytwo_reg = ['r8d', 'r9d', 'r10d',
                    'r11d', 'r12d', 'r13d', 'r14d', 'r15d']
newsixtyfour_reg = ['r8', 'r9', 'r10', 'r11', 'r12', 'r13', 'r14', 'r15']
# register_codes
new_registers = ['r8b', 'r9b', 'r10b', 'r11b', 'r12b', 'r13b', 'r14b', 'r15b',
                 'r8w', 'r9w', 'r10w', 'r11w', 'r12w', 'r13w', 'r14w', 'r15w',
                 'r8d', 'r9d', 'r10d', 'r11d', 'r12d', 'r13d', 'r14d', 'r15d',
                 'r8', 'r9', 'r10', 'r11', 'r12', 'r13', 'r14', 'r15']
old_register_codes = {'al': '000', 'ax': '000', 'eax': '000', 'rax': '000',
                      'cl': '001', 'cx': '001', 'ecx': '001', 'rcx': '001',
                      'dl': '010', 'dx': '010', 'edx': '010', 'rdx': '010',
                      'bl': '011', 'bx': '011', 'ebx': '011', 'rbx': '011',
                      'ah': '100', 'sp': '100', 'esp': '100', 'rsp': '100',
                      'ch': '101', 'bp': '101', 'ebp': '101', 'rbp': '101',
                      'dh': '110', 'si': '110', 'esi': '110', 'rsi': '110',
                      'bh': '111', 'di': '111', 'edi': '111', 'rdi': '111'}
new_register_codes = {'r8b': '000', 'r9b': '001', 'r10b': '010', 'r11b': '011',
                      'r12b': '100', 'r13b': '101', 'r14b': '110', 'r15b': '111',
                      'r8w': '000', 'r9w': '001', 'r10w': '010', 'r11w': '011',
                      'r12w': '100', 'r13w': '101', 'r14w': '110', 'r15w': '111',
                      'r8d': '000', 'r9d': '001', 'r10d': '010', 'r11d': '011',
                      'r12d': '100', 'r13d': '101', 'r14d': '110', 'r15d': '111',
                      'r8': '000', 'r9': '001', 'r10': '010', 'r11': '011',
                      'r12': '100', 'r13': '101', 'r14': '110', 'r15': '111'}
all_register_codes = {'al': '000', 'ax': '000', 'eax': '000', 'rax': '000',
                      'cl': '001', 'cx': '001', 'ecx': '001', 'rcx': '001',
                      'dl': '010', 'dx': '010', 'edx': '010', 'rdx': '010',
                      'bl': '011', 'bx': '011', 'ebx': '011', 'rbx': '011',
                      'ah': '100', 'sp': '100', 'esp': '100', 'rsp': '100',
                      'ch': '101', 'bp': '101', 'ebp': '101', 'rbp': '101',
                      'dh': '110', 'si': '110', 'esi': '110', 'rsi': '110',
                      'bh': '111', 'di': '111', 'edi': '111', 'rdi': '111',
                      'r8b': '000', 'r9b': '001', 'r10b': '010', 'r11b': '011',
                      'r12b': '100', 'r13b': '101', 'r14b': '110', 'r15b': '111',
                      'r8w': '000', 'r9w': '001', 'r10w': '010', 'r11w': '011',
                      'r12w': '100', 'r13w': '101', 'r14w': '110', 'r15w': '111',
                      'r8d': '000', 'r9d': '001', 'r10d': '010', 'r11d': '011',
                      'r12d': '100', 'r13d': '101', 'r14d': '110', 'r15d': '111',
                      'r8': '000', 'r9': '001', 'r10': '010', 'r11': '011',
                      'r12': '100', 'r13': '101', 'r14': '110', 'r15': '111'}
tttn_codes = {'o': '0000',
              'no': '0001',
              'b': '0010', 'nae': '0010',
              'nb': '0011', 'ae': '0011',
              'e': '0100', 'z': '0100',
              'ne': '0101', 'nz': '0101',
              'be': '0110', 'na': '0100',
              'a': '0111', 'nbe': '0111',
              's': '1000',
              'ns': '1001',
              'p': '1010', 'pe': '1010',
              'np': '1011', 'po': '1011',
              'l': '1100', 'nge': '1100',
              'nl': '1101', 'ge': '1101',
              'le': '1110', 'ng': '1110',
              'nle': '1111', 'g': '1111'}
operations = []

# common terminology used in all functions
# argi_type : 0 = old register , 1 = new register , 2 = memory , 3 = immediate
# arg_size : 0 = 8-bit , 1 = 16-bit , 2 = 32-bit , 3 = 64-bit


def set_w(arg):  # assuming arg is register
    if arg in eightbit_reg or arg in neweight_reg:
        return '0'
    else:
        return '1'


def set_w_bysize(argsize):
    if argsize == 0:
        return '0'
    else:
        return '1'


def set_s(immdeiate_size, dest_size):
    if(immdeiate_size == 0 and dest_size != 0):
        return "1"
    else:
        return "0"


def Rex_generator2(arg1, arg2, operand_size, x='0'):
    if(log):
        print("Rex2")
    res = '0100'
    if operand_size == 3:  # w
        res += '1'
    else:
        res += '0'

    if arg2 in new_registers:  # R
        res += '1'
    else:
        res += '0'

    res += x  # x
    if arg1 in new_registers:  # B
        res += '1'
    else:
        res += '0'

    return res


def Rex_generator3(arg1, rexxb, operand_size):
    if(log):
        print("Rex3")
    res = '0100'
    if operand_size == 3:
        res += '1'
    else:
        res += '0'

    if arg1 in new_registers:
        res += '1'
    else:
        res += '0'

    res += rexxb

    return res


def isAccumulator(arg):
    if arg == "rax" or arg == "eax" or arg == "ax" or arg == "al":
        return True
    else:
        return False


def argument_type(arg):
    if arg in sixtyfour_reg:
        arg_size = 3
        arg_type = 0
    elif arg in thirtytwo_reg:
        arg_size = 2
        arg_type = 0
    elif arg in sixteenbit_reg:
        arg_size = 1
        arg_type = 0
    elif arg in eightbit_reg:
        arg_size = 0
        arg_type = 0
    elif arg in newsixtyfour_reg:
        arg_size = 3
        arg_type = 1
    elif arg in newthirtytwo_reg:
        arg_size = 2
        arg_type = 1
    elif arg in newsixteen_reg:
        arg_size = 1
        arg_type = 1
    elif arg in neweight_reg:
        arg_size = 0
        arg_type = 1
    elif arg.startswith('QWORD'):
        arg_size = 3
        arg_type = 2
    elif arg.startswith('DWORD'):
        arg_size = 2
        arg_type = 2
    elif arg.startswith('WORD'):
        arg_size = 1
        arg_type = 2
    elif arg.startswith('BYTE'):
        arg_size = 0
        arg_type = 2
    else:
        arg_type = 3
        if arg[0] == '0' and arg[1] == 'x':
            si = (len(arg) - 2)
        else:  # it is decimal
            si = (len(hex(int(arg))) - 2)

        if si <= 2:
            arg_size = 0
        elif si <= 4:
            arg_size = 1
        elif si <= 8:
            arg_size = 2
        else:
            arg_size = 3

    return arg_type, arg_size


def prefix(operand_size=0, address_size=0):
    res = ''
    if(address_size == 2):  # addr size = 32: 67
        res += '01100111'
    if(operand_size == 1):  # operand size 16:66
        res += '01100110'
    return res


def scaler(scale):
    code = '00'
    if scale == "8":
        code = '11'
    elif scale == "4":
        code = "10"
    elif scale == "2":
        code = "01"
    elif scale == "1":
        code = "00"
    return code


def convertAddrSize(sizeName):
    if(sizeName == 'BYTE'):
        return 0
    elif(sizeName == 'WORD'):
        return 1
    elif(sizeName == 'DWORD'):
        return 2
    elif(sizeName == 'QWORD'):
        return 3


def displacement(disp, ttbit=False):
    disp = disp[2:]  # first two 0x
    if(len(disp) > 2):
        ttbit = True
    elif(bin(int(disp, 16))[2:].zfill(8)[0] == "1"):  # the else is important
        # print(bin(int(disp, 16)))
        ttbit = True

    if(ttbit):
        disp = bin(int(disp, 16))[2:].zfill(32)
    else:
        disp = bin(int(disp, 16))[2:].zfill(8)
    res = ""
    while len(disp) > 0:
        res += disp[-8:]
        disp = disp[:-8]
    return res


def convertImmediate(imm, size=0):
    imm = imm[2:]  # first two 0x
    if(len(imm) > 4 and size < 2):
        size = 3
    elif(len(imm) > 2 and size < 1):
        size = 2

    if(size == 3):
        imm = bin(int(imm, 16))[2:].zfill(32)
    elif(size == 2):
        imm = bin(int(imm, 16))[2:].zfill(32)
    elif(size == 1):
        imm = bin(int(imm, 16))[2:].zfill(16)
    elif(size == 0):
        imm = bin(int(imm, 16))[2:].zfill(8)
    res = ""
    while len(imm) > 0:
        res += imm[-8:]
        imm = imm[:-8]
    return res


def memoryAddr(arg1, arg2code):  # sets r/m and sib and displacement
    # print(arg1)
    arg1 = arg1[1:-1]
    rexx = '0'
    rexb = '0'
    addrSize = 0
    code = ""
    if('*' not in arg1 and '+' not in arg1 and arg1[0:2] == "0x"):
        # direct memory address
        # 00 argcode 100 00100101 disp
        code = '00'
        code += arg2code
        code += '100'
        code += '00100101'
        code += displacement(arg1, True)
    elif('*' not in arg1 and '+' not in arg1):  # simple register case
        if(arg1 == "rbp" or arg1 == "ebp" or arg1 == "bp" or arg1 == "bh"):
            # rbp case we have forced 8bit displacement
            # 01 arg2code 101 ,0000 0000
            code = "01" + arg2code + "101" + "0000" + "0000"
        elif(arg1 == "rsp" or arg1 == "esp" or arg1 == "sp" or arg1 == "ah"):
            # rsp case where we have forced SIB use
            # 00 arg2code 100 ,00 100 100
            code = "00" + arg2code + "100" + "00" + "100" + "100"
        else:
            code = "00" + arg2code + all_register_codes[arg1]
            if(arg1 in new_registers):
                rexb = '1'
        addrSize = argument_type(arg1)[1]
    elif('*' in arg1 and "+" not in arg1):  # [arg*scale] case
        # we have 32 bit displacement
        # 00 arg2code 100 ,scale Index 101 ,0000 0000 0000 0000 0000 0000 0000 0000
        inx, scale = arg1.split('*')
        code = "00" + arg2code + "100" + \
            scaler(scale) + all_register_codes[inx] + "101" + "0000" + \
            "0000" + "0000" + "0000" + "0000" + "0000" + "0000" + "0000"

        if(inx in new_registers):
            rexx = '1'
        addrSize = argument_type(inx)[1]
    elif(arg1.count('+') == 2):
        # [base + inx*scale + displacement case
        # mod(01,10) arg2code 100, scale index base, displacement
        base, inx, disp = arg1.split('+')
        if("*" in inx):
            inx, scale = inx.split('*')
        else:
            scale = "1"

        mod = "00"
        if(len(disp)-2 <= 2 and bin(int(disp, 16))[2:].zfill(8)[0] != "1"):
            mod = "01"
        else:
            mod = "10"
        code = mod + arg2code + "100" + \
            scaler(scale) + \
            all_register_codes[inx] + \
            all_register_codes[base] + displacement(disp)
        if(inx in new_registers):
            rexx = '1'
        if(base in new_registers):
            rexb = '1'
        addrSize = argument_type(base)[1]
    elif('*' in arg1 and arg1.count('+') == 1):
        if(arg1.find("+") < arg1.find("*")):  # [base + arg*scale] case
            # mod(01,10) arg2code 100, scale index base
            base, inx = arg1.split('+')
            if("*" in inx):
                inx, scale = inx.split('*')
            else:
                scale = "1"

            mod = "00"
            if(base == "rbp" or base == "ebp" or base == "bp" or base == "bh"):
                mod = "01"
                code = mod + arg2code + "100" + \
                    scaler(
                        scale) + all_register_codes[inx] + all_register_codes[base] + "0000"+"0000"
            else:
                code = mod + arg2code + "100" + \
                    scaler(scale) + \
                    all_register_codes[inx] + all_register_codes[base]

            if(inx in new_registers):
                rexx = '1'
            if(base in new_registers):
                rexb = '1'
            addrSize = argument_type(base)[1]
        elif(arg1.find("+") > arg1.find("*")):
            # [Inx*scale + displacement] case
            # displacement is forced 32bit
            # 00 arg1code 100 scale inx 101 displacement
            inx, disp = arg1.split("+")
            if("*" in inx):
                inx, scale = inx.split('*')
            else:
                scale = "1"
            mod = "00"

            code = "00" + arg2code + "100" + \
                scaler(scale) + all_register_codes[inx] + \
                "101" + displacement(disp, ttbit=True)
            if(inx in new_registers):
                rexx = '1'

            addrSize = argument_type(inx)[1]
    elif('*' not in arg1 and "+" in arg1):
        first, second = arg1.split("+")
        if(second[0:2] == "0x"):
            # [base + displacement] case])
            base = first
            disp = second
            mod = "00"
            if(len(disp)-2 <= 2 and bin(int(disp, 16))[2:].zfill(8)[0] != "1"):
                mod = "01"
            else:
                mod = "10"
            code = mod + arg2code + \
                all_register_codes[base] + displacement(disp)
            if(base in new_registers):
                rexb = '1'

            addrSize = argument_type(base)[1]
        else:
            # [base + index] case
            base = first
            inx = second
            code = "00" + arg2code + "100" + \
                "00" + all_register_codes[inx] + all_register_codes[base]
            if(inx in new_registers):
                rexx = '1'
            if(base in new_registers):
                rexb = '1'

            addrSize = argument_type(base)[1]
    return code, rexx+rexb, addrSize


def mov(arg1, arg2):
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    # when both are old register
    if ((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 1000 100w:11 reg1 reg2
        code = '1000100'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if (arg1_size == 3 or arg2_type == 1 or arg1_type == 1):  # 64 bit
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif ((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 1000 101w: mod reg1 r/m
        code = '1000101'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif ((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 1000 100w: mod reg1 r/m
        # same as before with w changed
        code = '1000100'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1100 011w:11 000 reg:immediate #!this is old
        # 1011 wreg: immediate
        code = '1011'
        code += set_w(arg1)
        code += all_register_codes[arg1]
        code += convertImmediate(arg2, arg1_size)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1100 011w: mod 000 r/m: immediate data
        code = '1100011'
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "000")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)

    return code


def add(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 0000 000w:11 reg1 reg2
        code = '0000000'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 0000 001w: mod reg1 r/m
        code = '0000001'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0000 000w: mod reg1 r/m
        # same as before with w changed
        code = '0000000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 000 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11000"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 000 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "000")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)
    return code


def adc(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 0001 000w:11 reg1 reg2
        code = '0001000'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 0001 001w: mod reg1 r/m
        code = '0001001'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0001 000w: mod reg1 r/m
        # same as before with w changed
        code = '0001000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 010 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11010"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 010 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "010")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)
    return code


def sub(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 0010 000w:11 reg1 reg2
        code = '0010100'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 0010 101w: mod reg1 r/m
        code = '0010101'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0010 100w: mod reg1 r/m
        # same as before with w changed
        code = '0010100'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 101 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11101"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 101 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "101")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)
    return code


def sbb(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 0001 100w:11 reg1 reg2
        code = '0001100'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # memory to reg
        # 0001 101w: mod reg1 r/m
        code = '0001101'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0001 100w: mod reg1 r/m
        # same as before with w changed
        code = '0001100'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 011 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11011"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 011 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "011")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)
    return code


def andd(arg1, arg2):  # and was reserved word so i used andd
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    # when both are register
    if ((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0010 000w:11 reg1 reg2
        code = '0010000'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if (arg1_size == 3 or arg2_type == 1 or arg1_type == 1):  # 64 bit
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif ((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 0010 001w: mod reg1 r/m
        code = '0010001'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif ((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0010 000w: mod reg1 r/m
        # same as before with w changed
        code = '0010000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 100 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11100"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 100 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "100")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)

    return code


def orr(arg1, arg2):
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    # when both are register
    if ((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0000 100w:11 reg1 reg2
        code = '0000100'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if (arg1_size == 3 or arg2_type == 1 or arg1_type == 1):  # 64 bit
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif ((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 0000 101w: mod reg1 r/m
        code = '0000101'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif ((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0010 000w: mod reg1 r/m
        # same as before with w changed
        code = '0000100'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 001 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11001"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 001 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "001")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)

    return code


def xor(arg1, arg2):
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    # when both are register
    if ((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0011 000w:11 reg1 reg2
        code = '0011000'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if (arg1_size == 3 or arg2_type == 1 or arg1_type == 1):  # 64 bit
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif ((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # 0011 001w: mod reg1 r/m
        code = '0011001'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif ((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0011 000w: mod reg1 r/m
        # same as before with w changed
        code = '0011000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 110 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11110"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 110 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "110")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)

    return code


def dec(arg1):
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # register
        # 1111 111w:11 001 reg
        code = '1111111'
        code += set_w(arg1)
        code += '11001'
        code += all_register_codes[arg1]
        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # memory
        # 1111 111w: mod 001 r/m
        code = '1111111'
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "001")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def inc(arg1):
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # register
        # 1111 111w:11 000 reg
        code = '1111111'
        code += set_w(arg1)
        code += '11000'
        code += all_register_codes[arg1]
        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # memory
        # 1111 111w: mod 000 r/m
        code = '1111111'
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "000")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            # print(rexxb)
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def cmp(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 0011 100w:11 reg1 reg2
        code = '0011100'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 2):  # second one is memory
        # memory to reg
        # 0011 101w: mod reg1 r/m
        code = '0011101'
        code += set_w(arg2)
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0011 100w: mod reg1 r/m
        # same as before with w changed
        code = '0011100'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg2_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1000 00sw:11 111 reg:immediate
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w(arg1)
        code += "11111"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1000 00sw: mod 111 r/m: immediate data
        code = '100000'
        code += set_s(arg2_size, arg1_size)
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "111")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)
    return code


def test(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 1000 010w:11 reg1 reg2
        code = '1000010'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    #!we don't have memory to register
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 1000 010w: mod reg1 r/m
        # same as before with w changed
        code = '1000010'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif((arg1_type == 1 or arg1_type == 0) and arg2_type == 3):  # immediate to register
        # 1111 011w:11 000 reg:immediate
        code = '1111011'
        code += set_w(arg1)
        code += "11000"
        code += all_register_codes[arg1]
        code += convertImmediate(arg2)

        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + \
                code  # al so it defaults to 0
        code = prefix(arg1_size) + code
    elif(arg1_type == 2 and arg2_type == 3):  # immediate to memory
        # 1111 011w: mod 000 r/m: immediate data
        code = '1111011'
        code += set_w_bysize(arg1_size)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "000")
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2)
    return code


def xchg(arg1, arg2):
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    # when both are old register
    if ((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        if(isAccumulator(arg1)):
            # in accumulator case we have 10010reg
            code = '10010'
            code += all_register_codes[arg2]
        elif(isAccumulator(arg2)):
            # in accumulator case we have 10010reg
            code = '10010'
            code += all_register_codes[arg1]
        else:
            # 1000 011w:11 reg1 reg2
            code = '1000011'
            code += set_w(arg2)
            code += '11'
            code += all_register_codes[arg2]
            code += all_register_codes[arg1]
        if (arg1_size == 3 or arg2_type == 1 or arg1_type == 1):  # 64 bit
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    #!we don't have memory to register
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 1000 011w: mod reg1 r/m
        # same as before with w changed
        code = '1000011'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def xadd(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):  # when both are old register
        # 0000 1111 1100 000w:11 reg1 reg2
        code = '000011111100000'
        code += set_w(arg2)
        code += '11'
        code += all_register_codes[arg2]
        code += all_register_codes[arg1]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg1, arg2, arg1_size) + code
        code = prefix(arg1_size) + code
    #!we don't have memory to register
    elif((arg2_type == 0 or arg2_type == 1) and arg1_type == 2):  # first one is memory
        # 0000 1111 1100 000w: mod reg1 r/m
        # same as before with w changed
        code = '000011111100000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], all_register_codes[arg2])
        if(rexxb == "00" and arg2_size != 3 and arg1_size != 3 and arg2_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg2, rexxb, arg2_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def imul2(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0000 1111 :1010 1111 :11 reg1 reg2
        code = '0000111110101111'
        code += '11'
        code += all_register_codes[arg1]
        code += all_register_codes[arg2]
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg2, arg1, arg1_size) + code
        code = prefix(arg1_size) + code
    #!first can't be memory
    elif((arg1_type == 0 or arg1_type == 1) and arg2_type == 2):
        # 0000 1111 :1010 1111 :mod reg1 r/m
        code = '0000111110101111'
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg1_size != 3 and arg2_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def imul1(arg1):  # when we have 2 kinds of operations we have 2 different functions the 1 is one with 1 arg
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):  # register
        # 1111 011w:mod 101 reg
        code = '1111011'
        code += set_w(arg1)
        code += '11101'
        code += all_register_codes[arg1]
        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 011w:11 101 r/m
        code = '1111011'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "101")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def imul3(arg1, arg2, arg3):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    arg3_type, arg3_size = argument_type(arg3)

    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0110 10s1: 11 reg1 reg2 : immediate
        code = '011010'
        code += set_s(arg3_size, arg1_size)
        code += '111'
        code += all_register_codes[arg1]
        code += all_register_codes[arg2]
        code += convertImmediate(arg3)
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            #! again i don't know why i have to do this
            code = Rex_generator2(arg2, arg1, arg1_size) + code
        code = prefix(arg1_size) + code
    #! first can't be memory
    elif((arg1_type == 0 or arg1_type == 1) and arg2_type == 2):
        # 0110 10s1: mod reg1 r/m : immediate
        code = '011010'
        code += set_s(arg3_size, arg1_size)
        code += "1"
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg1_size != 3 and arg3_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg3)

    return code


def idiv(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):  # register
        # 1111 011w:11 111 reg
        code = '1111011'
        code += set_w(arg1)
        code += '11111'
        code += all_register_codes[arg1]
        if(arg1_size == 3):
            code = Rex_generator2(arg1, 'al', arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 011w:mod 111 r/m
        code = '1111011'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "111")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code

    return code


def bsf(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0000 1111 : 1011 1100: 11 reg1 reg2
        code = '0000111110111100'
        code += '11'
        code += all_register_codes[arg1]
        code += all_register_codes[arg2]
        #! i don't know why
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg2, arg1, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 0 or arg1_type == 1) and arg2_type == 2):
        #! first can't be memory
        # 0000 1111 1011 1100 mod reg1 r/m
        code = '0000111110111100'
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg1_size != 3 and arg2_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def bsr(arg1, arg2):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if((arg1_type == 0 or arg1_type == 1) and (arg2_type == 0 or arg2_type == 1)):
        # 0000 1111 : 1011 1101: 11 reg1 reg2
        code = '0000111110111101'
        code += '11'
        code += all_register_codes[arg1]
        code += all_register_codes[arg2]
        #! i don't know why
        if(arg1_size == 3 or arg2_type == 1 or arg1_type == 1):
            code = Rex_generator2(arg2, arg1, arg1_size) + code
        code = prefix(arg1_size) + code
    elif((arg1_type == 0 or arg1_type == 1) and arg2_type == 2):
        #! first can't be memory
        # 0000 1111 1011 1101 mod reg1 r/m
        code = '0000111110111101'
        codeR, rexxb, addrSize = memoryAddr(
            arg2.split(" ")[2], all_register_codes[arg1])
        if(rexxb == "00" and arg1_size != 3 and arg2_size != 3 and arg1_type != 1):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def stc():
    return '11111001'


def clc():
    return '11111000'


def std():
    return '11111101'


def cld():
    return '11111100'


def jmp(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1111 1111 : 11 100 reg
        code = '1111111111100'
        code += all_register_codes[arg1]
        if(arg1_type == 1):  # !jmp supports only 64bit reg
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 1111 : mod 100 r/m
        code = '11111111'
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "100")
        if(rexxb == "00"):  # !jmp supports only 64bit memory
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        # print(addrSize)
        code = prefix(arg1_size, addrSize) + code
    elif(arg1_type == 3):
        if(arg1_size == 0):  # 8bit displacment
            # 1110 1011 : disp
            code = '11101011'
            code += displacement(arg1)
        else:  # full diplacment
            # 1110 1001 : disp
            code = '11101001'
            code += displacement(arg1, True)

    return code


def jcc(ttn, arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 3):
        if(arg1_size == 0):  # 8bit displacment
            # 0111 ttn : disp
            code = '0111'
            code += tttn_codes[ttn]
            code += displacement(arg1)
        else:  # full diplacment
            # 0000 1111 : 1000 ttn : disp
            code = '000011111000'
            code += tttn_codes[ttn]
            code += displacement(arg1, True)

    return code


def shl(arg1, arg2):
    # shift by immediate
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if(arg1_type == 0 or arg1_type == 1):
        # 1100 000w 11 100 reg : imm8
        code = '1100000'
        code += set_w(arg1)
        code += '11100'
        code += all_register_codes[arg1]
        code += convertImmediate(arg2, 0)
        if(arg1_type == 1 or arg1_size == 3 or arg2_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1100 000w mod 100 r/m : imm8
        code = '1100000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "100")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2, 0)
    return code


def shl1(arg1):
    # shift left by 1
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1101 000w 11 100 reg
        code = '1101000'
        code += set_w(arg1)
        code += '11100'
        code += all_register_codes[arg1]
        if(arg1_type == 1 or arg1_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1101 000w : mod 100 reg
        code = '1101000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "100")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def shlcl(arg1):
    # shift left by cl
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1101 001w 11 100 reg
        code = '1101001'
        code += set_w(arg1)
        code += '11100'
        code += all_register_codes[arg1]
        if(arg1_type == 1 or arg1_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1101 001w : mod 100 reg
        code = '1101001'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "100")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def shr(arg1, arg2):
    # shift by immediate
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    arg2_type, arg2_size = argument_type(arg2)
    if(arg1_type == 0 or arg1_type == 1):
        # 1100 000w 11 101 reg : imm8
        code = '1100000'
        code += set_w(arg1)
        code += '11101'
        code += all_register_codes[arg1]
        code += convertImmediate(arg2, 0)
        if(arg1_type == 1 or arg1_size == 3 or arg2_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1100 000w mod 101 r/m : imm8
        code = '1100000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "101")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
        code += convertImmediate(arg2, 0)
    return code


def shr1(arg1):
    # shift left by 1
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1101 000w 11 101 reg
        code = '1101000'
        code += set_w(arg1)
        code += '11101'
        code += all_register_codes[arg1]
        if(arg1_type == 1 or arg1_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1101 000w : mod 101 reg
        code = '1101000'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "101")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def shrcl(arg1):
    # shift left by cl
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1101 001w 11 101 reg
        code = '1101001'
        code += set_w(arg1)
        code += '11101'
        code += all_register_codes[arg1]
        if(arg1_type == 1 or arg1_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1101 001w : mod 101 reg
        code = '1101001'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "101")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def nott(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1111 011w : 11 010 reg
        code = '1111011'
        code += set_w(arg1)
        code += '11010'
        code += all_register_codes[arg1]
        if(arg1_type == 1 or arg1_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 011w : mod 010 r/m
        code = '1111011'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "010")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def neg(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1111 011w : 11 011 reg
        code = '1111011'
        code += set_w(arg1)
        code += '11011'
        code += all_register_codes[arg1]
        if(arg1_type == 1 or arg1_size == 3):
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 011w : mod 011 r/m
        code = '1111011'
        code += set_w(arg1)
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "011")
        if(rexxb == "00" and arg1_size != 3):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def call(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 1111 1111 : 11 010 reg
        code = '11111111'
        code += '11010'
        code += all_register_codes[arg1]
        if(arg1_type == 1):  # ! just like push and pop
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 1111 : mod 010 r/m
        code = '11111111'
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "010")
        if(rexxb == "00"):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, 0) + code + \
                codeR  # !i don't know why w = 0 ?
        code = prefix(arg1_size, addrSize) + code
    return code


def ret():
    return "11000011"


def ret1(arg1):
    # 16bit disp
    return "11000010"+convertImmediate(arg1, 1)


def syscall():
    return '0000111100000101'


def push(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 0101 0reg
        code = '01010'
        code += all_register_codes[arg1]
        if(arg1_type == 1):  # !no need for checking 64 bit in site you can't push 32bit and 8bit
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1111 1111 mod 110 r/m
        code = '11111111'
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "110")
        if(rexxb == "00"):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    elif(arg1_type == 3):
        # 0110 10s0 : immediate
        code = '011010'
        if(arg1_size == 0):
            code += "10"
            code += convertImmediate(arg1, 0)
        else:
            code += "11"
            code += convertImmediate(arg1, 3)
    return code


def pop(arg1):
    # find out argument type and size
    arg1_type, arg1_size = argument_type(arg1)
    if(arg1_type == 0 or arg1_type == 1):
        # 0101 1reg
        code = '01011'
        code += all_register_codes[arg1]
        if(arg1_type == 1):  # !no need for checking 64 bit in site you can't push 32bit and 8bit
            code = Rex_generator2(arg1, "al", arg1_size) + code
        code = prefix(arg1_size) + code
    elif(arg1_type == 2):
        # 1000 1111 mod 000 r/m
        code = '10001111'
        codeR, rexxb, addrSize = memoryAddr(
            arg1.split(" ")[2], "000")
        if(rexxb == "00"):
            code = code+codeR
        else:
            code = Rex_generator3(arg1, rexxb, arg1_size) + code+codeR
        code = prefix(arg1_size, addrSize) + code
    return code


def parser(input):
    if(' ' in input):
        operation, arguments = input.split(' ', 1)
    else:
        operation = input
        arguments = ''
    if(log):
        print(operation)
    if(log):
        print(arguments)
    code = ''
    if (operation == 'mov'):
        arg1, arg2 = arguments.split(',', 1)
        code = mov(arg1, arg2)
    elif(operation == 'add'):
        arg1, arg2 = arguments.split(',', 1)
        code = add(arg1, arg2)
    elif(operation == 'adc'):
        arg1, arg2 = arguments.split(',', 1)
        code = adc(arg1, arg2)
    elif(operation == 'sub'):
        arg1, arg2 = arguments.split(',', 1)
        code = sub(arg1, arg2)
    elif(operation == 'sbb'):
        arg1, arg2 = arguments.split(',', 1)
        code = sbb(arg1, arg2)
    elif (operation == 'and'):
        arg1, arg2 = arguments.split(',', 1)
        code = andd(arg1, arg2)
    elif (operation == 'or'):
        arg1, arg2 = arguments.split(',', 1)
        code = orr(arg1, arg2)
    elif (operation == 'xor'):
        arg1, arg2 = arguments.split(',', 1)
        code = xor(arg1, arg2)
    elif(operation == 'dec'):
        arg1 = arguments
        code = dec(arg1)
    elif(operation == 'inc'):
        arg1 = arguments
        code = inc(arg1)
    elif (operation == 'cmp'):
        arg1, arg2 = arguments.split(',', 1)
        code = cmp(arg1, arg2)
    elif (operation == 'test'):
        arg1, arg2 = arguments.split(',', 1)
        code = test(arg1, arg2)
    elif (operation == 'xchg'):
        arg1, arg2 = arguments.split(',', 1)
        code = xchg(arg1, arg2)
    elif (operation == 'xadd'):
        arg1, arg2 = arguments.split(',', 1)
        code = xadd(arg1, arg2)
    elif (operation == 'imul'):
        if(arguments.count(",") == 0):
            arg1 = arguments
            code = imul1(arg1)
        elif(arguments.count(",") == 1):
            arg1, arg2 = arguments.split(',', 1)
            code = imul2(arg1, arg2)
        elif(arguments.count(",") == 2):
            arg1, arg2, arg3 = arguments.split(',', 2)
            code = imul3(arg1, arg2, arg3)
    elif (operation == 'idiv'):
        if(arguments.count(",") == 0):
            arg1 = arguments
            code = idiv(arg1)
        elif(arguments.count(",") == 1):
            arg1 = arguments.split(',')[1]
            code = idiv(arg1)
    elif (operation == 'bsf'):
        arg1, arg2 = arguments.split(',', 1)
        code = bsf(arg1, arg2)
    elif (operation == 'bsr'):
        arg1, arg2 = arguments.split(',', 1)
        code = bsr(arg1, arg2)
    elif(operation == 'stc'):
        code = stc()
    elif(operation == 'clc'):
        code = clc()
    elif(operation == 'std'):
        code = std()
    elif(operation == 'cld'):
        code = cld()
    elif(operation == 'jmp'):
        arg1 = arguments
        code = jmp(arg1)
    elif(operation[0] == 'j'):  # !we checked jmp before this
        arg1 = arguments
        ttn = operation[1:]
        code = jcc(ttn, arg1)
    elif(operation == 'shl'):
        if(arguments.count(",") == 0):
            arg1 = arguments
            code = shl1(arg1)
        else:
            arg1, arg2 = arguments.split(',', 1)
            if(arg2 == 'cl'):
                code = shlcl(arg1)
            else:
                code = shl(arg1, arg2)
    elif(operation == 'shr'):
        if(arguments.count(",") == 0):
            arg1 = arguments
            code = shr1(arg1)
        else:
            arg1, arg2 = arguments.split(',', 1)
            if(arg2 == 'cl'):
                code = shrcl(arg1)
            else:
                code = shr(arg1, arg2)
    elif(operation == 'neg'):
        arg1 = arguments
        code = neg(arg1)
    elif(operation == 'not'):
        arg1 = arguments
        code = nott(arg1)
    elif(operation == 'push'):
        arg1 = arguments
        code = push(arg1)
    elif(operation == 'pop'):
        arg1 = arguments
        code = pop(arg1)
    elif(operation == 'call'):
        arg1 = arguments
        code = call(arg1)
    elif(operation == 'ret'):
        if(arguments == ''):
            code = ret()
        else:
            code = ret1(arguments)
    elif(operation == 'syscall'):
        code = syscall()

    return code


if __name__ == "__main__":
    inp = input()
    # in2 = input()
    code = parser(inp)
    # code = displacement(inp)
    # code, rex = memoryAddr(inp, in2)
    if(log):
        print(code)
    res = hex(int(code, 2))[2:]
    if (len(res) % 2 == 1):
        res = '0'+res
    print(res)
    # arg_type, arg_size = argument_type(inp)
    # print(arg_type, arg_size)
