#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <stdio.h>

#include <chromaprint.h>

void print_hello (void) {
    printf("hello world");
}

int treble(int x) {
    x*=3;
    return x;
}

MODULE = Example		PACKAGE = Example		

void
print_hello()

int 
treble(x)
    int x       

int
add_numbers(int a, int b)
    CODE:
        RETVAL = a + b;
    OUTPUT:
        RETVAL

int treble_then_add(int a, int b)
    CODE:
        RETVAL = treble(a) + treble(b);
    OUTPUT:
        RETVAL



SV *
add_numbers_perl(SV *a, SV *b)
    CODE:
    {
	  const double sum = SvNV(a) + SvNV(b);
	  RETVAL = newSVnv(sum);
    }
    
    OUTPUT: RETVAL

const char *
get_version()
    CODE:
        RETVAL = chromaprint_get_version();
    OUTPUT: RETVAL

