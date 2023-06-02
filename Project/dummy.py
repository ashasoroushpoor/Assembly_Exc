log = False

eightBit_codereg = {'000': 'al', '001': 'cl', '010': 'dl',
                    '011': 'bl', '100': 'ah', '101': 'ch', '110': 'dh', '111': 'bh'}
eightBit_codereg_new = {'000': 'r8b', '001': 'r9b', '010': 'r10b',
                        '011': 'r11b', '100': 'r12b', '101': 'r13b', '110': 'r14b', '111': 'r15b'}
sixteenBit_codereg = {'000': 'ax', '001': 'cx', '010': 'dx',
                      '011': 'bx', '100': 'sp', '101': 'bp', '110': 'si', '111': 'di'}
sixteenBit_codereg_new = {'000': 'r8w', '001': 'r9w', '010': 'r10w',
                          '011': 'r11w', '100': 'r12w', '101': 'r13w', '110': 'r14w', '111': 'r15w'}
thirtytwoBit_codereg = {'000': 'eax', '001': 'ecx', '010': 'edx',
                        '011': 'ebx', '100': 'esp', '101': 'ebp', '110': 'esi', '111': 'edi'}
thirtytwoBit_codereg_new = {'000': 'r8d', '001': 'r9d', '010': 'r10d',
                            '011': 'r11d', '100': 'r12d', '101': 'r13d', '110': 'r14d', '111': 'r15d'}
sixtyfourBit_codereg = {'000': 'rax', '001': 'rcx', '010': 'rdx',
                        '011': 'rbx', '100': 'rsp', '101': 'rbp', '110': 'rsi', '111': 'rdi'}
sixtyfourBit_codereg_new = {'000': 'r8', '001': 'r9', '010': 'r10',
                            '011': 'r11', '100': 'r12', '101': 'r13', '110': 'r14', '111': 'r15'}
# normal operand
opcode_normal = {'100010': 'mov', '000000': 'add', '000100': 'adc', '001010': 'sub',
                 '000110': 'sbb', '001000': 'and', '000010': 'or', '001100': 'xor',
                 '100001': 'test', '001110': 'cmp', '100001': 'xchg'}

# first operand is accumulator register and second is immediate data
# format is opcode(7)w: imm
opcode_acc = {  # '101000': 'mov', '000001': 'add', '000101': 'adc', '001011': 'sub','000111': 'sbb',
    # * this top line don't work in practice
    '0010010': 'and', '0000110': 'or', '0011010': 'xor',
    '1010100': 'test', '0011110': 'cmp'}
#!xchg with acc is 10010reg
#!imul with acc is 1111011w with reg1 as 101, this is {imul reg}
# second operand is immediate and opcode is 1000 00 the operation is based on reg1
opcode_imm_100000 = {'000': 'add', '001': 'or', '010': 'adc',
                     '011': 'sbb', '100': 'and', '101': 'sub', '110': 'xor', '111': 'cmp'}
# opcode is 1111 11,1 the operation is based on reg1
opcode_111111 = {'000': 'inc', '001': 'dec'}
# opcode is 1111 01,1
#!test here is imm
opcode_111101 = {'011': 'neg', '010': 'not', '000': 'test', '111': 'idiv'}
# there is additional 0f opcode
# * 1000 ttn is jcc
#! xadd is 1100 000w
opcode_0f = {'10111100': 'bsf', '10111101': 'bsr', '10101111': 'imul', '00000101': 'syscall',
             '10000000': 'jo', '10000001': 'jno', '10000010': 'jb', '10000011': 'jnb',
             '10000100': 'jz', '10000101': 'jnz', '10000110': 'jbe', '10000111': 'jnbe',
             '10001000': 'js', '10001001': 'jns', '10001010': 'jp', '10001011': 'jnp',
             '10001100': 'jl', '10001101': 'jnl', '10001110': 'jle', '10001111': 'jnle'}
# constant opcode
opcode_const = {'11111001': 'stc', '11111000': 'clc',
                '11111101': 'std', '11111100': 'cld',
                '11000010': 'ret'}
#!pop, push, inc, dec,mov has alternate encoding, always with register
# looks like push can only be 16bit and 64bit
opcode_alternate = {
    # '01000': 'inc', '01001': 'dec', #*looks like inc and dec are wrong since 4x is for Rex field
    '01011': 'pop', '01010': 'push'}
# * mov has w field we have to check it manually it is 1011 w reg : imm


def convertHxtoBin(hex):
    res = ''
    while(hex != ''):
        res += format(int(hex[0], 16), '04b')
        hex = hex[1:]
    return res

# common terminology used in all functions
# argi_type : 0 = old register , 1 = new register , 2 = memory , 3 = immediate
# arg_size : 0 = 8-bit , 1 = 16-bit , 2 = 32-bit , 3 = 64-bit


def convertImm(imm):
    res = ''
    while(imm != ''):
        res = hex(int(imm[0:8], 2))[2:] + res
        imm = imm[8:]
    return hex(int(res, 16))


def rexdissassmble(Rex):
    Rex = Rex[4:]
    rexw = False
    rexr = False
    rexb = False
    rexx = False
    if(Rex[0] == '1'):
        rexw = True
    if(Rex[1] == '1'):
        rexr = True
    if(Rex[2] == '1'):
        rexx = True
    if(Rex[3] == '1'):
        rexb = True
    return rexw, rexr, rexx, rexb


def convSS(ss):
    if(ss == '00'):
        return '1'
    elif(ss == '01'):
        return '2'
    elif(ss == '10'):
        return '4'
    elif(ss == '11'):
        return '8'


def convertDisp(disp):
    res = ''
    while(disp != ''):
        res = hex(int(disp[0:8], 2))[2:].zfill(2) + res
        disp = disp[8:]
    return hex(int(res, 16))


def convertReg(code, new, size):
    if(size == 0):
        if(new):
            return eightBit_codereg_new[code]
        else:
            return eightBit_codereg[code]
    elif(size == 1):
        if(new):
            return sixteenBit_codereg_new[code]
        else:
            return sixteenBit_codereg[code]
    elif(size == 2):
        if(new):
            return thirtytwoBit_codereg_new[code]
        else:
            return thirtytwoBit_codereg[code]
    elif(size == 3):
        if(new):
            return sixtyfourBit_codereg_new[code]
        else:
            return sixtyfourBit_codereg[code]


def convertOpsize(opsize):
    if(opsize == 0):
        return 'BYTE'
    elif(opsize == 1):
        return 'WORD'
    elif(opsize == 2):
        return 'DWORD'
    elif(opsize == 3):
        return 'QWORD'


def sibDisassemble(code, mod, opsize, addrsize, rexx, rexb):
    res = ''
    if(log):
        print(code)
    ss_code = code[0:2]
    inx_code = code[2:5]
    base_code = code[5:8]
    if(log):
        print('ss_code : ' + ss_code)
        print('inx_code : ' + inx_code)
        print('base_code : ' + base_code)
    remaining_code = ''
    if(mod == '01'):
        disp = convertDisp(code[8:16])
    elif(mod == '10'):
        disp = convertDisp(code[8:40])
    else:
        disp = ''
    if(mod == "00" and code[0:8] == '00100101'):
        # direct memory case
        disp = convertDisp(code[8:40])
        res = '['+disp+']'
    elif(inx_code == "100" and base_code == "100"):
        # this is rsp case
        # !remember rsp can't be index
        res = '['+'rsp'
        if(disp != ''):
            res += '+'+disp
    elif(base_code == '101'):
        # there are 2 cases
        # mod = 00 we have forced 32bit disp and it shows inx*ss+disp(forced)
        # mod = 01 or 10 shows we have rbp + inx*ss + disp
        # * actually there is third case that inx = 100 that we took care of in first if
        ss = convSS(ss_code)
        inx = convertReg(inx_code, rexx, addrsize)
        if(mod == '00'):
            disp = convertDisp(code[8:40])  # we have to calculate disp again
            res = '[' + inx + '*' + ss + '+' + disp + ']'
        else:
            base = convertReg('101', 0, addrsize)  # rbp
            res = '[' + base + '+' + inx + '*' + ss + '+' + disp + ']'
    else:
        ss = convSS(ss_code)
        inx = convertReg(inx_code, rexx, addrsize)
        base = convertReg(base_code, rexb, addrsize)
        res = '['+base+'+'+inx+'*'+ss
        if(disp != ''):
            res += '+'+disp+']'
        else:
            res += ']'

    res = convertOpsize(opsize) + ' ' + 'PTR'+' '+res
    remaining_code = code

    return res, remaining_code


def giveSize(rexw, w, prefix_66, prefix_67):
    if(w == False):
        opsize = 0
    elif(prefix_66 == True):
        opsize = 1
    elif(rexw == True):
        opsize = 3
    else:
        opsize = 2

    if(prefix_67 == True):
        addrsize = 2
    else:
        addrsize = 3

    return opsize, addrsize


