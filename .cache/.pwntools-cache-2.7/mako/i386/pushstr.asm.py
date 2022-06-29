# -*- coding:utf-8 -*-
from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
STOP_RENDERING = runtime.STOP_RENDERING
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 10
_modified_time = 1655568573.437297
_enable_loop = True
_template_filename = '/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/pushstr.asm'
_template_uri = 'i386/pushstr.asm'
_source_encoding = 'utf-8'
_exports = []


__doc__ = u'\nPushes a string onto the stack without using\nnull bytes or newline characters.\n\nExample:\n\n    >>> print(shellcraft.i386.pushstr(\'\').rstrip())\n        /* push \'\\x00\' */\n        push 1\n        dec byte ptr [esp]\n    >>> print(shellcraft.i386.pushstr(\'a\').rstrip())\n        /* push \'a\\x00\' */\n        push 0x61\n    >>> print(shellcraft.i386.pushstr(\'aa\').rstrip())\n        /* push \'aa\\x00\' */\n        push 0x1010101\n        xor dword ptr [esp], 0x1016060\n    >>> print(shellcraft.i386.pushstr(\'aaa\').rstrip())\n        /* push \'aaa\\x00\' */\n        push 0x1010101\n        xor dword ptr [esp], 0x1606060\n    >>> print(shellcraft.i386.pushstr(\'aaaa\').rstrip())\n        /* push \'aaaa\\x00\' */\n        push 1\n        dec byte ptr [esp]\n        push 0x61616161\n    >>> print(shellcraft.i386.pushstr(\'aaaaa\').rstrip())\n        /* push \'aaaaa\\x00\' */\n        push 0x61\n        push 0x61616161\n    >>> print(shellcraft.i386.pushstr(\'aaaa\', append_null = False).rstrip())\n        /* push \'aaaa\' */\n        push 0x61616161\n    >>> print(shellcraft.i386.pushstr(b\'\\xc3\').rstrip())\n        /* push b\'\\xc3\\x00\' */\n        push 0x1010101\n        xor dword ptr [esp], 0x10101c2\n    >>> print(shellcraft.i386.pushstr(b\'\\xc3\', append_null = False).rstrip())\n        /* push b\'\\xc3\' */\n        push -0x3d\n    >>> with context.local():\n    ...    context.arch = \'i386\'\n    ...    print(enhex(asm(shellcraft.pushstr("/bin/sh"))))\n    68010101018134242e726901682f62696e\n    >>> with context.local():\n    ...    context.arch = \'i386\'\n    ...    print(enhex(asm(shellcraft.pushstr(""))))\n    6a01fe0c24\n    >>> with context.local():\n    ...    context.arch = \'i386\'\n    ...    print(enhex(asm(shellcraft.pushstr("\\x00", False))))\n    6a01fe0c24\n\nArgs:\n  string (str): The string to push.\n  append_null (bool): Whether to append a single NULL-byte before pushing.\n'
def render_body(context,string,append_null=True,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(pageargs=pageargs,string=string,append_null=append_null)
        isinstance = context.get('isinstance', UNDEFINED)
        __M_writer = context.writer()

        from pwnlib.util import lists, packing, fiddling
        from pwnlib.shellcraft import pretty, okay
        import six
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['okay','six','lists','packing','fiddling','pretty'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'\n')
        __M_writer(u'\n')
        __M_writer(u'\n')

        original = string
        if isinstance(string, six.text_type):
            string = packing._need_bytes(string, 2, 0x80)
        else:
            string = packing.flat(string)
        
        if append_null:
            string += b'\x00'
            if isinstance(original, six.binary_type):
                original += b'\x00'
            elif isinstance(original, six.text_type):
                original += '\x00'
        
        if not string:
            return
        
        if six.indexbytes(string, -1) >= 128:
            extend = b'\xff'
        else:
            extend = b'\x00'
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['original','extend','string'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'    /* push ')
        __M_writer(unicode(pretty(original, False)))
        __M_writer(u' */\n')
        for word in lists.group(4, string, 'fill', extend)[::-1]:

            sign = packing.u32(word, endian='little', sign='signed')
            
            
            __M_locals_builtin_stored = __M_locals_builtin()
            __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['sign'] if __M_key in __M_locals_builtin_stored]))
            if sign in [0, 0xa]:
                __M_writer(u'    push ')
                __M_writer(unicode(pretty(sign + 1)))
                __M_writer(u'\n    dec byte ptr [esp]\n')
            elif -0x80 <= sign <= 0x7f and okay(word[:1]):
                __M_writer(u'    push ')
                __M_writer(unicode(pretty(sign)))
                __M_writer(u'\n')
            elif okay(word):
                __M_writer(u'    push ')
                __M_writer(unicode(pretty(sign)))
                __M_writer(u'\n')
            else:

                a,b = fiddling.xor_pair(word, avoid = b'\x00\n')
                a   = packing.u32(a, endian='little', sign='unsigned')
                b   = packing.u32(b, endian='little', sign='unsigned')
                
                
                __M_locals_builtin_stored = __M_locals_builtin()
                __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['a','b'] if __M_key in __M_locals_builtin_stored]))
                __M_writer(u'    push ')
                __M_writer(unicode(pretty(a)))
                __M_writer(u'\n    xor dword ptr [esp], ')
                __M_writer(unicode(pretty(b)))
                __M_writer(u'\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


"""
__M_BEGIN_METADATA
{"source_encoding": "utf-8", "line_map": {"16": 7, "17": 6, "23": 1, "24": 2, "25": 3, "26": 4, "27": 5, "28": 6, "31": 5, "32": 6, "33": 63, "34": 64, "35": 65, "36": 66, "37": 67, "38": 68, "39": 69, "40": 70, "41": 71, "42": 72, "43": 73, "44": 74, "45": 75, "46": 76, "47": 77, "48": 78, "49": 79, "50": 80, "51": 81, "52": 82, "53": 83, "54": 84, "55": 85, "56": 86, "59": 86, "60": 86, "61": 86, "62": 87, "63": 88, "64": 89, "65": 90, "66": 91, "69": 91, "70": 92, "71": 92, "72": 92, "73": 94, "74": 95, "75": 95, "76": 95, "77": 96, "78": 97, "79": 97, "80": 97, "81": 98, "82": 99, "83": 100, "84": 101, "85": 102, "86": 103, "87": 104, "90": 104, "91": 104, "92": 104, "93": 105, "94": 105, "100": 94}, "uri": "i386/pushstr.asm", "filename": "/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/pushstr.asm"}
__M_END_METADATA
"""
