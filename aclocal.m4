dnl aclocal.m4 generated automatically by aclocal 1.4

dnl Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
dnl PARTICULAR PURPOSE.

dnl
dnl Initialize configure bits.
dnl
dnl Define OPTLEVEL='-O2' if new inlining code present.
dnl
dnl GLIBCPP_CONFIGURE
AC_DEFUN(GLIBCPP_CONFIGURE, [
  dnl Default to --enable-multilib
  AC_ARG_ENABLE(multilib,
  [  --enable-multilib       build hella library versions (default)],
  [case "${enableval}" in
    yes) multilib=yes ;;
    no)  multilib=no ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for multilib option) ;;
   esac], [multilib=yes])dnl

  dnl We may get other options which we dont document:
  dnl --with-target-subdir, --with-multisrctop, --with-multisubdir
  if test "[$]{srcdir}" = "."; then
    if test "[$]{with_target_subdir}" != "."; then
      glibcpp_basedir="[$]{srcdir}/[$]{with_multisrctop}../$1"
    else
      glibcpp_basedir="[$]{srcdir}/[$]{with_multisrctop}$1"
    fi
  else
    glibcpp_basedir="[$]{srcdir}/$1"
  fi
  AC_SUBST(glibcpp_basedir)

  AC_CANONICAL_HOST

  AM_INIT_AUTOMAKE(libstdc++, 2.90.8)

# FIXME: We temporarily define our own version of AC_PROG_CC.  This is
# copied from autoconf 2.12, but does not call AC_PROG_CC_WORKS.  We
# are probably using a cross compiler, which will not be able to fully
# link an executable.  This should really be fixed in autoconf
# itself.

AC_DEFUN(LIB_AC_PROG_CC,
[AC_BEFORE([$0], [AC_PROG_CPP])dnl
dnl Fool anybody using AC_PROG_CC.
AC_PROVIDE([AC_PROG_CC])
AC_CHECK_PROG(CC, gcc, gcc)
if test -z "$CC"; then
  AC_CHECK_PROG(CC, cc, cc, , , /usr/ucb/cc)
  test -z "$CC" && AC_MSG_ERROR([no acceptable cc found in \$PATH])
fi

AC_PROG_CC_GNU

if test $ac_cv_prog_gcc = yes; then
  GCC=yes
dnl Check whether -g works, even if CFLAGS is set, in case the package
dnl plays around with CFLAGS (such as to build both debugging and
dnl normal versions of a library), tasteless as that idea is.
  ac_test_CFLAGS="${CFLAGS+set}"
  ac_save_CFLAGS="$CFLAGS"
  CFLAGS=
  AC_PROG_CC_G
  if test "$ac_test_CFLAGS" = set; then
    CFLAGS="$ac_save_CFLAGS"
  elif test $ac_cv_prog_cc_g = yes; then
    CFLAGS="-g -O2"
  else
    CFLAGS="-O2"
  fi
else
  GCC=
  test "${CFLAGS+set}" = set || CFLAGS="-g"
fi
])

LIB_AC_PROG_CC

# Likewise for AC_PROG_CXX.
AC_DEFUN(LIB_AC_PROG_CXX,
[AC_BEFORE([$0], [AC_PROG_CXXCPP])dnl
dnl Fool anybody using AC_PROG_CXX.
AC_PROVIDE([AC_PROG_CXX])
AC_CHECK_PROGS(CXX, $CCC c++ g++ gcc CC cxx cc++, gcc)
test -z "$CXX" && AC_MSG_ERROR([no acceptable c++ found in \$PATH])

AC_PROG_CXX_GNU

if test $ac_cv_prog_gxx = yes; then
  GXX=yes
dnl Check whether -g works, even if CXXFLAGS is set, in case the package
dnl plays around with CXXFLAGS (such as to build both debugging and
dnl normal versions of a library), tasteless as that idea is.
  ac_test_CXXFLAGS="${CXXFLAGS+set}"
  ac_save_CXXFLAGS="$CXXFLAGS"
  CXXFLAGS=
  AC_PROG_CXX_G
  if test "$ac_test_CXXFLAGS" = set; then
    CXXFLAGS="$ac_save_CXXFLAGS"
  elif test $ac_cv_prog_cxx_g = yes; then
    CXXFLAGS="-g -O2"
  else
    CXXFLAGS="-O2"
  fi
else
  GXX=
  test "${CXXFLAGS+set}" = set || CXXFLAGS="-g"
fi
])

LIB_AC_PROG_CXX

# AC_CHECK_TOOL does AC_REQUIRE (AC_CANONICAL_BUILD).  If we dont
# run it explicitly here, it will be run implicitly before
# LIBGCJ_CONFIGURE, which doesn't work because that means that it will
# be run before AC_CANONICAL_HOST.
AC_CANONICAL_BUILD

AC_CHECK_TOOL(AS, as)
AC_CHECK_TOOL(AR, ar)
AC_CHECK_TOOL(RANLIB, ranlib, :)

AC_PROG_INSTALL

AM_MAINTAINER_MODE

# We need AC_EXEEXT to keep automake happy in cygnus mode.  However,
# at least currently, we never actually build a program, so we never
# need to use $(EXEEXT).  Moreover, the test for EXEEXT normally
# fails, because we are probably configuring with a cross compiler
# which cant create executables.  So we include AC_EXEEXT to keep
# automake happy, but we dont execute it, since we dont care about
# the result.
if false; then
  AC_EXEEXT
fi

# configure.host sets the following important variables
#	glibcpp_cflags    - host specific C compiler flags
#	glibcpp_cxxflags  - host specific C++ compiler flags

glibcpp_cflags=
glibcpp_cxxflags=

. [$]{glibcpp_basedir}/configure.host

