// -*- C++ -*- header wrapper.

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


#ifndef  _INCLUDED_CPP_STDDEF_H_

// turn off glibc weirdness.  other libs have similar foolishness.
#undef __need_wchar_t
#undef __need_size_t
#undef __need_ptrdiff_t
#undef __need_NULL
#undef __need_wint_t

# undef _SHADOW_NAME
# define _SHADOW_NAME <cstddef>
# include <bits/generic_shadow.h>
# undef _SHADOW_NAME

# ifndef _IN_C_SWAMP_
  using ::std::ptrdiff_t;
  using ::std::size_t;
# define _INCLUDED_CPP_STDDEF_H_ 1
# endif

#endif /* _INCLUDED_CPP_STDDEF_H_ */
