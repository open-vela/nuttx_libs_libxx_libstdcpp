// The template and inlines for the -*- C++ -*- complex number classes.

// Copyright (C) 1997-1999 Free Software Foundation, Inc.
//
// This file is part of the GNU ISO C++ Library.  This library is free
// software; you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the
// Free Software Foundation; either version 2, or (at your option)
// any later version.

// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License along
// with this library; see the file COPYING.  If not, write to the Free
// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
// USA.

// As a special exception, you may use this file as part of a free software
// library without restriction.  Specifically, if other files instantiate
// templates or use macros or inline functions from this file, or you compile
// this file and link it with other files to produce an executable, this
// file does not by itself cause the resulting executable to be covered by
// the GNU General Public License.  This exception does not however
// invalidate any other reasons why the executable file might be covered by
// the GNU General Public License.

#include <bits/std_cmath.h>
#include <bits/std_complex.h>

// This is a ISO C 9X header.
#include <mathconf.h>
#undef complex

#ifndef FLT
# define FLT double
#endif

// This file often breaks due to compiler bugs. May need to put in guards, ie:
// #if defined(_GLIBCPP_BUGGY_FLOAT_COMPLEX) 
// and
// #if defined(_GLIBCPP_FLOAT_SPECIALIZATION)

namespace std
{
  template<>
  FLT
  abs(const complex<FLT>& __x)
  { return cabs(__x._M_value); }

  template<>
  FLT
  arg(const complex<FLT>& __x)
  { return carg(__x._M_value); }

  template<>
  complex<FLT>
  polar(const FLT& __rho, const FLT& __theta)
  {
#if 0
// XXX
// defined(_GLIBCPP_HAVE_SINCOS) && !defined(__osf__)
    // Although sincos does exist on OSF3.2 and OSF4.0 we cannot use it
    // since the necessary types are not defined in the headers.
    FLT __sinx, __cosx;
    sincos(__theta, &__sinx, &__cosx);
    return complex<FLT>(__rho * __cosx, __rho * __sinx);
#else
    return complex<FLT>(__rho * cos(__theta), __rho * sin(__theta));
#endif
  }

  template<>
  complex<FLT>
  cos(const complex<FLT>& __x)
  { return complex<FLT>(ccos(__x._M_value)); }

  template<>
  complex<FLT>
  cosh(const complex<FLT>& __x)
  { return complex<FLT>(ccosh(__x._M_value)); }

  template<>
  complex<FLT>
  exp(const complex<FLT>& __x)
  { return complex<FLT>(cexp(__x._M_value)); }

  template<>
  complex<FLT>
  log(const complex<FLT>& __x)
  { return complex<FLT>(c_log(__x._M_value)); }

  template<>
  complex<FLT>
  log10(const complex<FLT>& __x)
  { return complex<FLT>(clog10(__x._M_value)); }
  
  template<>
  complex<FLT>
  pow(const complex<FLT>& __x, int __n)
  { return complex<FLT>(cexp(__n * c_log(__x._M_value))); }

  template<>
  complex<FLT>
  pow(const complex<FLT>& __x, const FLT& __y)
  { return complex<FLT>(cexp(__y * c_log(__x._M_value))); }

  template<>
  complex<FLT>
  pow(const complex<FLT>& __x, const complex<FLT>& __y)
  { return complex<FLT>(cpow(__x._M_value, __y._M_value)); }

  template<>
  complex<FLT>
  pow(const FLT& __x, const complex<FLT>& __y)
  { return complex<FLT>(cexp(__y._M_value * log(__x))); }

  template<>
  complex<FLT>
  sin(const complex<FLT>& __x)
  { return complex<FLT>(csin(__x._M_value)); }

  template<>
  complex<FLT>
  sinh(const complex<FLT>& __x)
  { return complex<FLT>(csinh(__x._M_value)); }
  
  template<>
  complex<FLT>
  sqrt(const complex<FLT>& __x)
  { return complex<FLT>(csqrt(__x._M_value)); }
  
  template<>
  complex<FLT>
  tan(const complex<FLT>& __x)
  { return complex<FLT>(ctan(__x._M_value)); }
  
  template<>
  complex<FLT>
  tanh(const complex<FLT>& __x)
  { return complex<FLT>(ctanh(__x._M_value)); }
  
} // namespace std





