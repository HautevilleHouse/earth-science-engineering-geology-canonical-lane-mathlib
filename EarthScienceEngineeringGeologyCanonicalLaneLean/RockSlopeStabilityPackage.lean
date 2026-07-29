import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure RockSlopeStabilityPackage where
  slopeGeometry : Type u
  discontinuitySets : Type v
  intactRockStrength : Prop
  jointShearStrength : Prop
  groundwaterPressure : Prop
  seismicAcceleration : Prop
  factorOfSafety : Prop

structure RockSlopeStabilityEvidence (R : RockSlopeStabilityPackage) where
  intactRockStrengthClosed : R.intactRockStrength
  jointShearStrengthClosed : R.jointShearStrength
  groundwaterPressureClosed : R.groundwaterPressure
  seismicAccelerationClosed : R.seismicAcceleration
  factorOfSafetyClosed : R.factorOfSafety

def RockSlopeStabilityClosed (R : RockSlopeStabilityPackage) : Prop :=
  R.intactRockStrength ∧ R.jointShearStrength ∧ R.groundwaterPressure ∧ R.seismicAcceleration ∧ R.factorOfSafety

theorem rock_slope_stability_closed_from_evidence (R : RockSlopeStabilityPackage) (E : RockSlopeStabilityEvidence R) :
    RockSlopeStabilityClosed R := by
  exact And.intro E.intactRockStrengthClosed
    (And.intro E.jointShearStrengthClosed
      (And.intro E.groundwaterPressureClosed
        (And.intro E.seismicAccelerationClosed E.factorOfSafetyClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse