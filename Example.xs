#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <stdio.h>

void print_hello (void) {
    printf("hello world");
}

int treble(int x) {
    x*=3;
    return x;
}

AV* return_1_bar () {
  AV* ret = newAV();

  av_push(ret, newSViv(1));
  av_push(ret, newSVpvf("%s", "bar"));

  /* return [ 1, "bar" ] */
  return ret;
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


AV *
return_1_bar()