case [$]{glibcpp_basedir} in
/* | [A-Za-z]:[/\\]*) libgcj_flagbasedir=[$]{glibcpp_basedir} ;;
*) glibcpp_flagbasedir='[$](top_builddir)/'[$]{glibcpp_basedir} ;;
esac

GLIBCPP_CFLAGS="[$]{glibcpp_cflags}"
GLIBCPP_CXXFLAGS="[$]{glibcpp_cxxflags}"
AC_SUBST(GLIBCPP_CFLAGS)
AC_SUBST(GLIBCPP_CXXFLAGS)
])


dnl
dnl Check to see if g++ can compile this library, and if so, if any version-
dnl specific precautions need to be taken. 
dnl 
dnl GLIBCPP_CHECK_COMPILER_VERSION
AC_DEFUN(GLIBCPP_CHECK_COMPILER_VERSION, [
  # Sanity check that g++ is capable of dealing with v-3.
  AC_MSG_CHECKING([for g++ that will successfully compile this code])
  AC_EGREP_CPP([ok], [
  #if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 95) 
    ok
  #endif
  ], gpp_satisfactory=yes, AC_MSG_ERROR("please upgrade to gcc-2.95 or above"))
  AC_MSG_RESULT($gpp_satisfactory)
])


dnl
dnl Test for newer compiler features, or features that are present in newer
dnl compiler version but not older compiler versions should be placed
dnl here.
dnl
dnl Define WFMT_FLAGS='-fdiagnostics-show-location=once' if possible
dnl 
dnl Define WERROR='-Werror' if possible; g++'s that lack the new inlining
dnl code or the new system_header pragma will die.  
dnl
dnl Define SECTION_FLAGS='-ffunction-sections -fdata-sections' if
dnl compiler supports it.  
dnl GLIBCPP_CHECK_COMPILER_FEATURES
AC_DEFUN(GLIBCPP_CHECK_COMPILER_FEATURES, [
  # All these tests are for C++; save the language and the compiler flags.
  # The CXXFLAGS thing is suspicious, but based on similar bits 
  # found in GLIBCPP_CONFIGURE.
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  ac_test_CXXFLAGS="${CXXFLAGS+set}"
  ac_save_CXXFLAGS="$CXXFLAGS"
  WERROR='-Werror'

  # Check for pragma system_header.
  AC_MSG_CHECKING([for g++ that supports pragma system_header])
  CXXFLAGS='-Wunknown-pragmas -Werror'
  AC_TRY_COMPILE([#pragma system_header], [int foo;
  ], [ac_newpragma=yes], [ac_newpragma=no])
  if test "$ac_test_CXXFLAGS" = set; then
    CXXFLAGS="$ac_save_CXXFLAGS"
  else
    # this is the suspicious part
    CXXFLAGS=''
  fi
  if test "$ac_newpragma" = "no"; then
    WERROR="$WERROR -Wno-unknown-pragmas"
  fi
  AC_MSG_RESULT($ac_newpragma)

  # Check for more sophisticated diagnostic control.
  AC_MSG_CHECKING([for g++ that supports -fdiagnostics-show-location=once])
  CXXFLAGS='-fdiagnostics-show-location=once'
  AC_TRY_COMPILE(, [int foo;
  ], [ac_gabydiags=yes], [ac_gabydiags=no])
  if test "$ac_test_CXXFLAGS" = set; then
    CXXFLAGS="$ac_save_CXXFLAGS"
  else
    # this is the suspicious part
    CXXFLAGS=''
  fi
  if test "$ac_gabydiags" = "yes"; then
    WFMT_FLAGS='-fdiagnostics-show-location=once'
  fi
  AC_MSG_RESULT($ac_gabydiags)

  # Check for -ffunction-sections -fdata-sections
  AC_MSG_CHECKING([for g++ that supports -ffunction-sections -fdata-sections])
  CXXFLAGS='-ffunction-sections -fdata-sections'
  AC_TRY_COMPILE(, [int foo;
  ], [ac_fdsections=yes], [ac_fdsections=no])
  if test "$ac_test_CXXFLAGS" = set; then
    CXXFLAGS="$ac_save_CXXFLAGS"
  else
    # this is the suspicious part
    CXXFLAGS=''
  fi
  if test "$ac_fdsections" = "yes"; then
    SECTION_FLAGS='-ffunction-sections -fdata-sections'
  fi
  AC_MSG_RESULT($ac_fdsections)

  AC_LANG_RESTORE
  AC_SUBST(WERROR)
  AC_SUBST(WFMT_FLAGS)
  AC_SUBST(SECTION_FLAGS)
])


dnl
dnl Check to see if tricky linker opts can be used.
dnl
dnl Define SECTION_LDFLAGS='-Wl,--gc-sections' if possible
dnl GLIBCPP_CHECK_LINKER_FEATURES
AC_DEFUN(GLIBCPP_CHECK_LINKER_FEATURES, [
  # All these tests are for C++; save the language and the compiler flags.
  # Need to do this so that g++ won't try to link in libstdc++
  ac_test_CFLAGS="${CFLAGS+set}"
  ac_save_CFLAGS="$CFLAGS"
  CFLAGS='-x c++  -Wl,--gc-sections'

  # Check for -Wl,--gc-sections
  AC_MSG_CHECKING([for ld that supports -Wl,--gc-sections])
  AC_TRY_RUN([
   int main(void) 
   {
     try { throw 1; }
     catch (...) { };
     return 0;
   }
  ], [ac_sectionLDflags=yes], [ac_sectionLFflags=no], [ac_sectionLDflags=yes])
  if test "$ac_test_CFLAGS" = set; then
    CFLAGS="$ac_save_CFLAGS"
  else
    # this is the suspicious part
    CFLAGS=''
  fi
  if test "$ac_sectionLDflags" = "yes"; then
    SECTION_LDFLAGS='-Wl,--gc-sections'
  fi
  AC_MSG_RESULT($ac_sectionLDflags)

  AC_SUBST(SECTION_LDFLAGS)
])


dnl
dnl Check to see if the (math function) argument passed is
dnl 1) declared when using the c++ compiler
dnl 2) has "C" linkage
dnl
dnl Define HAVE_CARGF etc if "cargf" is declared and links
dnl
dnl argument 1 is name of function to check
dnl
dnl ASSUMES argument is a math function with ONE parameter
dnl
dnl GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1
AC_DEFUN(GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1, [
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  AC_MSG_CHECKING([for $1 declaration])
  AC_TRY_COMPILE([#include <math.h>], 
  [ $1(0);], 
  [use_$1=yes], [use_$1=no])
  AC_MSG_RESULT($use_$1)
  AC_LANG_RESTORE
  if test x$use_$1 = x"yes"; then
    AC_CHECK_FUNCS($1)    
  fi
])


dnl
dnl Check to see if the (math function) argument passed is
dnl 1) declared when using the c++ compiler
dnl 2) has "C" linkage
dnl
dnl Define HAVE_CARGF etc if "cargf" is declared and links
dnl
dnl argument 1 is name of function to check
dnl
dnl ASSUMES argument is a math function with TWO parameters
dnl
dnl GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2
AC_DEFUN(GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2, [
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  AC_MSG_CHECKING([for $1 declaration])
  AC_TRY_COMPILE([#include <math.h>], 
  [ $1(0, 0);], 
  [use_$1=yes], [use_$1=no])
  AC_MSG_RESULT($use_$1)
  AC_LANG_RESTORE
  if test x$use_$1 = x"yes"; then
    AC_CHECK_FUNCS($1)    
  fi
])


dnl
dnl Check to see if the (math function) argument passed is
dnl 1) declared when using the c++ compiler
dnl 2) has "C" linkage
dnl
dnl Define HAVE_CARGF etc if "cargf" is declared and links
dnl
dnl argument 1 is name of function to check
dnl
dnl ASSUMES argument is a math function with THREE parameters
dnl
dnl GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3
AC_DEFUN(GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3, [
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  AC_MSG_CHECKING([for $1 declaration])
  AC_TRY_COMPILE([#include <math.h>], 
  [ $1(0, 0, 0);], 
  [use_$1=yes], [use_$1=no])
  AC_MSG_RESULT($use_$1)
  AC_LANG_RESTORE
  if test x$use_$1 = x"yes"; then
    AC_CHECK_FUNCS($1)    
  fi
])


dnl
dnl Because the builtins are picky picky picky about the arguments they take, 
dnl do an explict linkage tests here.
dnl Check to see if the (math function) argument passed is
dnl 1) declared when using the c++ compiler
dnl 2) has "C" linkage
dnl
dnl Define HAVE_CARGF etc if "cargf" is declared and links
dnl
dnl argument 1 is name of function to check
dnl
dnl ASSUMES argument is a math function with ONE parameter
dnl
dnl GLIBCPP_CHECK_BUILTIN_MATH_DECL_LINKAGE_1
AC_DEFUN(GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1, [
  AC_LANG_SAVE
  AC_LANG_CPLUSPLUS
  AC_MSG_CHECKING([for $1 declaration])
  AC_TRY_COMPILE([#include <math.h>], 
  [ $1(0);], 
  [use_$1=yes], [use_$1=no])
  AC_MSG_RESULT($use_$1)
  AC_LANG_RESTORE
  if test x$use_$1 = x"yes"; then
    AC_MSG_CHECKING([for $1 linkage])
      AC_TRY_LINK([#include <math.h>], 
      [ $1(0);],
      [link_$1=yes], [link_$1=no])
    AC_MSG_RESULT($link_$1)
    if test x$link_$1 = x"yes"; then
      ac_tr_func=HAVE_`echo $1 | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
      AC_DEFINE_UNQUOTED(${ac_tr_func})
    fi
  fi
])


dnl
dnl Check to see what builtin math functions are supported
dnl
dnl check for __builtin_abs
dnl check for __builtin_fabsf
dnl check for __builtin_fabs
dnl check for __builtin_fabl
dnl check for __builtin_labs
dnl check for __builtin_sqrtf
dnl check for __builtin_sqrtl
dnl check for __builtin_fsqrt
dnl check for __builtin_sinf
dnl check for __builtin_sin
dnl check for __builtin_sinl
dnl check for __builtin_cosf
dnl check for __builtin_cos
dnl check for __builtin_cosl
dnl
dnl GLIBCPP_CHECK_BUILTIN_MATH_SUPPORT
AC_DEFUN(GLIBCPP_CHECK_BUILTIN_MATH_SUPPORT, [
  dnl Test for builtin math functions.
  dnl These are made in gcc/c-common.c 
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_abs)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_fabsf)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_fabs)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_fabsl)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_labs)

  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_sqrtf)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_fsqrt)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_sqrtl)

  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_sinf)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_sin)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_sinl)

  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_cosf)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_cos)
  GLIBCPP_CHECK_BUILTIN_MATH_DECL_AND_LINKAGE_1(__builtin_cosl)

  dnl There is, without a doubt, a more elegant way to have these
  dnl names exported so that they won't be stripped out of acconfig.h by
  dnl autoheader. I leave this as an exercise to somebody less frustrated
  dnl than I.... please email the libstdc++ list if you can figure out a
  dnl more elegant approach (see autoconf/acgen.m4 and specifically
  dnl AC_CHECK_FUNC for things to steal.)
  dummyvar=no
  if test x$dummyvar = x"yes"; then
    AC_DEFINE(HAVE___BUILTIN_ABS)
    AC_DEFINE(HAVE___BUILTIN_LABS)
    AC_DEFINE(HAVE___BUILTIN_COS)
    AC_DEFINE(HAVE___BUILTIN_COSF)
    AC_DEFINE(HAVE___BUILTIN_COSL)
    AC_DEFINE(HAVE___BUILTIN_FABS)
    AC_DEFINE(HAVE___BUILTIN_FABSF)
    AC_DEFINE(HAVE___BUILTIN_FABSL)
    AC_DEFINE(HAVE___BUILTIN_SIN)
    AC_DEFINE(HAVE___BUILTIN_SINF)
    AC_DEFINE(HAVE___BUILTIN_SINL)
    AC_DEFINE(HAVE___BUILTIN_FSQRT)
    AC_DEFINE(HAVE___BUILTIN_SQRTF)
    AC_DEFINE(HAVE___BUILTIN_SQRTL)
  fi
])


dnl
dnl Check to see what the underlying c library or math library is like.
dnl These checks need to do two things: 
dnl 1) make sure the name is declared when using the c++ compiler
dnl 2) make sure the name has "C" linkage
dnl This might seem like overkill but experience has shown that it's not...
dnl
dnl Define HAVE_CARGF etc if "cargf" is found.
dnl
dnl GLIBCPP_CHECK_MATH_SUPPORT
AC_DEFUN(GLIBCPP_CHECK_MATH_SUPPORT, [
  ac_test_CXXFLAGS="${CXXFLAGS+set}"
  ac_save_CXXFLAGS="$CXXFLAGS"
  CXXFLAGS='-fno-builtins -D_GNU_SOURCE'

  dnl Check libm
  AC_CHECK_LIB(m, sin, libm="-lm")
  ac_save_LIBS="$LIBS"
  LIBS="$LIBS $libm"

  dnl Although not math functions, needed and for some reason checked here.
  AC_CHECK_FUNCS(strtof strtold)

  dnl Check to see if certain C math functions exist.
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(isinf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(isnan)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(finite)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(copysign)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3(sincos)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(fpclass)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(qfpclass)

  dnl Check to see if basic C math functions have float versions.
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(isnanf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(isinff)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(acosf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(asinf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(atanf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(atan2f)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(ceilf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(cosf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(coshf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(expf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(fabsf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(floorf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(fmodf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(frexpf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(ldexpf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(logf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(log10f)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(modff)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(powf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(sinf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(sinhf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(sqrtf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(tanf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(tanhf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3(sincosf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(finitef)

  dnl Check to see if basic C math functions have long double versions.
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(isnanl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(isinfl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(copysignl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(acosl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(asinl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(atanl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(atan2l)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(ceill)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(cosl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(coshl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(expl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(fabsl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(floorl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(fmodl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(frexpl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(ldexpl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(logl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(log10l)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(modfl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(powl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(sinl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(sinhl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(sqrtl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(tanl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(tanhl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3(sincosl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(finitel)

  dnl Some runtimes have these functions with a preceding underscore. Please
  dnl keep this sync'd with the one above. And if you add any new symbol,
  dnl please add the corresponding block in the @BOTTOM@ section of acconfig.h.
  dnl Check to see if certain C math functions exist.
  dnl Check to see if certain C math functions exist.
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_isinf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_isnan)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_finite)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_copysign)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3(_sincos)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_fpclass)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_qfpclass)

  dnl Check to see if basic C math functions have float versions.
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_isnanf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_isinff)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_acosf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_asinf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_atanf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_atan2f)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_ceilf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_cosf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_coshf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_expf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_fabsf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_floorf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_fmodf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_frexpf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_ldexpf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_logf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_log10f)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_modff)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_powf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_sinf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_sinhf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_sqrtf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_tanf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_tanhf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3(_sincosf)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_finitef)

  dnl Check to see if basic C math functions have long double versions.
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_isnanl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_isinfl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_copysignl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_acosl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_asinl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_atanl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_atan2l)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_ceill)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_cosl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_coshl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_expl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_fabsl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_floorl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_fmodl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_frexpl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_ldexpl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_logl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_log10l)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_modfl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_2(_powl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_sinl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_sinhl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_sqrtl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_tanl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_tanhl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_3(_sincosl)
  GLIBCPP_CHECK_MATH_DECL_AND_LINKAGE_1(_finitel)

  LIBS="$ac_save_LIBS"
  CXXFLAGS="$ac_save_CXXFLAGS"
])


dnl
dnl Check to see if there is native support for complex 
dnl
dnl Don't compile bits in math/* if native support exits.
dnl
dnl Define USE_COMPLEX_LONG_DOUBLE etc if "cargf" is found.
dnl
dnl GLIBCPP_CHECK_COMPLEX_MATH_SUPPORT
AC_DEFUN(GLIBCPP_CHECK_COMPLEX_MATH_SUPPORT, [
  dnl Check for complex versions of math functions of platform.
  AC_CHECK_HEADERS([complex.h])
  AC_REPLACE_MATHFUNCS(ccos ccosf ccosh ccoshf cexp cexpf c_log c_logf \
  clog10 clog10f cpow cpowf csin csinf csinh csinhf csqrt csqrtf \
  ctan ctanf ctanh ctanhf carg cargf nan hypot hypotf atan2f expf copysignf)

  dnl Compile the long double complex functions only if the function 
  dnl provides the non-complex long double functions that are needed.
  dnl Currently this includes copysignl and atan2l, which should be
  dnl cached from the GLIBCPP_CHECK_MATH_SUPPORT macro, above.
  USE_COMPLEX_LONG_DOUBLE=no
  if test x$ac_cv_func_atan2l = x"yes" \
     && test x$ac_cv_func_copysignl = x"yes"; then
    USE_COMPLEX_LONG_DOUBLE=yes
    AC_REPLACE_MATHFUNCS(ccoshl ccosl cexpl cpowl csinhl csinl \
    csqrtl ctanhl ctanl cargl hypotl signbitl c_logl clog10l)
  fi

  AC_SUBST(USE_COMPLEX_LONG_DOUBLE)
])


dnl Check to see what architecture we are compiling for. If it's
dnl supported, use special hand-crafted routines to provide thread
dnl primitives. Also, if architecture-specific flags are required for 
dnl compilation, add them here.
dnl 
dnl Depending on what is found, select configure/cpu/*/bits/atomicity.h 
dnl If not found, select configure/cpu/generic/bits/atomicity.h
dnl
dnl GLIBCPP_CHECK_CPU
AC_DEFUN(GLIBCPP_CHECK_CPU, [
    AC_MSG_CHECKING([for cpu primitives directory])
    CPU_FLAGS=			
    case "$target_cpu" in
      alpha*)
	cpu_include_dir="config/cpu/alpha"
        ;;
      arm*)
	cpu_include_dir="config/cpu/arm"
        ;;
      i386)
	cpu_include_dir="config/cpu/i386"
	;;
      i486 | i586 | i686 | i786)
	cpu_include_dir="config/cpu/i486"
        ;;
      powerpc | rs6000)
	cpu_include_dir="config/cpu/powerpc"
    	CPU_FLAGS='-mcpu=powerpc'
        ;;
      sparc64 | ultrasparc)
	cpu_include_dir="config/cpu/sparc/sparc64"
        ;;
      sparc*)
	cpu_include_dir="config/cpu/sparc/sparc32"
        ;;
      *)
	cpu_include_dir="config/cpu/generic"
        ;;
    esac
    AC_MSG_RESULT($cpu_include_dir)
    AC_SUBST(cpu_include_dir)
    AC_SUBST(CPU_FLAGS)
])

 
dnl
dnl Check to see what the underlying c library's interface to ctype looks
dnl like. Bits of locale rely on things like isspace, toupper, etc. This
dnl stuff makes sure the right bits from the clibrary get called.
dnl 
dnl Depending on what is found, select various configure/*/bits/ctype_base.h 
dnl Depending on what is found, select various configure/*/ctype.cc
dnl
dnl GLIBCPP_CHECK_CTYPE
AC_DEFUN(GLIBCPP_CHECK_CTYPE, [
  AC_CHECK_HEADER(ctype.h, [
    
    dnl If doesn't match any specified, go with defaults.
    ctype_default=yes

    dnl Test for <ctype> functionality -- gnu-linux
    AC_MSG_CHECKING([<ctype> for gnu-linux ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _ISspace + _ISprint + _IScntrl + _ISupper + _ISlower + _ISalpha \
	+ _ISdigit + _ISpunct + _ISxdigit + _ISalnum + _ISgraph \
	+ __ctype_tolower[a] + __ctype_toupper[a] + __ctype_b[a];}], \
    ctype_linux=yes, ctype_linux=no)
    AC_MSG_RESULT($ctype_linux)
    if test $ctype_linux = "yes"; then
      ctype_include_dir="config/gnu-linux"
      ctype_default=no
    fi

    dnl Test for <ctype> functionality -- FreeBSD 4.0
    if test $ctype_default = "yes"; then
    AC_MSG_CHECKING([<ctype> for freebsd 4.0 ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _CTYPE_S + _CTYPE_R + _CTYPE_C + _CTYPE_U + _CTYPE_L + _CTYPE_A \
	+ _CTYPE_D + _CTYPE_P + _CTYPE_X + _CTYPE_G ;}], \
    ctype_bsd=yes, ctype_bsd=no)
    AC_MSG_RESULT($ctype_bsd)
    if test $ctype_bsd = "yes"; then
      ctype_include_dir="config/bsd"
      ctype_default=no
    fi
    fi

    dnl Test for <ctype> functionality -- FreeBSD 3.4
    if test $ctype_default = "yes"; then
    AC_MSG_CHECKING([<ctype> for freebsd 3.4 ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _S + _R + _C + _U + _L + _A \
      + _D + _P + _X + _G + __istype (a, 0);}], \
    ctype_freebsd34=yes, ctype_freebsd34=no)
    AC_MSG_RESULT($ctype_freebsd34)
    if test $ctype_freebsd34 = "yes"; then
      ctype_include_dir="config/bsd"
      ctype_default=no
    fi
    fi

    dnl Test for <ctype> functionality -- solaris 2.6 and 2.7
    if test $ctype_default = "yes"; then
    AC_MSG_CHECKING([<ctype> for solaris 2.[6,7,8] ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _ISSPACE + _ISPRINT + _ISCNTRL + _ISUPPER + _ISLOWER + _ISALPHA \
	+ _ISDIGIT + _ISPUNCT + _ISXDIGIT + _ISALNUM + _ISGRAPH \
	+ __trans_lower[a] + __trans_upper[a] + __ctype_mask[a];}], \
    ctype_solaris=yes, ctype_solaris=no)
    AC_MSG_RESULT($ctype_solaris)

    if test $ctype_solaris = "yes"; then
      AC_MSG_CHECKING([  for version])
      AC_LANG_CPLUSPLUS 
      AC_TRY_COMPILE([#include <ctype.h>],
      [typedef long* __to_type; __to_type const& _M_toupper = __trans_upper;],\
      ctype_solaris26=yes, ctype_solaris26=no)
      AC_LANG_C
      if test $ctype_solaris26 = "yes"; then
        ctype_include_dir="config/solaris/solaris2.6"
        AC_MSG_RESULT("solaris2.6")
        ctype_default=no
      else
        ctype_include_dir="config/solaris/solaris2.7"
        AC_MSG_RESULT("solaris2.[7,8]")
        ctype_default=no
      fi
    fi
    fi  

    dnl Test for <ctype> functionality -- solaris 2.5.1
    if test $ctype_default = "yes"; then
    AC_MSG_CHECKING([<ctype> for solaris 2.5.1 ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _U + _L + _N + _S + _P + _C + _X + _B \
	+ __ctype[a];}], \
    ctype_solaris25=yes, ctype_solaris25=no)
    AC_MSG_RESULT($ctype_solaris25)
    if test $ctype_solaris25 = "yes"; then
      ctype_include_dir="config/solaris/solaris2.5"
      ctype_default=no
    fi
    fi

    dnl Test for <ctype> functionality -- aix
    if test $ctype_default = "yes"; then
    AC_MSG_CHECKING([<ctype> for aix ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _ISSPACE + _ISPRINT + _ISCNTRL + _ISUPPER + _ISLOWER + _ISALPHA \
	+ _ISDIGIT + _ISPUNCT + _ISXDIGIT + _ISALNUM + _ISGRAPH \
	+ _VALC('a') + _IS('c', 0);}], \
    ctype_aix=yes, ctype_aix=no)
    AC_MSG_RESULT($ctype_aix)
    if test $ctype_aix = "yes"; then
      ctype_include_dir="config/aix"
      ctype_default=no
    fi
    fi

    dnl Test for <ctype> functionality -- newlib
    if test $ctype_default = "yes"; then
    AC_MSG_CHECKING([<ctype> for newlib ])
    AC_TRY_COMPILE([#include <ctype.h>],
    [int
    foo (int a)
    { return _U + _L + _N + _S + _P + _C + _X + _B \
	+ _ctype_[a];}], \
    ctype_newlib=yes, ctype_newlib=no)
    AC_MSG_RESULT($ctype_newlib)
    if test $ctype_newlib = "yes"; then
      ctype_include_dir="config/newlib"
      ctype_default=no
    fi
    fi

    if test $ctype_default = "yes"; then
      ctype_include_dir="config/generic"
      AC_MSG_WARN("Using default ctype headers.")
    fi
    AC_SUBST(ctype_include_dir)
  ])
])


