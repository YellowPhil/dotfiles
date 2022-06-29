# -*- coding:utf-8 -*-
from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
STOP_RENDERING = runtime.STOP_RENDERING
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 10
_modified_time = 1655568573.452122
_enable_loop = True
_template_filename = '/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/mov.asm'
_template_uri = 'i386/mov.asm'
_source_encoding = 'utf-8'
_exports = []


__doc__ = u"\nMove src into dest without newlines and null bytes.\n\nIf the src is a register smaller than the dest, then it will be\nzero-extended to fit inside the larger register.\n\nIf the src is a register larger than the dest, then only some of the bits will\nbe used.\n\nIf src is a string that is not a register, then it will locally set\n`context.arch` to `'i386'` and use :func:`pwnlib.constants.eval` to evaluate the\nstring. Note that this means that this shellcode can change behavior depending\non the value of `context.os`.\n\nArgs:\n  dest (str): The destination register.\n  src (str): Either the input register, or an immediate value.\n  stack_allowed (bool): Can the stack be used?\n\nExample:\n\n    >>> print(shellcraft.i386.mov('eax','ebx').rstrip())\n        mov eax, ebx\n    >>> print(shellcraft.i386.mov('eax', 0).rstrip())\n        xor eax, eax\n    >>> print(shellcraft.i386.mov('ax', 0).rstrip())\n        xor ax, ax\n    >>> print(shellcraft.i386.mov('ax', 17).rstrip())\n        xor ax, ax\n        mov al, 0x11\n    >>> print(shellcraft.i386.mov('edi', ord('\\n')).rstrip())\n        push 9 /* mov edi, '\\n' */\n        pop edi\n        inc edi\n    >>> print(shellcraft.i386.mov('al', 'ax').rstrip())\n        /* moving ax into al, but this is a no-op */\n    >>> print(shellcraft.i386.mov('al','ax').rstrip())\n        /* moving ax into al, but this is a no-op */\n    >>> print(shellcraft.i386.mov('esp', 'esp').rstrip())\n        /* moving esp into esp, but this is a no-op */\n    >>> print(shellcraft.i386.mov('ax', 'bl').rstrip())\n        movzx ax, bl\n    >>> print(shellcraft.i386.mov('eax', 1).rstrip())\n        push 1\n        pop eax\n    >>> print(shellcraft.i386.mov('eax', 1, stack_allowed=False).rstrip())\n        xor eax, eax\n        mov al, 1\n    >>> print(shellcraft.i386.mov('eax', 0xdead00ff).rstrip())\n        mov eax, -0xdead00ff\n        neg eax\n    >>> print(shellcraft.i386.mov('eax', 0xc0).rstrip())\n        xor eax, eax\n        mov al, 0xc0\n    >>> print(shellcraft.i386.mov('edi', 0xc0).rstrip())\n        mov edi, -0xc0\n        neg edi\n    >>> print(shellcraft.i386.mov('eax', 0xc000).rstrip())\n        xor eax, eax\n        mov ah, 0xc000 >> 8\n    >>> print(shellcraft.i386.mov('eax', 0xffc000).rstrip())\n        mov eax, 0x1010101\n        xor eax, 0x1010101 ^ 0xffc000\n    >>> print(shellcraft.i386.mov('edi', 0xc000).rstrip())\n        mov edi, (-1) ^ 0xc000\n        not edi\n    >>> print(shellcraft.i386.mov('edi', 0xf500).rstrip())\n        mov edi, 0x1010101\n        xor edi, 0x1010101 ^ 0xf500\n    >>> print(shellcraft.i386.mov('eax', 0xc0c0).rstrip())\n        xor eax, eax\n        mov ax, 0xc0c0\n    >>> print(shellcraft.i386.mov('eax', 'SYS_execve').rstrip())\n        push SYS_execve /* 0xb */\n        pop eax\n    >>> with context.local(os='freebsd'):\n    ...     print(shellcraft.i386.mov('eax', 'SYS_execve').rstrip())\n        push SYS_execve /* 0x3b */\n        pop eax\n    >>> print(shellcraft.i386.mov('eax', 'PROT_READ | PROT_WRITE | PROT_EXEC').rstrip())\n        push (PROT_READ | PROT_WRITE | PROT_EXEC) /* 7 */\n        pop eax\n"
def render_body(context,dest,src,stack_allowed=True,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(dest=dest,src=src,pageargs=pageargs,stack_allowed=stack_allowed)
        isinstance = context.get('isinstance', UNDEFINED)
        hex = context.get('hex', UNDEFINED)
        str = context.get('str', UNDEFINED)
        tuple = context.get('tuple', UNDEFINED)
        __M_writer = context.writer()

        from pwnlib.shellcraft import eval, pretty, okay
        from pwnlib.util import lists, packing, fiddling, misc
        from pwnlib.log import getLogger
        from pwnlib.shellcraft.registers import get_register, is_register, bits_required
        import six
        log = getLogger('pwnlib.shellcraft.i386.mov')
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['okay','eval','six','misc','bits_required','lists','get_register','getLogger','packing','fiddling','pretty','is_register','log'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'\n')
        __M_writer(u'\n')
        __M_writer(u'\n')

        src_name = src
        if not isinstance(src, (str, tuple)):
            src_name = pretty(src)
        
        if not get_register(dest):
            log.error('%r is not a register' % dest)
        
        dest = get_register(dest)
        
        if dest.size > 32 or dest.is64bit:
            log.error("cannot use %s on i386" % dest)
        
        if get_register(src):
            src = get_register(src)
        
            if src.is64bit:
                log.error("cannot use %s on i386" % src)
        
            if dest.size < src.size and src.name not in dest.bigger:
                log.error("cannot mov %s, %s: dddest is smaller than src" % (dest, src))
        else:
            src = eval(src)
        
            if not dest.fits(src):
                log.error("cannot mov %s, %r: dest is smaller than src" % (dest, src))
        
            src_size = bits_required(src)
        
            # Calculate the packed version
            mask = ((1<<32)-1)
            masked = src & mask
            srcp = packing.pack(masked, dest.size)
        
            # Calculate the unsigned and signed versions
            srcu = packing.unpack(srcp, dest.size, sign=False)
            srcs = packing.unpack(srcp, dest.size, sign=True)
        
            srcp_not = packing.pack(fiddling.bnot(masked))
            srcp_neg = packing.pack(fiddling.negate(masked))
            srcu_not = packing.unpack(srcp_not)
            srcu_neg = packing.unpack(srcp_neg)
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['src','srcp_neg','src_size','dest','mask','srcu_not','srcp_not','srcs','srcp','masked','srcu','src_name','srcu_neg'] if __M_key in __M_locals_builtin_stored]))
        if is_register(src):
            if src == dest:
                __M_writer(u'    /* moving ')
                __M_writer(unicode(src))
                __M_writer(u' into ')
                __M_writer(unicode(dest))
                __M_writer(u', but this is a no-op */\n')
            elif src.name in dest.bigger:
                __M_writer(u'    /* moving ')
                __M_writer(unicode(src))
                __M_writer(u' into ')
                __M_writer(unicode(dest))
                __M_writer(u', but this is a no-op */\n')
            elif dest.size > src.size:
                __M_writer(u'    movzx ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(src))
                __M_writer(u'\n')
            else:
                __M_writer(u'    mov ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(src))
                __M_writer(u'\n')
        elif isinstance(src, six.integer_types):
            if src == 0:
                __M_writer(u'        xor ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(dest))
                __M_writer(u'\n')
            elif stack_allowed and dest.size == 32 and src == 10:
                __M_writer(u'        push 9 /* mov ')
                __M_writer(unicode(dest))
                __M_writer(u", '\\n' */\n        pop ")
                __M_writer(unicode(dest))
                __M_writer(u'\n        inc ')
                __M_writer(unicode(dest))
                __M_writer(u'\n')
            elif stack_allowed and dest.size == 32 and okay(srcp):
                __M_writer(u'        push ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n        pop ')
                __M_writer(unicode(dest))
                __M_writer(u'\n')
            elif stack_allowed and dest.size == 32 and  -127 <= srcs < 128 and okay(srcp[:1]):
                __M_writer(u'        push ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n        pop ')
                __M_writer(unicode(dest))
                __M_writer(u'\n')
            elif okay(srcp):
                __M_writer(u'        mov ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n')
            elif 0 <= srcu < 2**8 and okay(srcp[:1]) and dest.sizes.get(8, 0):
                __M_writer(u'        xor ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(dest))
                __M_writer(u'\n        mov ')
                __M_writer(unicode(dest.sizes[8]))
                __M_writer(u', ')
                __M_writer(unicode(pretty(srcu)))
                __M_writer(u'\n')
            elif srcu == (srcu & 0xff00) and okay(srcp[1:2]) and dest.ff00:
                __M_writer(u'        xor ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(dest))
                __M_writer(u'\n        mov ')
                __M_writer(unicode(dest.ff00))
                __M_writer(u', ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u' >> 8\n')
            elif 0 <= srcu < 2**16 and okay(srcp[:2]) and dest.sizes[16]:
                __M_writer(u'        xor ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(dest))
                __M_writer(u'\n        mov ')
                __M_writer(unicode(dest.sizes[16]))
                __M_writer(u', ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n')
            elif okay(srcp_neg):
                __M_writer(u'        mov ')
                __M_writer(unicode(dest))
                __M_writer(u', -')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n        neg ')
                __M_writer(unicode(dest))
                __M_writer(u'\n')
            elif okay(srcp_not):
                __M_writer(u'        mov ')
                __M_writer(unicode(dest))
                __M_writer(u', (-1) ^ ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n        not ')
                __M_writer(unicode(dest))
                __M_writer(u'\n')
            else:
                __M_writer(u'        ')

                a,b = fiddling.xor_pair(srcp, avoid = '\x00\n')
                a = hex(packing.unpack(a, dest.size))
                b = hex(packing.unpack(b, dest.size))
                
                
                __M_locals_builtin_stored = __M_locals_builtin()
                __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['a','b'] if __M_key in __M_locals_builtin_stored]))
                __M_writer(u'        mov ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(a))
                __M_writer(u'\n        xor ')
                __M_writer(unicode(dest))
                __M_writer(u', ')
                __M_writer(unicode(a))
                __M_writer(u' ^ ')
                __M_writer(unicode(pretty(src)))
                __M_writer(u'\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


"""
__M_BEGIN_METADATA
{"source_encoding": "utf-8", "line_map": {"16": 10, "17": 9, "26": 1, "27": 2, "28": 3, "29": 4, "30": 5, "31": 6, "32": 7, "33": 8, "34": 9, "37": 8, "38": 9, "39": 92, "40": 93, "41": 94, "42": 95, "43": 96, "44": 97, "45": 98, "46": 99, "47": 100, "48": 101, "49": 102, "50": 103, "51": 104, "52": 105, "53": 106, "54": 107, "55": 108, "56": 109, "57": 110, "58": 111, "59": 112, "60": 113, "61": 114, "62": 115, "63": 116, "64": 117, "65": 118, "66": 119, "67": 120, "68": 121, "69": 122, "70": 123, "71": 124, "72": 125, "73": 126, "74": 127, "75": 128, "76": 129, "77": 130, "78": 131, "79": 132, "80": 133, "81": 134, "82": 135, "83": 136, "86": 136, "87": 137, "88": 138, "89": 138, "90": 138, "91": 138, "92": 138, "93": 139, "94": 140, "95": 140, "96": 140, "97": 140, "98": 140, "99": 141, "100": 142, "101": 142, "102": 142, "103": 142, "104": 142, "105": 143, "106": 144, "107": 144, "108": 144, "109": 144, "110": 144, "111": 146, "112": 148, "113": 149, "114": 149, "115": 149, "116": 149, "117": 149, "118": 151, "119": 152, "120": 152, "121": 152, "122": 153, "123": 153, "124": 154, "125": 154, "126": 158, "127": 159, "128": 159, "129": 159, "130": 160, "131": 160, "132": 161, "133": 162, "134": 162, "135": 162, "136": 163, "137": 163, "138": 165, "139": 166, "140": 166, "141": 166, "142": 166, "143": 166, "144": 168, "145": 169, "146": 169, "147": 169, "148": 169, "149": 169, "150": 170, "151": 170, "152": 170, "153": 170, "154": 174, "155": 175, "156": 175, "157": 175, "158": 175, "159": 175, "160": 176, "161": 176, "162": 176, "163": 176, "164": 178, "165": 179, "166": 179, "167": 179, "168": 179, "169": 179, "170": 180, "171": 180, "172": 180, "173": 180, "174": 182, "175": 183, "176": 183, "177": 183, "178": 183, "179": 183, "180": 184, "181": 184, "182": 185, "183": 186, "184": 186, "185": 186, "186": 186, "187": 186, "188": 187, "189": 187, "190": 190, "191": 191, "192": 191, "193": 192, "194": 193, "195": 194, "196": 195, "197": 196, "200": 196, "201": 196, "202": 196, "203": 196, "204": 196, "205": 197, "206": 197, "207": 197, "208": 197, "209": 197, "210": 197, "216": 210}, "uri": "i386/mov.asm", "filename": "/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/mov.asm"}
__M_END_METADATA
"""
