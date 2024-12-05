! -*- mode: f90; -*-
module test_betr_transport_module

  use pfunit_mod

  implicit none

contains

  !@test
  subroutine test_mass_curve_correct()

    use bshr_kind_mod, only : r8 => shr_kind_r8
    use TransportMod, only : mass_curve_correct_

    implicit none

#line 18 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
  call assertEqual(0.0_r8, mass_curve_correct_(1.234e-16_r8), &
 & location=SourceLocation( &
 & 'test_betr_transport.pfunit', &
 & 18) )
  if (anyExceptions()) return
#line 19 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
#line 19 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
  call assertEqual(0.0_r8, mass_curve_correct_(-1.234e-16_r8), &
 & location=SourceLocation( &
 & 'test_betr_transport.pfunit', &
 & 19) )
  if (anyExceptions()) return
#line 20 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
#line 20 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
  call assertEqual(2.34e-14_r8, mass_curve_correct_(2.34e-14_r8), &
 & location=SourceLocation( &
 & 'test_betr_transport.pfunit', &
 & 20) )
  if (anyExceptions()) return
#line 21 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
#line 21 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"
  call assertEqual(-2.34e-14_r8, mass_curve_correct_(-2.34e-14_r8), &
 & location=SourceLocation( &
 & 'test_betr_transport.pfunit', &
 & 21) )
  if (anyExceptions()) return
#line 22 "/global/homes/j/jingtao/ReSOM/sbetr/src/betr/betr_transport/tests/test_betr_transport.pfunit"

  end subroutine test_mass_curve_correct
end module test_betr_transport_module

module Wraptest_betr_transport_module
   use pFUnit_mod
   use test_betr_transport_module
   implicit none
   private

contains


end module Wraptest_betr_transport_module

function test_betr_transport_module_suite() result(suite)
   use pFUnit_mod
   use test_betr_transport_module
   use Wraptest_betr_transport_module
   type (TestSuite) :: suite

   integer, allocatable :: npes(:)

   suite = newTestSuite('test_betr_transport_module_suite')

   call suite%addTest(newTestMethod('test_mass_curve_correct', test_mass_curve_correct))


end function test_betr_transport_module_suite