dnl
dnl Check to see if this target can enable the wchar_t parts of libstdc++.
dnl
dnl Define _GLIBCPP_USE_WCHAR_T if all the bits are found 
dnl Define _GLIBCPP_NEED_MBSTATE_T if mbstate_t is not in wchar.h
dnl
dnl GLIBCPP_CHECK_WCHAR_T_SUPPORT
AC_DEFUN(GLIBCPP_CHECK_WCHAR_T_SUPPORT, [

  dnl Sanity check for existence of ISO C9X headers for extended encoding.
  AC_CHECK_HEADER(wchar.h, ac_has_wchar_h=yes, ac_has_wchar_h=no)
  AC_CHECK_HEADER(wctype.h, ac_has_wctype_h=yes, ac_has_wctype_h=no)
	
  dnl Only continue checking if the ISO C9X headers exist.
  if test x"$ac_has_wchar_h" = xyes && test x"$ac_has_wctype_h" = xyes; then

    dnl Test wchar.h for mbstate_t, which is needed for char_traits and others.
    AC_MSG_CHECKING([for mbstate_t])
    AC_TRY_COMPILE([#include <wchar.h>],
    [mbstate_t teststate;], 
    use_native_mbstatet=yes, use_native_mbstatet=no)
    AC_MSG_RESULT($use_native_mbstatet)
    if test x"$use_native_mbstatet" = xno; then
      AC_DEFINE(_GLIBCPP_NEED_MBSTATE_T)
    fi
  
    dnl Test wchar.h for WCHAR_MIN, WCHAR_MAX, which is needed before
    dnl numeric_limits can instantiate type_traits<wchar_t>
    AC_MSG_CHECKING([for WCHAR_MIN and WCHAR_MAX])
    AC_TRY_COMPILE([#include <wchar.h>],
    [int i = WCHAR_MIN; int j = WCHAR_MAX;], 
    has_wchar_minmax=yes, has_wchar_minmax=no)
    AC_MSG_RESULT($has_wchar_minmax)
  
    dnl Test wchar.h for WEOF, which is what we use to determine whether
    dnl to specialize for char_traits<wchar_t> or not.
    AC_MSG_CHECKING([for WEOF])
    AC_TRY_COMPILE([
      #include <wchar.h>
      #include <stddef.h>],
    [wint_t i = WEOF;],
    has_weof=yes, has_weof=no)
    AC_MSG_RESULT($has_weof)

    dnl Tests for wide character functions used in char_traits<wchar_t>.
    AC_CHECK_FUNCS(wcslen wmemchr wmemcmp wmemcpy wmemmove wmemset, ac_wfuncs=yes, ac_wfuncs=no)

    AC_MSG_CHECKING([for ISO C9X wchar_t support])
    if test x"$has_weof" = xyes && test x"$has_wchar_minmax" = xyes && test x"$ac_wfuncs" = xyes; then
      ac_isoC9X_wchar_t=yes
    else
      ac_isoC9X_wchar_t=no
    fi
    AC_MSG_RESULT($ac_isoC9X_wchar_t)

    dnl Use iconv for wchar_t to char conversions. As such, check for 
    dnl X/Open Portability Guide, version 2 features (XPG2).
    AC_CHECK_HEADER(iconv.h, ac_has_iconv_h=yes, ac_has_iconv_h=no)
    AC_CHECK_FUNCS(iconv_open iconv_close iconv, ac_XPG2funcs=yes, ac_XPG2funcs=no)

    AC_MSG_CHECKING([for XPG2 wchar_t support])
    if test x"$ac_has_iconv_h" = xyes && test x"$ac_XPG2funcs" = xyes; then
      ac_XPG2_wchar_t=yes
    else
      ac_XPG2_wchar_t=no
    fi
    AC_MSG_RESULT($ac_XPG2_wchar_t)

    dnl At the moment, only enable wchar_t specializations if all the
    dnl above support is present.
    AC_MSG_CHECKING([for enabled wchar_t specializations])
    if test x"$ac_isoC9X_wchar_t" = xyes && test x"$ac_XPG2_wchar_t" = xyes; then
      libinst_wstring_la="libinst-wstring.la"
      AC_DEFINE(_GLIBCPP_USE_WCHAR_T)
      AC_MSG_RESULT("yes")
    else
      libinst_wstring_la=""
      AC_MSG_RESULT("no")
    fi
    AC_SUBST(libinst_wstring_la)

  else
    AC_MSG_WARN([<wchar.h> not found])
    AC_DEFINE(_GLIBCPP_NEED_MBSTATE_T)
  fi
])


dnl
dnl Check to see if this version of GNU C++ is afflicted by bugs in
dnl __complex__ float support.
dnl
dnl Define _GLIBCPP_BUGGY_FLOAT_COMPLEX if buggy.
dnl
dnl Check to see if this version of GNU C++ is afflicted by bugs in 
dnl __complex__ support.Check for buggy __complex__ that will cause ICE in
dnl gcc-2.95.x when using the library, unless we define the default copy
dnl ctor in the specializations of complex<>. 
dnl 
dnl Define _GLIBCPP_BUGGY_COMPLEX if buggy.
dnl GLIBCPP_CHECK_COMPLEX_MATH_COMPILER_SUPPORT
AC_DEFUN(GLIBCPP_CHECK_COMPLEX_MATH_COMPILER_SUPPORT, [
  AC_REQUIRE([AC_PROG_CXX])

  AC_MSG_CHECKING([for GNU C++ __complex__ support])
  AC_CACHE_VAL(glibcpp_cv_complex, [
    AC_LANG_SAVE
    AC_LANG_CPLUSPLUS
    AC_TRY_COMPILE([struct dcomplex { __complex__ double x; }; \
		    dcomplex f(const dcomplex& x) { return dcomplex(x); }], \
		    [ dcomplex x; f(x); ],
      glibcpp_cv_complex=ok,
      glibcpp_cv_complex=buggy
    )
    AC_LANG_RESTORE
  ])
  AC_MSG_RESULT($glibcpp_cv_complex)
  if test $glibcpp_cv_complex = buggy; then
    AC_DEFINE(_GLIBCPP_BUGGY_COMPLEX)
  fi

  AC_MSG_CHECKING([for GNU C++ __complex__ float support])
  AC_CACHE_VAL(glibcpp_cv_float_complex, [
    AC_LANG_SAVE
    AC_LANG_CPLUSPLUS
    rm -f conftest.h
    cat > conftest.h <<EOB
      //
      // Check for buggy __complex__ that causes ICE in most versions of egcs
      // and gcc-2.95.x on certain platforms (eg., x86-win32).
      //
      // See http://egcs.cygnus.com/ml/gcc-bugs/1999-07/msg00845.html for
      // more info on the bug itself.
      //
      struct
      float_complex
      {
       __complex__ float m_value;
       float_complex (float = 0.0f, float = 0.0f);
       float_complex (__complex__ float val) : m_value (val) {}
       float_complex foo (const float_complex &val)
         { return float_complex (~val.m_value); }
      };
EOB
    AC_TRY_COMPILE([#include "conftest.h"], ,
      glibcpp_cv_float_complex=ok,
      glibcpp_cv_float_complex=buggy
    )
    AC_LANG_RESTORE
  ])
  AC_MSG_RESULT($glibcpp_cv_float_complex)
  if test $glibcpp_cv_float_complex = buggy; then
    AC_DEFINE(_GLIBCPP_BUGGY_FLOAT_COMPLEX)
  fi
])


dnl
dnl Check for special debugging mode; not for production use.
dnl
dnl GLIBCPP_ENABLE_DEBUG
dnl --enable-debug sets '-ggdb -O0'.
dnl --disable-debug sets '-g' and whatever optimization options the
dnl     compiler can handle.
dnl  +  Perhaps --enable-maintainer-mode should automatically turn this on?
dnl  +  Perhaps -D/-U of NDEBUG, DEBUG, DEBUG_ASSERT, ...?
dnl  +  Usage:  GLIBCPP_ENABLE_DEBUG[(DEFAULT)]
dnl       Where DEFAULT is either `yes' or `no'.  If ommitted, it
dnl       defaults to `no'.
AC_DEFUN(GLIBCPP_ENABLE_DEBUG, [dnl
define([GLIBCPP_ENABLE_DEBUG_DEFAULT], ifelse($1, yes, yes, no))dnl
AC_ARG_ENABLE(debug,
changequote(<<, >>)dnl
<<  --enable-debug          extra debugging, turn off optimization [default=>>GLIBCPP_ENABLE_DEBUG_DEFAULT],
changequote([, ])dnl
[case "$enableval" in
 yes) enable_debug=yes ;;
 no)  enable_debug=no ;;
 *)   AC_MSG_ERROR([Unknown argument to enable/disable extra debugging]) ;;
 esac],
enable_debug=GLIBCPP_ENABLE_DEBUG_DEFAULT)dnl
dnl Option parsed, now set things appropriately
case "$enable_debug" in
    yes) 
	DEBUG_FLAGS='-O0 -ggdb'			
	;;
    no)   
	DEBUG_FLAGS='-g'
        ;;
esac
AC_SUBST(DEBUG_FLAGS)
])


dnl
dnl Check for "unusual" flags to pass to the compiler while building.
dnl
dnl GLIBCPP_ENABLE_CXX_FLAGS
dnl --enable-cxx-flags='-foo -bar -baz' is a general method for passing
dnl     experimental flags such as -fhonor-std, -fsquangle, -Dfloat=char, etc.
dnl     Somehow this same set of flags must be passed when [re]building
dnl     libgcc.
dnl --disable-cxx-flags passes nothing.
dnl  +  See http://sourceware.cygnus.com/ml/libstdc++/2000-q2/msg00131.html
dnl         http://sourceware.cygnus.com/ml/libstdc++/2000-q2/msg00284.html
dnl         http://sourceware.cygnus.com/ml/libstdc++/2000-q1/msg00035.html
dnl  +  Usage:  GLIBCPP_ENABLE_CXX_FLAGS(default flags)
dnl       If "default flags" is an empty string (or "none"), the effect is
dnl       the same as --disable or --enable=no.
AC_DEFUN(GLIBCPP_ENABLE_CXX_FLAGS, [dnl
define([GLIBCPP_ENABLE_CXX_FLAGS_DEFAULT], ifelse($1,,, $1))dnl
AC_ARG_ENABLE(cxx-flags,
changequote(<<, >>)dnl
<<  --enable-cxx-flags=FLAGS      pass compiler FLAGS when building library;
                                [default=>>GLIBCPP_ENABLE_CXX_FLAGS_DEFAULT],
changequote([, ])dnl
[case "x$enableval" in
 xyes)   AC_MSG_ERROR([--enable-cxx-flags needs compiler flags as arguments]) ;;
 xno|x)  enable_cxx_flags='' ;;
 *)      enable_cxx_flags="$enableval" ;;
 esac],
enable_cxx_flags='GLIBCPP_ENABLE_CXX_FLAGS_DEFAULT')dnl
dnl Thinko on my part during design.  This kludge is the workaround.
if test "$enable_cxx_flags" = "none"; then enable_cxx_flags=''; fi
dnl Run through flags (either default or command-line) and set anything
dnl extra (e.g., #defines) that must accompany particular g++ options.
if test -n "$enable_cxx_flags"; then
    for f in $enable_cxx_flags; do
        case "$f" in
            -fhonor-std)  ;;
            -*)  ;;
            *)   # and we're trying to pass /what/ exactly?
                 AC_MSG_ERROR([compiler flags start with a -]) ;;
        esac
    done
fi
EXTRA_CXX_FLAGS="$enable_cxx_flags"
AC_SUBST(EXTRA_CXX_FLAGS)
])


dnl
dnl Check for instructions to automatically rebuild libgcc.a.  Requires,
dnl of course, the location of the gcc objdir.  Note that if --disable-
dnl namespaces is in effect, rebuilding libgcc.a is an expensive no-op.
dnl
dnl GLIBCPP_ENABLE_RELIBGCC
dnl --enable-libgcc-rebuild=/absolute/path/to/gcc/objdir sets GCC_OBJDIR
dnl     (presumably in the top-level Makefile) to /absol.../objdir
dnl --disable-libgcc-rebuild will not touch libgcc.a at all (maybe print
dnl     a warning if this is given along with --enable-namespaces), by
dnl     setting GCC_OBJDIR to `no'.
dnl  +  Doing this by default is going to be interesting.  What default
dnl     "on" value can there be?
dnl  +  Usage:  GLIBCPP_ENABLE_RELIBGCC[(DEFAULT)]
dnl       The default path should be ../.. if bundled with GCC source.
dnl       If ommitted, it defaults to `no'.
dnl
AC_DEFUN(GLIBCPP_ENABLE_RELIBGCC, [dnl
define([GLIBCPP_ENABLE_RELIBGCC_DEFAULT], ifelse($1,, no, $1))dnl
AC_ARG_ENABLE(libgcc-rebuild,
changequote(<<, >>)dnl
<<  --enable-libgcc-rebuild=DIR     also rebuild libgcc.a; DIR is
                                  the GCC objdir; see install.html>>,
changequote([, ])dnl
[case "$enableval" in
 yes) AC_MSG_ERROR([--enable-libgcc-rebuild needs a pathname]) ;;
 no)  enable_libgcc_rebuild=no ;;
 *)   if test -d "$enableval" && test -d "${enableval}/gcc" && \
         test -d "${enableval}/libiberty"
      then
         enable_libgcc_rebuild="$enableval"
      else
         AC_MSG_ERROR(["$enableval" does not appear to be the GCC objdir])
      fi
      ;;
 esac],
enable_libgcc_rebuild=GLIBCPP_ENABLE_RELIBGCC_DEFAULT)dnl
GCC_OBJDIR="$enable_libgcc_rebuild"
AC_SUBST(GCC_OBJDIR)
])


dnl
dnl Check for which I/O library to use:  libio, or something specific.
dnl
dnl GLIBCPP_ENABLE_CSTDIO
dnl --enable-cstdio=libio sets config/c_io_libio.h and friends
dnl 
dnl default is libio
dnl
AC_DEFUN(GLIBCPP_ENABLE_CSTDIO, [
  AC_MSG_CHECKING([for cstdio to use])
  AC_ARG_ENABLE(cstdio,
  [  --enable-cstdio         enable GNU libio for target io package. (default)
  --enable-cstdio=LIB     use LIB target-speific io package.], 
  if test x$enable_cstdio = xno; then
    enable_cstdio=libio
  fi,
     enable_cstdio=libio)

  enable_cstdio_flag=$enable_cstdio

  dnl Check if a valid thread package
  case x${enable_cstdio_flag} in
	xlibio | x | xno | xnone | xyes)
		# default
		CSTDIO_H=c_io_libio.h
		CSTDIO_CC=c_io_libio.cc
 		AC_MSG_RESULT(libio)

		# see if we are on a system with libio native (ie, linux)
  		AC_CHECK_HEADER(libio.h,  has_libio=yes, has_libio=no)
  		if test $has_libio = "yes"; then
   		  BUILD_LIBIO_INCLUDE=
		  need_libio=no
  		else
   		  BUILD_LIBIO_INCLUDE='-I../libio'
		  need_libio=yes
  		fi
  		AC_SUBST(BUILD_LIBIO_INCLUDE)

		# see if the _G_config.h header needs to be built. 
		# NB: This replaces the _G_CONFIG_H machinery in libio-v2
		AC_CHECK_HEADER(_G_config.h,  has_gconf_h=yes, has_gconf_h=no)
  		AM_CONDITIONAL(GLIBCPP_NEED_LIBIO_CONFIG_H, test "$has_gconf_h" = no)
		;;
        xwince)
                CSTDIO_H=c_io_wince.h
                CSTDIO_CC=c_io_wince.cc
                AC_MSG_RESULT(wince)

                need_libio=no
                BUILD_LIBIO_INCLUDE=
                AC_SUBST(BUILD_LIBIO_INCLUDE)
                ;;
	*)
		echo "$enable_cstdio is an unknown io package" 1>&2
		exit 1
		;;
  esac
  AC_SUBST(CSTDIO_H)
  AC_SUBST(CSTDIO_CC)
  AM_CONDITIONAL(GLIBCPP_NEED_LIBIO, test "$need_libio" = yes)
])


dnl
dnl Check for which threading library to use.
dnl
dnl GLIBCPP_ENABLE_THREADS
dnl --enable-threads=posix sets config/threads-posix.h et. al.
dnl 
dnl default is no threads
dnl
AC_DEFUN(GLIBCPP_ENABLE_THREADS, [
  dnl Note this comes from the gcc/config.in and libjava/config.in
  dnl Efforts should be made to keep this in sync.
  AC_MSG_CHECKING([for threads package to use])
  AC_ARG_ENABLE(threads,
  [  --enable-threads        enable thread usage for target GCC.
  --enable-threads=LIB    use LIB thread package for target GCC.],
  if test x$enable_threads = xno; then
    enable_threads=''
  fi,
    enable_threads='')

  enable_threads_flag=$enable_threads

  dnl Check if a valid thread package
  case x${enable_threads_flag} in
	x | xno | xnone)
		# No threads
		target_thread_file='single'
		;;
	xyes)
		# default
		target_thread_file=''
		;;
	xdecosf1 | xirix | xmach | xos2 | xposix | xpthreads | xsingle | \
	xsolaris | xwin32 | xdce | xvxworks)
		target_thread_file=$enable_threads_flag
		;;
	*)
		echo "$enable_threads is an unknown thread package" 1>&2
		exit 1
		;;
  esac

  dnl Check for thread package actually supported in libstdc++ 
  case "$target_thread_file" in
    no | none | single)
      THREADS=none
      ;;
    posix | pthreads)
      THREADS=posix
      case "$host" in
        *-*-linux*)
	;;
      esac
      ;;
    decosf1 | irix | mach | os2 | solaris | win32 | dce | vxworks)
      AC_MSG_ERROR(thread package $THREADS not yet supported)
      ;;
    *)
      AC_MSG_ERROR($THREADS is an unknown thread package)
      ;;
  esac
  AC_MSG_RESULT($THREADS)

  THREADLIBS=
  THREADINCS=
  THREADDEPS=
  THREADOBJS=
  THREADH=
  THREADSPEC=
  case "$THREADS" in
    posix)
      AC_CHECK_HEADER(pthread.h, [have_pthread_h=yes], [have_pthread_h=])
      THREADLIBS=-lpthread
      THREADSPEC=-lpthread
      dnl Not presently used
      dnl THREADOBJS=threads-posix.lo
      THREADH=threads-posix.h
      ;;
    none)
      dnl Not presently used
      dnl THREADOBJS=threads-no.lo
      THREADH=threads-no.h
      ;;
  esac
  AC_SUBST(THREADLIBS)
  AC_SUBST(THREADINCS)
  AC_SUBST(THREADDEPS)
  AC_SUBST(THREADOBJS)
  AC_SUBST(THREADSPEC)
])


dnl
dnl Check for template specializations for the 'long long' type extension.
dnl
dnl GLIBCPP_ENABLE_LONG_LONG
dnl --enable-long-long defines _GLIBCPP_USE_LONG_LONG
dnl --disable-long-long leaves _GLIBCPP_USE_LONG_LONG undefined
dnl  +  Usage:  GLIBCPP_ENABLE_LONG_LONG[(DEFAULT)]
dnl       Where DEFAULT is either `yes' or `no'.  If ommitted, it
dnl       defaults to `no'.
dnl  +  If 'long long' stuff is not available, ignores DEFAULT and sets `no'.
dnl
dnl GLIBCPP_ENABLE_LONG_LONG
AC_DEFUN(GLIBCPP_ENABLE_LONG_LONG, [dnl
  define([GLIBCPP_ENABLE_LONG_LONG_DEFAULT], ifelse($1, yes, yes, no))dnl

  AC_ARG_ENABLE(long-long,
  changequote(<<, >>)dnl
  <<--enable-long-long      turns on 'long long' [default=>>GLIBCPP_ENABLE_LONG_LONG_DEFAULT],
  changequote([, ])dnl
  [case "$enableval" in
   yes) enable_long_long=yes ;;
   no)  enable_long_long=no ;;
   *)   AC_MSG_ERROR([Unknown argument to enable/disable long long]) ;;
   esac],
  enable_long_long=GLIBCPP_ENABLE_LONG_LONG_DEFAULT)dnl

  # Check for the existance of functions used if long long is enabled.
  AC_CHECK_FUNC(strtoll,,ac_strtoll=no)
  AC_CHECK_FUNC(strtoull,,ac_strtoull=no)

  AC_MSG_CHECKING([for enabled long long])
  if test x"$ac_strtoll" = xno || test x"$ac_strtoull" = xno; then 
    enable_long_long=no; 
  fi; 
  AC_MSG_RESULT($enable_long_long)

  dnl Option parsed, now set things appropriately
  case "$enable_long_long" in
    yes)  AC_DEFINE(_GLIBCPP_USE_LONG_LONG)
          ;;
  esac
])


