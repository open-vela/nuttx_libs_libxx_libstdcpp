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
// ISO C++ 14882: ???
//

// XXX this is not complete

#ifndef _CPP_CWCTYPE
#define _CPP_CWCTYPE 1

# include <bits/std_cwchar.h>  /* pick up wint_t, WEOF */

  namespace _C_legacy {
    extern "C" {
#     define _IN_C_LEGACY_
#     pragma GCC system_header
#     include_next <wctype.h>
    }
    typedef wctype_t _CPP_wctype_t_capture;
    typedef wctrans_t _CPP_wctrans_t_capture;

    // XXX probably should capture defs of the "is" functions.

    namespace _C_shadow { }
  } // close namespace ::_C_legacy::

# undef size_t  /* handled in <cstddef> */
# undef wchar_t
# undef wint_t
# undef wctype_t
# undef wctrans_t
// # undef WEOF
# undef iswalpha
# undef iswupper
# undef iswlower
# undef iswdigit
# undef iswxdigit
# undef iswalnum
# undef iswspace
# undef iswpunct
# undef iswprint
# undef iswgraph
# undef iswcntrl
# undef iswctype
# undef towlower
# undef towupper

// SunOS macros
# undef iswascii
# undef iscodeset0
# undef iscodeset1
# undef iscodeset2
# undef iscodeset3

  namespace _C_legacy {
    namespace _C_shadow {
      typedef ::_C_legacy::_CPP_wctype_t_capture wctype_t;
      typedef ::_C_legacy::_CPP_wctrans_t_capture wctrans_t;
    }
  }
  namespace std {
    using ::_C_legacy::_C_shadow::wctype_t;
    using ::_C_legacy::_C_shadow::wctrans_t;

    // XXX probably should capture these to inlines.
    using ::_C_legacy::iswalpha;
    using ::_C_legacy::iswupper;
    using ::_C_legacy::iswlower;
    using ::_C_legacy::iswdigit;
    using ::_C_legacy::iswxdigit;
    using ::_C_legacy::iswalnum;
    using ::_C_legacy::iswspace;
    using ::_C_legacy::iswpunct;
    using ::_C_legacy::iswprint;
    using ::_C_legacy::iswgraph;
    using ::_C_legacy::iswcntrl;
    using ::_C_legacy::iswctype;
    using ::_C_legacy::towlower;
    using ::_C_legacy::towupper;

  } // close namespace std::
  
  namespace _C_legacy {
    namespace _C_shadow {
    }
  }

# undef _IN_C_LEGACY_

#endif
