module PlantMicKineticsMod

!
! DESCRIPTION
! compute depth-dependent kinetic parameters used for nutrient competition
  use shr_kind_mod           , only : r8 => shr_kind_r8
  use shr_infnan_mod         , only : nan => shr_infnan_nan, assignment(=)
  use decompMod              , only : bounds_type
  use clm_varpar             , only : nlevdecomp_full, nlevgrnd, nlevdecomp
  use clm_varcon             , only : spval
implicit none

  type, public :: PlantMicKinetics_type
    real(r8), pointer :: plant_nh4_vmax_vr_patch(:,:)
    real(r8), pointer :: plant_no3_vmax_vr_patch(:,:)
    real(r8), pointer :: plant_p_vmax_vr_patch(:,:)
    real(r8), pointer :: plant_nh4_km_vr_patch(:,:)
    real(r8), pointer :: plant_no3_km_vr_patch(:,:)
    real(r8), pointer :: plant_p_km_vr_patch(:,:)
    real(r8), pointer :: plant_eff_frootc_vr_patch(:,:)
    real(r8), pointer :: plant_eff_ncompet_b_vr_patch(:,:)
    real(r8), pointer :: plant_eff_pcompet_b_vr_patch(:,:)
    real(r8), pointer :: decomp_eff_ncompet_b_vr_col(:,:)
    real(r8), pointer :: decomp_eff_pcompet_b_vr_col(:,:)
    real(r8), pointer :: nit_eff_ncompet_b_vr_col(:,:)
    real(r8), pointer :: den_eff_ncompet_b_vr_col(:,:)
    real(r8), pointer :: minsurf_p_compet_vr_col(:,:)
    real(r8), pointer :: minsurf_nh4_compet_vr_col(:,:)
    real(r8), pointer :: vmax_minsurf_p_vr_col(:,:)
    real(r8), pointer :: km_minsurf_p_vr_col(:,:)
    real(r8), pointer :: km_minsurf_nh4_vr_col(:,:)
    real(r8), pointer :: minsurf_dom_compet_vr_col(:,:)
    real(r8), pointer :: km_minsurf_dom_vr_col(:,:)
    real(r8), pointer :: km_decomp_p_vr_col(:,:)
    real(r8), pointer :: km_decomp_nh4_vr_col(:,:)
    real(r8), pointer :: km_decomp_no3_vr_col(:,:)
    real(r8), pointer :: km_nit_nh4_vr_col(:,:)
    real(r8), pointer :: km_den_no3_vr_col(:,:)
    real(r8), pointer :: dsolutionp_dt_vr_col(:,:)
    real(r8), pointer :: dlabp_dt_vr_col(:,:)
  contains
    procedure, public  :: Init
    procedure, public  :: InitAllocate
    procedure, public  :: InitCold

  end type PlantMicKinetics_type
  !------------------------------------------------------------------------
  contains
    !------------------------------------------------------------------------
    subroutine Init(this, bounds)

     class(PlantMicKinetics_type) :: this
     type(bounds_type), intent(in) :: bounds

     call this%InitAllocate ( bounds)
     call this%InitCold (bounds )
    end subroutine Init
    !------------------------------------------------------------------------
    subroutine InitAllocate(this, bounds)

     class(PlantMicKinetics_type) :: this
     type(bounds_type), intent(in) :: bounds
     integer :: begp, endp, begc, endc

     begp = bounds%begp; endp=bounds%endp
     begc = bounds%begc; endc=bounds%endc
     allocate(this%plant_nh4_vmax_vr_patch(begp:endp, 1:nlevdecomp_full)); this%plant_nh4_vmax_vr_patch(:,:) = spval
     allocate(this%plant_no3_vmax_vr_patch(begp:endp, 1:nlevdecomp_full)); this%plant_no3_vmax_vr_patch(:,:) = spval
     allocate(this%plant_p_vmax_vr_patch(begp:endp, 1:nlevdecomp_full)); this%plant_p_vmax_vr_patch(:,:) = spval
     allocate(this%plant_eff_frootc_vr_patch(begp:endp,1:nlevdecomp_full)); this%plant_eff_frootc_vr_patch(:,:) = spval
     allocate(this%plant_no3_km_vr_patch(begp:endp, 1:nlevdecomp_full)); this%plant_no3_km_vr_patch(:,:) = spval
     allocate(this%plant_nh4_km_vr_patch(begp:endp, 1:nlevdecomp_full)); this%plant_nh4_km_vr_patch(:,:) = spval
     allocate(this%plant_p_km_vr_patch(begp:endp, 1:nlevdecomp_full)); this%plant_p_km_vr_patch(:,:) = spval

     allocate(this%plant_eff_ncompet_b_vr_patch(begp:endp,1:nlevdecomp_full)); this%plant_eff_ncompet_b_vr_patch(:,:)=nan
     allocate(this%plant_eff_pcompet_b_vr_patch(begp:endp,1:nlevdecomp_full)); this%plant_eff_pcompet_b_vr_patch(:,:)=nan
     allocate(this%minsurf_p_compet_vr_col(begc:endc,1:nlevdecomp_full)); this%minsurf_p_compet_vr_col(:,:) = spval
     allocate(this%minsurf_nh4_compet_vr_col(begc:endc, 1:nlevdecomp_full)); this%minsurf_nh4_compet_vr_col(:,:) = spval

     allocate(this%vmax_minsurf_p_vr_col(begc:endc, 1:nlevdecomp_full)); this%vmax_minsurf_p_vr_col(:,:) = spval
     allocate(this%km_minsurf_p_vr_col(begc:endc,1:nlevdecomp_full)); this%km_minsurf_p_vr_col(:,:) = 1._r8
     allocate(this%km_minsurf_nh4_vr_col(begc:endc,1:nlevdecomp_full)); this%km_minsurf_nh4_vr_col(:,:)=1._r8
     allocate(this%km_minsurf_dom_vr_col(begc:endc, 1:nlevdecomp_full)); this%km_minsurf_dom_vr_col(:,:) = 1._r8
     allocate(this%minsurf_dom_compet_vr_col(begc:endc, 1:nlevdecomp_full)); this%minsurf_dom_compet_vr_col(:,:) = 0._r8
     allocate(this%decomp_eff_ncompet_b_vr_col(begc:endc, 1:nlevdecomp_full));this%decomp_eff_ncompet_b_vr_col(:,:)=0._r8
     allocate(this%decomp_eff_pcompet_b_vr_col(begc:endc, 1:nlevdecomp_full)); this%decomp_eff_pcompet_b_vr_col(:,:)=0._r8
     allocate(this%nit_eff_ncompet_b_vr_col(begc:endc, 1:nlevdecomp_full)); this%nit_eff_ncompet_b_vr_col(:,:) = 0._r8
     allocate(this%den_eff_ncompet_b_vr_col(begc:endc, 1:nlevdecomp_full)); this%den_eff_ncompet_b_vr_col(:,:) = 0._r8
     allocate(this%dsolutionp_dt_vr_col(begc:endc,1:nlevdecomp_full)); this%dsolutionp_dt_vr_col(:,:) = 0._r8
     allocate(this%dlabp_dt_vr_col(begc:endc, 1:nlevdecomp_full)); this%dlabp_dt_vr_col(:,:) = 0._r8
    end subroutine InitAllocate
    !------------------------------------------------------------------------
    subroutine InitCold(this, bounds)

     class(PlantMicKinetics_type) :: this
     type(bounds_type), intent(in) :: bounds

    end subroutine InitCold

end module PlantMicKineticsMod
