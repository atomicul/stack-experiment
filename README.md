# Stack Experiment

This experiment highlights how overriding the default stack provided by the OS
with some generic dynamically allocated memory is a very simple thing to do, and
programs can run just fine.

On Unix and Linux systems, it is enough to call `mmap` to request some memory,
then update the stack pointer. Compiled C code still works. The relocated stack
example also allocates much more memory than an OS would usually allow the stack
to grow by default, thus taking longer to segfault due to the infinite recursion.
