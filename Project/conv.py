def f(s):
    if(':' in s):
        s = ''.join(s.split())
        name,s = s.split('=')
        s = s[1:]
        s= s[:-1]
        a = s.split(',')
        b=''
        c=''
        for k in a:
            q,w = k.split(':')
            b+=q
            c+=w         
            b+=',0,'
            c+=',0,'
        b+='\'$\''
        c += '\'$\''
        res = ''
        res += '    '+name+'K'+' db '+b+'\n'
        res += '    '+name+'V'+' db '+c+'\n'
    else:
        s = ''.join(s.split())
        name,s = s.split('=')
        s = s[1:]
        s= s[:-1]
        a = s.split(',')
        b=''
        for k in a:
            b+=k
            # c+=w         
            b+=',0,'
            
        b+='\'$\''
        
        res ='    '+name+' db '+b+'\n'
    return res

text = ''
while True: # change this condition.
    inp = input()
    if(inp==''):break
    text += inp+'\n'
print(f(text))