dnl
dnl Check for whether or not to do shadowed C headers.
dnl
dnl GLIBCPP_ENABLE_SHADOW
dnl --enable-cshadow-headers [does stuff].
dnl --disable-cshadow-headers [does not do stuff].
dnl  +  This will eventually need to be on by default.
dnl  +  Usage:  GLIBCPP_ENABLE_SHADOW[(DEFAULT)]
dnl       Where DEFAULT is either `yes' or `no'.  If ommitted, it
dnl       defaults to `no'.
AC_DEFUN(GLIBCPP_ENABLE_SHADOW, [dnl
define([GLIBCPP_ENABLE_SHADOW_DEFAULT], ifelse($1, yes, yes, no))dnl
AC_MSG_CHECKING([for enabled cshadow headers])
AC_ARG_ENABLE(cshadow-headers,
changequote(<<, >>)dnl
<<  --enable-cshadow-headers construct "shadowed" C header files for
                           g++ [default=>>GLIBCPP_ENABLE_SHADOW_DEFAULT],
changequote([, ])dnl
[case "$enableval" in
 yes) enable_cshadow_headers=yes 
	;;
 no)  enable_cshadow_headers=no 
	;;
 *)   AC_MSG_ERROR([Unknown argument to enable/disable shadowed C headers]) 
	;;
 esac],
enable_cshadow_headers=GLIBCPP_ENABLE_SHADOW_DEFAULT)dnl
AC_MSG_RESULT($enable_cshadow_headers)
dnl Option parsed, now set things appropriately
case "$enable_cshadow_headers" in
    yes) 
	CSHADOWFLAGS="-D_GNU_SOURCE"
	CSHADOW_INCLUDES=" -I$srcdir/shadow -I$blddir/cshadow"
	;;
    no)   
	CSHADOWFLAGS=""
	CSHADOW_INCLUDES=""
        ;;
esac

AC_SUBST(CSHADOWFLAGS)
AC_SUBST(CSHADOW_INCLUDES)
AM_CONDITIONAL(GLIBCPP_USE_CSHADOW, test "$enable_cshadow_headers" = yes)
])


# Check whether LC_MESSAGES is available in <locale.h>.
# Ulrich Drepper <drepper@cygnus.com>, 1995.
#
# This file file be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
# Please note that the actual code is *not* freely available.

# serial 1

AC_DEFUN(AC_LC_MESSAGES,
  [if test $ac_cv_header_locale_h = yes; then
    AC_CACHE_CHECK([for LC_MESSAGES], ac_cv_val_LC_MESSAGES,
      [AC_TRY_LINK([#include <locale.h>], [return LC_MESSAGES],
       ac_cv_val_LC_MESSAGES=yes, ac_cv_val_LC_MESSAGES=no)])
    if test $ac_cv_val_LC_MESSAGES = yes; then
      AC_DEFINE(HAVE_LC_MESSAGES)
    fi
  fi])


# Check for functions in math library.
# Ulrich Drepper <drepper@cygnus.com>, 1998.
#
# This file can be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
# Please note that the actual code is *not* freely available.

# serial 1

dnl AC_REPLACE_MATHFUNCS(FUNCTION...)
AC_DEFUN(AC_REPLACE_MATHFUNCS,
[AC_CHECK_FUNCS([$1], , [LIBMATHOBJS="$LIBMATHOBJS ${ac_func}.lo"])
AC_SUBST(LIBMATHOBJS)dnl
])


# Check for string functions.
# Ulrich Drepper <drepper@cygnus.com>, 1998.
#
# This file can be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
# Please note that the actual code is *not* freely available.

# serial 1

dnl AC_REPLACE_STRINGFUNCS(FUNCTION...)
AC_DEFUN(AC_REPLACE_STRINGFUNCS,
[AC_CHECK_FUNCS([$1], , [LIBSTRINGOBJS="$LIBSTRINGOBJS ${ac_func}.lo"])
AC_SUBST(LIBSTRINGOBJS)dnl
])

# Do all the work for Automake.  This macro actually does too much --
# some checks are only needed if your package does certain things.
# But this isn't really a big deal.

# serial 1

dnl Usage:
dnl AM_INIT_AUTOMAKE(package,version, [no-define])

AC_DEFUN(AM_INIT_AUTOMAKE,
[AC_REQUIRE([AC_PROG_INSTALL])
PACKAGE=[$1]
AC_SUBST(PACKAGE)
VERSION=[$2]
AC_SUBST(VERSION)
dnl test to see if srcdir already configured
if test "`cd $srcdir && pwd`" != "`pwd`" && test -f $srcdir/config.status; then
  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
fi
ifelse([$3],,
AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package]))
AC_REQUIRE([AM_SANITY_CHECK])
AC_REQUIRE([AC_ARG_PROGRAM])
dnl FIXME This is truly gross.
missing_dir=`cd $ac_aux_dir && pwd`
AM_MISSING_PROG(ACLOCAL, aclocal, $missing_dir)
AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
AM_MISSING_PROG(AUTOMAKE, automake, $missing_dir)
AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
AM_MISSING_PROG(MAKEINFO, makeinfo, $missing_dir)
AC_REQUIRE([AC_PROG_MAKE_SET])])

#
# Check to make sure that the build environment is sane.
#

AC_DEFUN(AM_SANITY_CHECK,
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftestfile
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
   if test "[$]*" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftestfile`
   fi
   if test "[$]*" != "X $srcdir/configure conftestfile" \
      && test "[$]*" != "X conftestfile $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "[$]2" = conftestfile
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
rm -f conftest*
AC_MSG_RESULT(yes)])

dnl AM_MISSING_PROG(NAME, PROGRAM, DIRECTORY)
dnl The program must properly implement --version.
AC_DEFUN(AM_MISSING_PROG,
[AC_MSG_CHECKING(for working $2)
# Run test in a subshell; some versions of sh will print an error if
# an executable is not found, even if stderr is redirected.
# Redirect stdin to placate older versions of autoconf.  Sigh.
if ($2 --version) < /dev/null > /dev/null 2>&1; then
   $1=$2
   AC_MSG_RESULT(found)
else
   $1="$3/missing $2"
   AC_MSG_RESULT(missing)
fi
AC_SUBST($1)])

# Add --enable-maintainer-mode option to configure.
# From Jim Meyering

# serial 1

AC_DEFUN(AM_MAINTAINER_MODE,
[AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
  dnl maintainer-mode is disabled by default
  AC_ARG_ENABLE(maintainer-mode,
[  --enable-maintainer-mode enable make rules and dependencies not useful
                          (and sometimes confusing) to the casual installer],
      USE_MAINTAINER_MODE=$enableval,
      USE_MAINTAINER_MODE=no)
  AC_MSG_RESULT($USE_MAINTAINER_MODE)
  AM_CONDITIONAL(MAINTAINER_MODE, test $USE_MAINTAINER_MODE = yes)
  MAINT=$MAINTAINER_MODE_TRUE
  AC_SUBST(MAINT)dnl
]
)

# Define a conditional.

AC_DEFUN(AM_CONDITIONAL,
[AC_SUBST($1_TRUE)
AC_SUBST($1_FALSE)
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi])


# serial 40 AC_PROG_LIBTOOL
AC_DEFUN(AC_PROG_LIBTOOL,
[AC_REQUIRE([AC_LIBTOOL_SETUP])dnl

# Save cache, so that ltconfig can load it
AC_CACHE_SAVE

# Actually configure libtool.  ac_aux_dir is where install-sh is found.
CC="$CC" CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" \
LD="$LD" LDFLAGS="$LDFLAGS" LIBS="$LIBS" \
LN_S="$LN_S" NM="$NM" RANLIB="$RANLIB" \
DLLTOOL="$DLLTOOL" AS="$AS" OBJDUMP="$OBJDUMP" \
${CONFIG_SHELL-/bin/sh} $ac_aux_dir/ltconfig --no-reexec \
$libtool_flags --no-verify $ac_aux_dir/ltmain.sh $host \
|| AC_MSG_ERROR([libtool configure failed])

# Reload cache, that may have been modified by ltconfig
AC_CACHE_LOAD

# This can be used to rebuild libtool when needed
LIBTOOL_DEPS="$ac_aux_dir/ltconfig $ac_aux_dir/ltmain.sh"

# Always use our own libtool.
LIBTOOL='$(SHELL) $(top_builddir)/libtool'
AC_SUBST(LIBTOOL)dnl

# Redirect the config.log output again, so that the ltconfig log is not
# clobbered by the next message.
exec 5>>./config.log
])

