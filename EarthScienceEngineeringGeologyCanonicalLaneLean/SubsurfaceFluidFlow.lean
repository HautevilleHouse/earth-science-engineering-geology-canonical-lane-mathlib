import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure SubsurfaceFluidFlowModel where
  darcyFluxModeled : Prop
  permeabilityTensorDefined : Prop
  hydraulicGradientKnown : Prop
  poroelasticCoupling : Prop
  massConservationSatisfied : Prop

structure FlowEvidence (F : SubsurfaceFluidFlowModel) where
  darcyFluxModeledClosed : F.darcyFluxModeled
  permeabilityTensorDefinedClosed : F.permeabilityTensorDefined
  hydraulicGradientKnownClosed : F.hydraulicGradientKnown
  poroelasticCouplingClosed : F.poroelasticCoupling
  massConservationSatisfiedClosed : F.massConservationSatisfied

def SubsurfaceFluidFlowClosed (F : SubsurfaceFluidFlowModel) : Prop :=
  F.darcyFluxModeled ∧ F.permeabilityTensorDefined ∧
  F.hydraulicGradientKnown ∧ F.poroelasticCoupling ∧
  F.massConservationSatisfied

theorem subsurface_fluid_flow_closed_from_evidence
    (F : SubsurfaceFluidFlowModel) (Ev : FlowEvidence F) :
    SubsurfaceFluidFlowClosed F := by
  exact And.intro Ev.darcyFluxModeledClosed
    (And.intro Ev.permeabilityTensorDefinedClosed
      (And.intro Ev.hydraulicGradientKnownClosed
        (And.intro Ev.poroelasticCouplingClosed Ev.massConservationSatisfiedClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse