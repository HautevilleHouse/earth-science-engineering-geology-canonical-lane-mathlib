import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure SlopeStabilityModel where
  shearStrengthParameters : Prop
  slopeGeometryDefined : Prop
  groundwaterPressureModeled : Prop
  factorOfSafetyComputed : Prop
  failureMechanismIdentified : Prop

structure StabilityEvidence (S : SlopeStabilityModel) where
  shearStrengthParametersClosed : S.shearStrengthParameters
  slopeGeometryDefinedClosed : S.slopeGeometryDefined
  groundwaterPressureModeledClosed : S.groundwaterPressureModeled
  factorOfSafetyComputedClosed : S.factorOfSafetyComputed
  failureMechanismIdentifiedClosed : S.failureMechanismIdentified

def SlopeStabilityClosed (S : SlopeStabilityModel) : Prop :=
  S.shearStrengthParameters ∧ S.slopeGeometryDefined ∧
  S.groundwaterPressureModeled ∧ S.factorOfSafetyComputed ∧
  S.failureMechanismIdentified

theorem slope_stability_closed_from_evidence
    (S : SlopeStabilityModel) (Ev : StabilityEvidence S) :
    SlopeStabilityClosed S := by
  exact And.intro Ev.shearStrengthParametersClosed
    (And.intro Ev.slopeGeometryDefinedClosed
      (And.intro Ev.groundwaterPressureModeledClosed
        (And.intro Ev.factorOfSafetyComputedClosed Ev.failureMechanismIdentifiedClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse