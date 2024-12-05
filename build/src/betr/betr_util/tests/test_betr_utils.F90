! -*- mode: f90; -*-
module test_utils_module

  use pfunit_mod

  implicit none

contains

  !@test
  subroutine test_remove_filename_extension_simple()

    use betr_constants, only : betr_filename_length
    use betr_utils, only : remove_filename_extension

    implicit none

    character(len=betr_filename_length) :: filename
    character(len=betr_filename_length) :: basename
    character(len=betr_filename_length) :: expected

    filename = 'simple.txt'
    expected = 'simple'
    basename = remove_filename_extension(filename)
    
#line 26 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_util/tests/test_betr_utils.pfunit"
  call assertEqual(expected, basename, &
 & location=SourceLocation( &
 & 'test_betr_utils.pfunit', &
 & 26) )
  if (anyExceptions()) return
#line 27 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_util/tests/test_betr_utils.pfunit"

  end subroutine test_remove_filename_extension_simple

  !@test
  subroutine test_remove_filename_extension_none()

    use betr_constants, only : betr_filename_length
    use betr_utils, only : remove_filename_extension

    implicit none

    character(len=betr_filename_length) :: filename
    character(len=betr_filename_length) :: basename
    character(len=betr_filename_length) :: expected

    filename = 'simple_filename'
    expected = 'simple_filename'
    basename = remove_filename_extension(filename)
    
#line 46 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_util/tests/test_betr_utils.pfunit"
  call assertEqual(expected, basename, &
 & location=SourceLocation( &
 & 'test_betr_utils.pfunit', &
 & 46) )
  if (anyExceptions()) return
#line 47 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_util/tests/test_betr_utils.pfunit"

  end subroutine test_remove_filename_extension_none
  
  !@test
  subroutine test_remove_filename_extension_multi()

    use betr_constants, only : betr_filename_length
    use betr_utils, only : remove_filename_extension

    implicit none

    character(len=betr_filename_length) :: filename
    character(len=betr_filename_length) :: basename
    character(len=betr_filename_length) :: expected

    filename = 'simple.filename.txt'
    expected = 'simple.filename'
    basename = remove_filename_extension(filename)
    
#line 66 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_util/tests/test_betr_utils.pfunit"
  call assertEqual(expected, basename, &
 & location=SourceLocation( &
 & 'test_betr_utils.pfunit', &
 & 66) )
  if (anyExceptions()) return
#line 67 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_util/tests/test_betr_utils.pfunit"

  end subroutine test_remove_filename_extension_multi
  
end module test_utils_module

module Wraptest_utils_module
   use pFUnit_mod
   use test_utils_module
   implicit none
   private

contains


end module Wraptest_utils_module

function test_utils_module_suite() result(suite)
   use pFUnit_mod
   use test_utils_module
   use Wraptest_utils_module
   type (TestSuite) :: suite

   integer, allocatable :: npes(:)

   suite = newTestSuite('test_utils_module_suite')

   call suite%addTest(newTestMethod('test_remove_filename_extension_simple', test_remove_filename_extension_simple))

   call suite%addTest(newTestMethod('test_remove_filename_extension_none', test_remove_filename_extension_none))

   call suite%addTest(newTestMethod('test_remove_filename_extension_multi', test_remove_filename_extension_multi))


end function test_utils_module_suite