def registerAddress(code, d, opsize, addrsize, rexr, rexx, rexb):
    res = ''
    mod = code[0:2]
    reg_code = code[2:5]
    rm = code[5:8]
    code = code[8:]  # !remaining code
    arg1 = ''
    arg2 = ''
    if(log):
        print('reg_code : '+reg_code, '\nmod : '+mod, '\nrm : '+rm)
    arg1 = convertReg(reg_code, rexr, opsize)

    remaining_code = ''
    if(rm == '100' and mod != '11'):
        if(log):
            print("SIB")
        # SIB usage
        arg2, remaining_code = sibDisassemble(
            code, mod, opsize, addrsize, rexx, rexb)
        if(d):
            res = arg1 + ','+arg2
        else:
            res = arg2 + ','+arg1
    else:
        if(mod == '11'):
            # simple register
            arg2 = convertReg(rm, rexb, opsize)
            remaining_code = code
        elif(mod == '00'):
            # no displacement
            arg2 = '['+convertReg(rm, rexb, addrsize)+']'
            arg2 = convertOpsize(opsize) + ' ' + 'PTR'+' '+arg2
            remaining_code = code
        elif(mod == '01'):
            disp = code[0:8]
            remaining_code = code[8:]
            arg2 = '['+convertReg(rm, rexb, addrsize)+'+'+convertDisp(disp)+']'
            arg2 = convertOpsize(opsize) + ' ' + 'PTR'+' '+arg2
        elif(mod == '10'):
            disp = code[0:32]
            remaining_code = code[32:]
            arg2 = '[' + convertReg(rm, rexb, addrsize) + \
                '+' + convertDisp(disp) + ']'
            arg2 = convertOpsize(opsize) + ' ' + 'PTR'+' '+arg2

        if(d):
            res = arg1 + ','+arg2
        else:
            res = arg2 + ','+arg1

    return res, remaining_code


