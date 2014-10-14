#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <stdio.h>
#include <stdbool.h>

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

/* 
 * this example is from http://stackoverflow.com/questions/18291827/
 */
double get_third_element_from_arrayref( SV *abc )
{
    AV *array;     /* this will hold our actual array */
    SV **value;    /* this will hold the value we extract, note that it is a double pointer */
    double num;    /* the actual underlying number in the SV */

    if ( !SvROK( abc ) ) croak( "param is not a reference" );
    if ( SvTYPE( SvRV( abc ) ) != SVt_PVAV ) croak( "param is not an array reference" );

    /* if we got this far, then we have an array ref */
    /* now dereference it to get the AV */
    array = (AV *)SvRV( abc );

    /* look up the 3rd element, which is yet another SV */
    value = av_fetch( array, 2, 0 );

    if ( value == NULL ) croak( "Failed array lookup" );
    //if ( !SvNOK( *value ) ) croak( "Array element is not a number" );

    /* extract the actual number from the SV */
    num = SvNV( *value );
    return num;
}

bool aref( SV *x )
{
    return  SvROK(x) && ( SvTYPE( SvRV(x) ) == SVt_PVAV );
}

bool href( SV *x )
{
    return  SvROK(x) && ( SvTYPE( SvRV(x) ) == SVt_PVHV );
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

double
get_third_element_from_arrayref(x)
    SV *x

bool
aref(x)
    SV *x

bool
href(x)
    SV *x
