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

//
// ISO C++ 14882: 18.1  Types
//

#ifndef _CPP_CSTDDEF
#define _CPP_CSTDDEF 1

  namespace _C_Swamp {
    extern "C" {
#     define _IN_C_SWAMP_
#     include_next <stddef.h>
    }
    typedef ptrdiff_t _CPP_ptrdiff_t_capture; 
    typedef size_t    _CPP_size_t_capture; 

    namespace _C_Shadow { }
  } // close namespace ::_C_Swamp::

#  undef ptrdiff_t  
#  undef size_t  
#  undef wchar_t  
#  undef  NULL
#  define NULL 0 
// # undef offsetof

  namespace _C_Swamp {
    namespace _C_Shadow {
      typedef ::_C_Swamp::_CPP_ptrdiff_t_capture  ptrdiff_t;
      typedef ::_C_Swamp::_CPP_size_t_capture  size_t;
    }
  }
  namespace std {

    // Adopt C names into std::
    using ::_C_Swamp::_C_Shadow::ptrdiff_t;  
    using ::_C_Swamp::_C_Shadow::size_t;  

  } // close namespace std::
  
  namespace _C_Swamp {
    namespace _C_Shadow {
    }
  }

# undef _IN_C_SWAMP_

#endif