def parser(code):
    prefix_66 = False
    prefix_67 = False
    rex = False
    rexw = False
    rexr = False
    rexb = False
    rexx = False
    w = False
    d = False
    opsize = 0
    addrsize = 0
    arg_opcode = ''  # second half of some opcode as register1
    arg1_type = 0
    arg2_type = 0
    res = ''
    if(code[0:8] == '01100111'):
        prefix_67 = True
        code = code[8:]
    if(code[0:8] == '01100110'):
        prefix_66 = True
        code = code[8:]

    if(code[0:4] == '0100'):
        rex = True
        rexw, rexr, rexx, rexb = rexdissassmble(code[0:8])
        code = code[8:]
    # here on there is only opcode and operands
    if(code[6] == '1'):
        d = True
    else:
        d = False

    if(code[7] == '1'):
        w = True
    else:
        w = False
    arg_opcode = code[10:13]
    opsize, addrsize = giveSize(rexw, w, prefix_66, prefix_67)
    if(log):
        print('prefix_66 : ', prefix_66, '\nprefix_67 : ', prefix_67, '\nrex : ',
              rex, '\nrexw : ', rexw, '\nrexr : ', rexr, '\nrexx : ', rexx, '\nrexb : ', rexb)
        print(code[0:6])

    #!The main Part !!!!!!!!!!!!!!!!!!!!!
    if(code in opcode_const.keys()):
        res = opcode_const[code]
    elif(code[0:4] == '1011'):
        # * mov alternate encoding 1011 w reg
        if(log):
            print('mov alternate encoding reg with imm')
        w = code[4]
        opsize, addrsize = giveSize(rexw, w, prefix_66, prefix_67)
        res = 'mov' + ' ' + convertReg(code[5:8], rexb, opsize) + ',' + \
            convertImm(code[8:])
    elif(code[0:5] == "10010"):
        # xhcg with acc
        if(log):
            print('xhcg with acc')
        res = 'xhcg' + ' ' + convertReg(code[5:8], rexb, opsize) + ',' + \
            convertReg("000", False, opsize)
    elif(code[0:7] == '1111011' and code[10:13] == '101'):
        # single operand imul case
        if(log):
            print('single operand imul')
        memoryaddr, imm = registerAddress(
            code[8:], d, opsize, addrsize, rexr, rexx, rexb)
        res = 'imul' + ' ' + memoryaddr.split(',')[1]
    elif(code[0:5] in opcode_alternate.keys()):
        if(log):
            print('alternate')
        operation = opcode_alternate[code[0:5]]
        if(prefix_66):
            opsize = 1
        else:
            opsize = 3
        res = operation + ' ' + convertReg(code[5:8], rexb, opsize)
    elif(code[0:7] in opcode_acc.keys()):
        if(log):
            print('acc')
        operation = opcode_acc[code[0:7]]

        res = operation + ' ' + \
            convertReg('000', rexb, opsize) + ',' + convertImm(code[8:])
    elif(code[0:8] == '00001111'):
        # 0f case
        if(log):
            print('0f case')
        code = code[8:]
        operation = ''
        if(code[0:8] in opcode_0f.keys()):
            operation = opcode_0f[code[0:8]]
        if(operation == 'bsf' or operation == 'bsr' or operation == 'imul'):
            # non jcc cases things are normal
            memoryaddr, imm = registerAddress(
                code[8:], d, opsize, addrsize, rexr, rexx, rexb)
            res = operation+' '+memoryaddr
        elif(code[0:7] == "1100000"):
            # xadd case
            if(log):
                print('xadd')
            memoryaddr, imm = registerAddress(
                code[8:], d, opsize, addrsize, rexr, rexx, rexb)
            res = 'xadd'+' '+memoryaddr
        elif(operation == 'syscall'):
            res = operation
        else:
            # jcc cases
            if(log):
                print('jcc case full displacement')
            # TODO : check if this is correct site is stupid
            res = operation+' '+convertDisp(code[8:])
    elif(code[0:6] == '100000'):
        # opcode_imm_100000
        if(log):
            print('imm_100000')
        operation = opcode_imm_100000[arg_opcode]
        memoryaddr, imm = registerAddress(
            code[8:], d, opsize, addrsize, rexr, rexx, rexb)
        # print(imm)
        res = operation + ' ' + memoryaddr.split(',')[1]+',' + convertImm(imm)
    elif(code[0:6] == '111111'):
        # opcode_111111 case
        if(log):
            print('opcode_111111 case')
        operation = opcode_111111[arg_opcode]
        d = True
        memoryaddr, imm = registerAddress(
            code[8:], d, opsize, addrsize, rexr, rexx, rexb)
        res = operation + ' ' + memoryaddr.split(',')[1]

        if(operation == 'test'):
            res += convertImm(imm)
    elif(code[0:6] == '111101'):
        # opcode_111101
        if(log):
            print('opcode_111101')
        operation = opcode_111101[arg_opcode]
        d = True
        memoryaddr, imm = registerAddress(
            code[8:], d, opsize, addrsize, rexr, rexx, rexb)
        res = operation + ' ' + memoryaddr.split(',')[1]
    elif(code[0:6] == "110100"):
        # shift case with one or cl
        if(arg_opcode == '100'):
            # shift left
            if(d == True):
                # shift left with cl
                if(log):
                    print('shift left case with cl')

                operation = "shl"
                d = True
                memoryaddr, imm = registerAddress(
                    code[8:], d, opsize, addrsize, rexr, rexx, rexb)
                print(memoryaddr)
                res = operation + ' ' + memoryaddr.split(',')[1]+','+'cl'
            else:
                # shift left with one
                if(log):
                    print('shift left case with one')
                operation = "shl"
                d = True
                memoryaddr, imm = registerAddress(
                    code[8:], d, opsize, addrsize, rexr, rexx, rexb)
                res = operation + ' ' + memoryaddr.split(',')[1] + ',1'
        elif(arg_opcode == '101'):
            # shift right
            if(d == True):
                # shift right with cl
                if(log):
                    print('shift right case with cl')
                operation = "shr"
                d = True
                memoryaddr, imm = registerAddress(
                    code[8:], d, opsize, addrsize, rexr, rexx, rexb)
                print(memoryaddr)
                res = operation + ' ' + memoryaddr.split(',')[1]+','+'cl'
            else:
                # shift right with one
                if(log):
                    print('shift right case with one')
                operation = "shr"
                d = True
                memoryaddr, imm = registerAddress(
                    code[8:], d, opsize, addrsize, rexr, rexx, rexb)
                res = operation + ' ' + memoryaddr.split(',')[1] + ',1'

    elif(code[0:6] == "110000"):
        # shift case with imm
        if(arg_opcode == '100'):
            # shift left with imm
            if(log):
                print('shift left case with imm')
            operation = "shl"
            d = True
            memoryaddr, imm = registerAddress(
                code[8:], d, opsize, addrsize, rexr, rexx, rexb)
            res = operation + ' ' + \
                memoryaddr.split(',')[1]+','+convertImm(imm)
        elif(arg_opcode == '101'):
            # shift right with imm
            if(log):
                print('shift right case with imm')
            operation = "shr"
            d = True
            memoryaddr, imm = registerAddress(
                code[8:], d, opsize, addrsize, rexr, rexx, rexb)
            res = operation + ' ' + \
                memoryaddr.split(',')[1]+','+convertImm(imm)
    else:
        if(log):
            print('default case')
        opcode = code[0:6]
        if(opcode in opcode_normal.keys()):
            memoryaddr, imm = registerAddress(
                code[8:], d, opsize, addrsize, rexr, rexx, rexb)
            res = opcode_normal[opcode] + ' ' + \
                memoryaddr
    return res


if __name__ == '__main__':
    inp = input()
    code = convertHxtoBin(inp)
    if(log):
        print(code)
    # res = convertDisp(code)
    res = parser(code)
    print(res)
