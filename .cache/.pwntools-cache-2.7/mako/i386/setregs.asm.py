# -*- coding:utf-8 -*-
from mako import runtime, filters, cache
UNDEFINED = runtime.UNDEFINED
STOP_RENDERING = runtime.STOP_RENDERING
__M_dict_builtin = dict
__M_locals_builtin = locals
_magic_number = 10
_modified_time = 1655568573.461406
_enable_loop = True
_template_filename = '/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/setregs.asm'
_template_uri = 'i386/setregs.asm'
_source_encoding = 'utf-8'
_exports = []


__doc__ = u"\nSets multiple registers, taking any register dependencies into account\n(i.e., given eax=1,ebx=eax, set ebx first).\n\nArgs:\n    reg_context (dict): Desired register context\n    stack_allowed (bool): Can the stack be used?\n\nExample:\n\n    >>> print(shellcraft.setregs({'eax':1, 'ebx':'eax'}).rstrip())\n        mov ebx, eax\n        push 1\n        pop eax\n    >>> print(shellcraft.setregs({'eax':'ebx', 'ebx':'eax', 'ecx':'ebx'}).rstrip())\n        mov ecx, ebx\n        xchg eax, ebx\n\n\n"
def render_body(context,reg_context,stack_allowed=True,**pageargs):
    __M_caller = context.caller_stack._push_frame()
    try:
        __M_locals = __M_dict_builtin(reg_context=reg_context,pageargs=pageargs,stack_allowed=stack_allowed)
        NameError = context.get('NameError', UNDEFINED)
        isinstance = context.get('isinstance', UNDEFINED)
        str = context.get('str', UNDEFINED)
        __M_writer = context.writer()

        import six
        from pwnlib.regsort import regsort
        from pwnlib.constants import Constant, eval
        from pwnlib.shellcraft import registers
        from pwnlib.shellcraft.i386 import mov
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['Constant','six','mov','registers','eval','regsort'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'\n')
        __M_writer(u'\n')
        __M_writer(u'\n')

        reg_context = {k:v for k,v in reg_context.items() if v is not None}
        
        eax = reg_context.get('eax', None)
        edx = reg_context.get('edx', None)
        cdq = False
        
        if isinstance(eax, str):
            try:
                eax = eval(eax)
            except NameError:
                pass
        
        if isinstance(edx, str):
            try:
                edx = eval(edx)
            except NameError:
                pass
        
        if isinstance(eax, six.integer_types) and isinstance(edx, six.integer_types) and eax >> 31 == edx:
            cdq = True
            reg_context.pop('edx')
        
        sorted_regs = regsort(reg_context, registers.i386)
        
        
        __M_locals_builtin_stored = __M_locals_builtin()
        __M_locals.update(__M_dict_builtin([(__M_key, __M_locals_builtin_stored[__M_key]) for __M_key in ['reg_context','k','eax','cdq','v','edx','sorted_regs'] if __M_key in __M_locals_builtin_stored]))
        __M_writer(u'\n')
        if not sorted_regs:
            __M_writer(u'  /* setregs noop */\n')
        else:
            for how, src, dst in regsort(reg_context, registers.i386):
                if how == 'xchg':
                    __M_writer(u'    xchg ')
                    __M_writer(unicode(src))
                    __M_writer(u', ')
                    __M_writer(unicode(dst))
                    __M_writer(u'\n')
                else:
                    __M_writer(u'    ')
                    __M_writer(unicode(mov(src, dst)))
                    __M_writer(u'\n')
            if cdq:
                __M_writer(u'    cdq /* edx=0 */\n')
        return ''
    finally:
        context.caller_stack._pop_frame()


"""
__M_BEGIN_METADATA
{"source_encoding": "utf-8", "line_map": {"16": 9, "17": 8, "25": 1, "26": 2, "27": 3, "28": 4, "29": 5, "30": 6, "31": 7, "32": 8, "35": 7, "36": 8, "37": 28, "38": 29, "39": 30, "40": 31, "41": 32, "42": 33, "43": 34, "44": 35, "45": 36, "46": 37, "47": 38, "48": 39, "49": 40, "50": 41, "51": 42, "52": 43, "53": 44, "54": 45, "55": 46, "56": 47, "57": 48, "58": 49, "59": 50, "60": 51, "61": 52, "62": 53, "63": 54, "66": 53, "67": 54, "68": 55, "69": 56, "70": 57, "71": 58, "72": 59, "73": 59, "74": 59, "75": 59, "76": 59, "77": 60, "78": 61, "79": 61, "80": 61, "81": 64, "82": 65, "88": 82}, "uri": "i386/setregs.asm", "filename": "/home/synerr/.local/lib/python2.7/site-packages/pwnlib/shellcraft/templates/i386/setregs.asm"}
__M_END_METADATA
"""
