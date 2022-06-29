# -*- coding:utf-8 -*-
from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
STOP_RENDERING = runtime.STOP_RENDERING
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 10
_modified_time = 1655568573.467178
_enable_loop = True
_template_filename = '/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/linux/syscall.asm'
_template_uri = 'i386/linux/syscall.asm'
_source_encoding = 'utf-8'
_exports = []


__doc__ = u"\nArgs: [syscall_number, \\*args]\n    Does a syscall\n\nAny of the arguments can be expressions to be evaluated by :func:`pwnlib.constants.eval`.\n\nExample:\n\n        >>> print(pwnlib.shellcraft.i386.linux.syscall('SYS_execve', 1, 'esp', 2, 0).rstrip())\n            /* call execve(1, 'esp', 2, 0) */\n            push SYS_execve /* 0xb */\n            pop eax\n            push 1\n            pop ebx\n            mov ecx, esp\n            push 2\n            pop edx\n            xor esi, esi\n            int 0x80\n        >>> print(pwnlib.shellcraft.i386.linux.syscall('SYS_execve', 2, 1, 0, 20).rstrip())\n            /* call execve(2, 1, 0, 0x14) */\n            push SYS_execve /* 0xb */\n            pop eax\n            push 2\n            pop ebx\n            push 1\n            pop ecx\n            push 0x14\n            pop esi\n            cdq /* edx=0 */\n            int 0x80\n        >>> print(pwnlib.shellcraft.i386.linux.syscall().rstrip())\n            /* call syscall() */\n            int 0x80\n        >>> print(pwnlib.shellcraft.i386.linux.syscall('eax', 'ebx', 'ecx').rstrip())\n            /* call syscall('eax', 'ebx', 'ecx') */\n            /* setregs noop */\n            int 0x80\n        >>> print(pwnlib.shellcraft.i386.linux.syscall('ebp', None, None, 1).rstrip())\n            /* call syscall('ebp', ?, ?, 1) */\n            mov eax, ebp\n            push 1\n            pop edx\n            int 0x80\n        >>> print(pwnlib.shellcraft.i386.linux.syscall(\n        ...               'SYS_mmap2', 0, 0x1000,\n        ...               'PROT_READ | PROT_WRITE | PROT_EXEC',\n        ...               'MAP_PRIVATE | MAP_ANONYMOUS',\n        ...               -1, 0).rstrip())\n            /* call mmap2(0, 0x1000, 'PROT_READ | PROT_WRITE | PROT_EXEC', 'MAP_PRIVATE | MAP_ANONYMOUS', -1, 0) */\n            xor eax, eax\n            mov al, 0xc0\n            xor ebp, ebp\n            xor ebx, ebx\n            xor ecx, ecx\n            mov ch, 0x1000 >> 8\n            push -1\n            pop edi\n            push (PROT_READ | PROT_WRITE | PROT_EXEC) /* 7 */\n            pop edx\n            push (MAP_PRIVATE | MAP_ANONYMOUS) /* 0x22 */\n            pop esi\n            int 0x80\n        >>> print(pwnlib.shellcraft.open('/home/pwn/flag').rstrip())\n            /* open(file='/home/pwn/flag', oflag=0, mode=0) */\n            /* push b'/home/pwn/flag\\x00' */\n            push 0x1010101\n            xor dword ptr [esp], 0x1016660\n            push 0x6c662f6e\n            push 0x77702f65\n            push 0x6d6f682f\n            mov ebx, esp\n            xor ecx, ecx\n            xor edx, edx\n            /* call open() */\n            push SYS_open /* 5 */\n            pop eax\n            int 0x80\n"
def render_body(context,syscall=None,arg0=None,arg1=None,arg2=None,arg3=None,arg4=None,arg5=None,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(syscall=syscall,arg1=arg1,arg2=arg2,arg3=arg3,arg4=arg4,arg5=arg5,arg0=arg0,pageargs=pageargs)
        isinstance = context.get('isinstance', UNDEFINED)
        dict = context.get('dict', UNDEFINED)
        str = context.get('str', UNDEFINED)
        zip = context.get('zip', UNDEFINED)
        any = context.get('any', UNDEFINED)
        __M_writer = context.writer()

        from pwnlib.shellcraft import i386, pretty
        from pwnlib.constants import Constant
        from pwnlib.abi import linux_i386_syscall as abi
        from six import text_type
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['abi','i386','Constant','pretty','text_type'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'\n')
        __M_writer(u'\n')
        __M_writer(u'\n')

        if isinstance(syscall, (str, text_type, Constant)) and str(syscall).startswith('SYS_'):
            syscall_repr = str(syscall)[4:] + "(%s)"
            args = []
        else:
            syscall_repr = 'syscall(%s)'
            if syscall is None:
                args = ['?']
            else:
                args = [pretty(syscall, False)]
        
        for arg in [arg0, arg1, arg2, arg3, arg4, arg5]:
            if arg is None:
                args.append('?')
            else:
                args.append(pretty(arg, False))
        while args and args[-1] == '?':
            args.pop()
        syscall_repr = syscall_repr % ', '.join(args)
        
        registers = abi.register_arguments
        arguments = [syscall, arg0, arg1, arg2, arg3, arg4, arg5]
        regctx    = dict(zip(registers, arguments))
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['regctx','args','registers','arguments','arg','syscall_repr'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'    /* call ')
        __M_writer(unicode(syscall_repr))
        __M_writer(u' */\n')
        if any(a is not None for a in arguments):
            __M_writer(u'    ')
            __M_writer(unicode(i386.setregs(regctx)))
            __M_writer(u'\n')
        __M_writer(u'    int 0x80\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


"""
__M_BEGIN_METADATA
{"source_encoding": "utf-8", "line_map": {"16": 8, "17": 7, "27": 1, "28": 2, "29": 3, "30": 4, "31": 5, "32": 6, "33": 7, "36": 6, "37": 7, "38": 86, "39": 87, "40": 88, "41": 89, "42": 90, "43": 91, "44": 92, "45": 93, "46": 94, "47": 95, "48": 96, "49": 97, "50": 98, "51": 99, "52": 100, "53": 101, "54": 102, "55": 103, "56": 104, "57": 105, "58": 106, "59": 107, "60": 108, "61": 109, "62": 110, "63": 111, "66": 111, "67": 111, "68": 111, "69": 112, "70": 113, "71": 113, "72": 113, "73": 115, "79": 73}, "uri": "i386/linux/syscall.asm", "filename": "/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/linux/syscall.asm"}
__M_END_METADATA
"""
