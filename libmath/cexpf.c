/* Return value of complex exponential function for float complex value. */
/* Copyright (C) 1997-1999 Free Software Foundation, Inc.

   This file is part of the GNU ISO C++ Library.  This library is free
   software; you can redistribute it and/or modify it under the
   terms of the GNU General Public License as published by the
   Free Software Foundation; either version 2, or (at your option)
   any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License along
   with this library; see the file COPYING.  If not, write to the Free
   Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
   USA.

   As a special exception, you may use this file as part of a free software
   library without restriction.  Specifically, if other files instantiate
   templates or use macros or inline functions from this file, or you compile
   this file and link it with other files to produce an executable, this
   file does not by itself cause the resulting executable to be covered by
   the GNU General Public License.  This exception does not however
   invalidate any other reasons why the executable file might be covered by
   the GNU General Public License.  */


#include <math.h>
#include "mathconf.h"


__complex__ float
cexpf (__complex__ float x)
{
  __complex__ float retval;

  if (FINITEF_P (__real__ x))
    {
      /* Real part is finite.  */
      if (FINITEF_P (__imag__ x))
	{
	  /* Imaginary part is finite.  */
	  float exp_val = expf (__real__ x);
	  float sinix = sinf (__imag__ x);
	  float cosix = cosf (__imag__ x);

	  if (FINITEF_P (exp_val))
	    {
	      __real__ retval = exp_val * cosix;
	      __imag__ retval = exp_val * sinix;
	    }
	  else
	    {
	      __real__ retval = copysignf (exp_val, cosix);
	      __imag__ retval = copysignf (exp_val, sinix);
	    }
	}
      else
	{
	  /* If the imaginary part is +-inf or NaN and the real part
	     is not +-inf the result is NaN + iNaN.  */
	  __real__ retval = NAN;
	  __imag__ retval = NAN;
	}
    }
  else if (INFINITEF_P (__real__ x))
    {
      /* Real part is infinite.  */
      if (FINITEF_P (__imag__ x))
	{
	  /* Imaginary part is finite.  */
	  float value = signbit (__real__ x) ? 0.0 : HUGE_VALF;

	  if (__imag__ x == 0.0)
	    {
	      /* Imaginary part is 0.0.  */
	      __real__ retval = value;
	      __imag__ retval = __imag__ x;
	    }
	  else
	    {
	      float sinix = sinf (__imag__ x);
	      float cosix = cosf (__imag__ x);

	      __real__ retval = copysignf (value, cosix);
	      __imag__ retval = copysignf (value, sinix);
	    }
	}
      else if (signbit (__real__ x) == 0)
	{
	  __real__ retval = HUGE_VALF;
	  __imag__ retval = NAN;
	}
      else
	{
	  __real__ retval = 0.0;
	  __imag__ retval = copysignf (0.0, __imag__ x);
	}
    }
  else
    {
      /* If the real part is NaN the result is NaN + iNaN.  */
      __real__ retval = NAN;
      __imag__ retval = NAN;
    }

  return retval;
}