AC_DEFUN(AC_LIBTOOL_SETUP,
[AC_PREREQ(2.13)dnl
AC_REQUIRE([AC_ENABLE_SHARED])dnl
AC_REQUIRE([AC_ENABLE_STATIC])dnl
AC_REQUIRE([AC_ENABLE_FAST_INSTALL])dnl
AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_CANONICAL_BUILD])dnl
AC_REQUIRE([AC_PROG_RANLIB])dnl
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AC_PROG_LD])dnl
AC_REQUIRE([AC_PROG_NM])dnl
AC_REQUIRE([AC_PROG_LN_S])dnl
dnl

# Check for any special flags to pass to ltconfig.
libtool_flags="--cache-file=$cache_file"
test "$enable_shared" = no && libtool_flags="$libtool_flags --disable-shared"
test "$enable_static" = no && libtool_flags="$libtool_flags --disable-static"
test "$enable_fast_install" = no && libtool_flags="$libtool_flags --disable-fast-install"
test "$ac_cv_prog_gcc" = yes && libtool_flags="$libtool_flags --with-gcc"
test "$ac_cv_prog_gnu_ld" = yes && libtool_flags="$libtool_flags --with-gnu-ld"
ifdef([AC_PROVIDE_AC_LIBTOOL_DLOPEN],
[libtool_flags="$libtool_flags --enable-dlopen"])
ifdef([AC_PROVIDE_AC_LIBTOOL_WIN32_DLL],
[libtool_flags="$libtool_flags --enable-win32-dll"])
AC_ARG_ENABLE(libtool-lock,
  [  --disable-libtool-lock  avoid locking (might break parallel builds)])
test "x$enable_libtool_lock" = xno && libtool_flags="$libtool_flags --disable-lock"
test x"$silent" = xyes && libtool_flags="$libtool_flags --silent"

# Some flags need to be propagated to the compiler or linker for good
# libtool support.
case "$host" in
*-*-irix6*)
  # Find out which ABI we are using.
  echo '[#]line __oline__ "configure"' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    case "`/usr/bin/file conftest.o`" in
    *32-bit*)
      LD="${LD-ld} -32"
      ;;
    *N32*)
      LD="${LD-ld} -n32"
      ;;
    *64-bit*)
      LD="${LD-ld} -64"
      ;;
    esac
  fi
  rm -rf conftest*
  ;;

*-*-sco3.2v5*)
  # On SCO OpenServer 5, we need -belf to get full-featured binaries.
  SAVE_CFLAGS="$CFLAGS"
  CFLAGS="$CFLAGS -belf"
  AC_CACHE_CHECK([whether the C compiler needs -belf], lt_cv_cc_needs_belf,
    [AC_TRY_LINK([],[],[lt_cv_cc_needs_belf=yes],[lt_cv_cc_needs_belf=no])])
  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
    CFLAGS="$SAVE_CFLAGS"
  fi
  ;;

ifdef([AC_PROVIDE_AC_LIBTOOL_WIN32_DLL],
[*-*-cygwin* | *-*-mingw*)
  AC_CHECK_TOOL(DLLTOOL, dlltool, false)
  AC_CHECK_TOOL(AS, as, false)
  AC_CHECK_TOOL(OBJDUMP, objdump, false)
  ;;
])
esac
])

# AC_LIBTOOL_DLOPEN - enable checks for dlopen support
AC_DEFUN(AC_LIBTOOL_DLOPEN, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])])

# AC_LIBTOOL_WIN32_DLL - declare package support for building win32 dll's
AC_DEFUN(AC_LIBTOOL_WIN32_DLL, [AC_BEFORE([$0], [AC_LIBTOOL_SETUP])])

# AC_ENABLE_SHARED - implement the --enable-shared flag
# Usage: AC_ENABLE_SHARED[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AC_ENABLE_SHARED, [dnl
define([AC_ENABLE_SHARED_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(shared,
changequote(<<, >>)dnl
<<  --enable-shared[=PKGS]  build shared libraries [default=>>AC_ENABLE_SHARED_DEFAULT],
changequote([, ])dnl
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_shared=yes ;;
no) enable_shared=no ;;
*)
  enable_shared=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_shared=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_shared=AC_ENABLE_SHARED_DEFAULT)dnl
])

# AC_DISABLE_SHARED - set the default shared flag to --disable-shared
AC_DEFUN(AC_DISABLE_SHARED, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
AC_ENABLE_SHARED(no)])

# AC_ENABLE_STATIC - implement the --enable-static flag
# Usage: AC_ENABLE_STATIC[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AC_ENABLE_STATIC, [dnl
define([AC_ENABLE_STATIC_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(static,
changequote(<<, >>)dnl
<<  --enable-static[=PKGS]  build static libraries [default=>>AC_ENABLE_STATIC_DEFAULT],
changequote([, ])dnl
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_static=yes ;;
no) enable_static=no ;;
*)
  enable_static=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_static=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_static=AC_ENABLE_STATIC_DEFAULT)dnl
])

# AC_DISABLE_STATIC - set the default static flag to --disable-static
AC_DEFUN(AC_DISABLE_STATIC, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
AC_ENABLE_STATIC(no)])


# AC_ENABLE_FAST_INSTALL - implement the --enable-fast-install flag
# Usage: AC_ENABLE_FAST_INSTALL[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AC_ENABLE_FAST_INSTALL, [dnl
define([AC_ENABLE_FAST_INSTALL_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(fast-install,
changequote(<<, >>)dnl
<<  --enable-fast-install[=PKGS]  optimize for fast installation [default=>>AC_ENABLE_FAST_INSTALL_DEFAULT],
changequote([, ])dnl
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_fast_install=yes ;;
no) enable_fast_install=no ;;
*)
  enable_fast_install=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_fast_install=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_fast_install=AC_ENABLE_FAST_INSTALL_DEFAULT)dnl
])

# AC_ENABLE_FAST_INSTALL - set the default to --disable-fast-install
AC_DEFUN(AC_DISABLE_FAST_INSTALL, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
AC_ENABLE_FAST_INSTALL(no)])

# AC_PROG_LD - find the path to the GNU or non-GNU linker
AC_DEFUN(AC_PROG_LD,
[AC_ARG_WITH(gnu-ld,
[  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]],
test "$withval" = no || with_gnu_ld=yes, with_gnu_ld=no)
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_CANONICAL_BUILD])dnl
ac_prog=ld
if test "$ac_cv_prog_gcc" = yes; then
  # Check if gcc -print-prog-name=ld gives a path.
  AC_MSG_CHECKING([for ld used by GCC])
  ac_prog=`($CC -print-prog-name=ld) 2>&5`
  case "$ac_prog" in
    # Accept absolute paths.
