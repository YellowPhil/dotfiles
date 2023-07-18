#SPRUSH gef
#source /home/synerr/.gef-sprush/.gdbinit-gef.py

#gef
#source /home/synerr/.gdbinit-gef.py

#gef-dev 
#source /home/synerr/.gef.py

# pwndbg
source /home/synerr/Scripts/pwndbg/gdbinit.py


#source /usr/share/pwngdb/angelheap/gdbinit.py
#source /home/synerr/Scripts/splitmind/gdbinit.py

#source ~/.vmlinux-gdb.py

#define hook-run
#python
##import angelheap
##import splitmind
##
##
##(splitmind.Mind()
##  .tell_splitter(show_titles=True)
##  .tell_splitter(set_title="Main")
##  .right(display="backtrace", size="25%")
##  .above(of="main", display="disasm", size="80%", banner="top")
##  .show("code", on="disasm", banner="none")
##  .right(cmd='tty; tail -f /dev/null', size="65%", clearing=False)
##  .tell_splitter(set_title='Input / Output')
##  .above(display="stack", size="75%")
##  .above(display="legend", size="25")
##  .show("regs", on="legend")
##  .below(of="backtrace", cmd="ipython", size="30%")
##).build(nobanner=True)
##
##
#
##angelheap.init_angelheap()
#end
#
set output-radix 16

# uncomment in pwndbg
set resolve-heap-via-heuristic on

set follow-fork-mode child
set print asm-demangle on
set print demangle on
#set debuginfod enabled on
#set debug-file-directory ./debug/
#set prompt-color normal,blue
##set context-sections	'regs disasm code stack backtrace expressions'
#
