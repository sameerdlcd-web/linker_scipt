ENTRY(_reset)

MEMORY{
flash: ORIGIN= <flash start address>,LENGTH=<flash length>;
sram:  ORIGIN= <sram start address>,LENGTH=<sram length>;
}

SECTIONS{
 .vectors:
{
   KEEP(*(.vectors))
 }>flash

.text:
{
*(.text *)
}>flash

.data:
{
.=ALIGN(4)
_sdata=.;
*(.data *)
_edata=.;
}>sram AT >flash

_sidata=LOADADDR(.data);

.rodata:
{
*(.rodata *)
} >flash

.bss:
{
.=ALIGN(4)
_sbss=.;
*(.bss *)
_ebss=.;
}>sram
.=ALIGN(8)
_end=.;

}