changequote(,)dnl
    [\\/]* | [A-Za-z]:[\\/]*)
      re_direlt='/[^/][^/]*/\.\./'
changequote([,])dnl
      # Canonicalize the path of ld
      ac_prog=`echo $ac_prog| sed 's%\\\\%/%g'`
      while echo $ac_prog | grep "$re_direlt" > /dev/null 2>&1; do
	ac_prog=`echo $ac_prog| sed "s%$re_direlt%/%"`
      done
      test -z "$LD" && LD="$ac_prog"
      ;;
  "")
    # If it fails, then pretend we aren't using GCC.
    ac_prog=ld
    ;;
  *)
    # If it is relative, then search for the first ld in PATH.
    with_gnu_ld=unknown
    ;;
  esac
elif test "$with_gnu_ld" = yes; then
  AC_MSG_CHECKING([for GNU ld])
else
  AC_MSG_CHECKING([for non-GNU ld])
fi
AC_CACHE_VAL(ac_cv_path_LD,
[if test -z "$LD"; then
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
  for ac_dir in $PATH; do
    test -z "$ac_dir" && ac_dir=.
    if test -f "$ac_dir/$ac_prog" || test -f "$ac_dir/$ac_prog$ac_exeext"; then
      ac_cv_path_LD="$ac_dir/$ac_prog"
      # Check to see if the program is GNU ld.  I'd rather use --version,
      # but apparently some GNU ld's only accept -v.
      # Break only if it was the GNU/non-GNU ld that we prefer.
      if "$ac_cv_path_LD" -v 2>&1 < /dev/null | egrep '(GNU|with BFD)' > /dev/null; then
	test "$with_gnu_ld" != no && break
      else
	test "$with_gnu_ld" != yes && break
      fi
    fi
  done
  IFS="$ac_save_ifs"
else
  ac_cv_path_LD="$LD" # Let the user override the test with a path.
fi])
LD="$ac_cv_path_LD"
if test -n "$LD"; then
  AC_MSG_RESULT($LD)
else
  AC_MSG_RESULT(no)
fi
test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
AC_PROG_LD_GNU
])

AC_DEFUN(AC_PROG_LD_GNU,
[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], ac_cv_prog_gnu_ld,
[# I'd rather use --version here, but apparently some GNU ld's only accept -v.
if $LD -v 2>&1 </dev/null | egrep '(GNU|with BFD)' 1>&5; then
  ac_cv_prog_gnu_ld=yes
else
  ac_cv_prog_gnu_ld=no
fi])
])

# AC_PROG_NM - find the path to a BSD-compatible name lister
AC_DEFUN(AC_PROG_NM,
[AC_MSG_CHECKING([for BSD-compatible nm])
AC_CACHE_VAL(ac_cv_path_NM,
[if test -n "$NM"; then
  # Let the user override the test.
  ac_cv_path_NM="$NM"
else
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
  for ac_dir in $PATH /usr/ccs/bin /usr/ucb /bin; do
    test -z "$ac_dir" && ac_dir=.
    if test -f $ac_dir/nm || test -f $ac_dir/nm$ac_exeext ; then
      # Check to see if the nm accepts a BSD-compat flag.
      # Adding the `sed 1q' prevents false positives on HP-UX, which says:
      #   nm: unknown option "B" ignored
      if ($ac_dir/nm -B /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
	ac_cv_path_NM="$ac_dir/nm -B"
	break
      elif ($ac_dir/nm -p /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
	ac_cv_path_NM="$ac_dir/nm -p"
	break
      else
	ac_cv_path_NM=${ac_cv_path_NM="$ac_dir/nm"} # keep the first match, but
	continue # so that we can try to find one that supports BSD flags
      fi
    fi
  done
  IFS="$ac_save_ifs"
  test -z "$ac_cv_path_NM" && ac_cv_path_NM=nm
fi])
NM="$ac_cv_path_NM"
AC_MSG_RESULT([$NM])
])

# AC_CHECK_LIBM - check for math library
AC_DEFUN(AC_CHECK_LIBM,
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
LIBM=
case "$host" in
*-*-beos* | *-*-cygwin*)
  # These system don't have libm
  ;;
*-ncr-sysv4.3*)
  AC_CHECK_LIB(mw, _mwvalidcheckl, LIBM="-lmw")
  AC_CHECK_LIB(m, main, LIBM="$LIBM -lm")
  ;;
*)
  AC_CHECK_LIB(m, main, LIBM="-lm")
  ;;
esac
])

# AC_LIBLTDL_CONVENIENCE[(dir)] - sets LIBLTDL to the link flags for
# the libltdl convenience library, adds --enable-ltdl-convenience to
# the configure arguments.  Note that LIBLTDL is not AC_SUBSTed, nor
# is AC_CONFIG_SUBDIRS called.  If DIR is not provided, it is assumed
# to be `${top_builddir}/libltdl'.  Make sure you start DIR with
# '${top_builddir}/' (note the single quotes!) if your package is not
# flat, and, if you're not using automake, define top_builddir as
# appropriate in the Makefiles.
AC_DEFUN(AC_LIBLTDL_CONVENIENCE, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
  case "$enable_ltdl_convenience" in
  no) AC_MSG_ERROR([this package needs a convenience libltdl]) ;;
  "") enable_ltdl_convenience=yes
      ac_configure_args="$ac_configure_args --enable-ltdl-convenience" ;;
  esac
  LIBLTDL=ifelse($#,1,$1,['${top_builddir}/libltdl'])/libltdlc.la
  INCLTDL=ifelse($#,1,-I$1,['-I${top_builddir}/libltdl'])
])

# AC_LIBLTDL_INSTALLABLE[(dir)] - sets LIBLTDL to the link flags for
# the libltdl installable library, and adds --enable-ltdl-install to
# the configure arguments.  Note that LIBLTDL is not AC_SUBSTed, nor
# is AC_CONFIG_SUBDIRS called.  If DIR is not provided, it is assumed
# to be `${top_builddir}/libltdl'.  Make sure you start DIR with
# '${top_builddir}/' (note the single quotes!) if your package is not
# flat, and, if you're not using automake, define top_builddir as
# appropriate in the Makefiles.
# In the future, this macro may have to be called after AC_PROG_LIBTOOL.
AC_DEFUN(AC_LIBLTDL_INSTALLABLE, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
  AC_CHECK_LIB(ltdl, main,
  [test x"$enable_ltdl_install" != xyes && enable_ltdl_install=no],
  [if test x"$enable_ltdl_install" = xno; then
     AC_MSG_WARN([libltdl not installed, but installation disabled])
   else
     enable_ltdl_install=yes
   fi
  ])
  if test x"$enable_ltdl_install" = x"yes"; then
    ac_configure_args="$ac_configure_args --enable-ltdl-install"
    LIBLTDL=ifelse($#,1,$1,['${top_builddir}/libltdl'])/libltdl.la
    INCLTDL=ifelse($#,1,-I$1,['-I${top_builddir}/libltdl'])
  else
    ac_configure_args="$ac_configure_args --enable-ltdl-install=no"
    LIBLTDL="-lltdl"
    INCLTDL=
  fi
])

dnl old names
AC_DEFUN(AM_PROG_LIBTOOL, [indir([AC_PROG_LIBTOOL])])dnl
AC_DEFUN(AM_ENABLE_SHARED, [indir([AC_ENABLE_SHARED], $@)])dnl
AC_DEFUN(AM_ENABLE_STATIC, [indir([AC_ENABLE_STATIC], $@)])dnl
AC_DEFUN(AM_DISABLE_SHARED, [indir([AC_DISABLE_SHARED], $@)])dnl
AC_DEFUN(AM_DISABLE_STATIC, [indir([AC_DISABLE_STATIC], $@)])dnl
AC_DEFUN(AM_PROG_LD, [indir([AC_PROG_LD])])dnl
AC_DEFUN(AM_PROG_NM, [indir([AC_PROG_NM])])dnl

dnl This is just to silence aclocal about the macro not being used
ifelse([AC_DISABLE_FAST_INSTALL])dnl

# Like AC_CONFIG_HEADER, but automatically create stamp file.

AC_DEFUN(AM_CONFIG_HEADER,
[AC_PREREQ([2.12])
AC_CONFIG_HEADER([$1])
dnl When config.status generates a header, we must update the stamp-h file.
dnl This file resides in the same directory as the config header
dnl that is generated.  We must strip everything past the first ":",
dnl and everything past the last "/".
AC_OUTPUT_COMMANDS(changequote(<<,>>)dnl
ifelse(patsubst(<<$1>>, <<[^ ]>>, <<>>), <<>>,
<<test -z "<<$>>CONFIG_HEADERS" || echo timestamp > patsubst(<<$1>>, <<^\([^:]*/\)?.*>>, <<\1>>)stamp-h<<>>dnl>>,
<<am_indx=1
for am_file in <<$1>>; do
  case " <<$>>CONFIG_HEADERS " in
  *" <<$>>am_file "*<<)>>
    echo timestamp > `echo <<$>>am_file | sed -e 's%:.*%%' -e 's%[^/]*$%%'`stamp-h$am_indx
    ;;
  esac
  am_indx=`expr "<<$>>am_indx" + 1`
done<<>>dnl>>)
changequote([,]))])

