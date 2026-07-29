import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure RockMassRatingPackage where
  ucs : Float
  rqd : Float
  jointSpacing : Float
  jointCondition : Float
  groundwater : Float
  adjustment : Float

def calculateRMR (R : RockMassRatingPackage) : Float :=
  R.ucs + R.rqd + R.jointSpacing + R.jointCondition + R.groundwater + R.adjustment

structure RockMassRatingEvidence (R : RockMassRatingPackage) where
  ucsClosed : 0.0 ≤ R.ucs ∧ R.ucs ≤ 15.0
  rqdClosed : 0.0 ≤ R.rqd ∧ R.rqd ≤ 20.0
  jointSpacingClosed : 0.0 ≤ R.jointSpacing ∧ R.jointSpacing ≤ 20.0
  jointConditionClosed : 0.0 ≤ R.jointCondition ∧ R.jointCondition ≤ 30.0
  groundwaterClosed : 0.0 ≤ R.groundwater ∧ R.groundwater ≤ 15.0
  adjustmentClosed : -5.0 ≤ R.adjustment ∧ R.adjustment ≤ 0.0

def RockMassRatingClosed (R : RockMassRatingPackage) : Prop :=
  0.0 ≤ R.ucs ∧ R.ucs ≤ 15.0 ∧
  0.0 ≤ R.rqd ∧ R.rqd ≤ 20.0 ∧
  0.0 ≤ R.jointSpacing ∧ R.jointSpacing ≤ 20.0 ∧
  0.0 ≤ R.jointCondition ∧ R.jointCondition ≤ 30.0 ∧
  0.0 ≤ R.groundwater ∧ R.groundwater ≤ 15.0 ∧
  -5.0 ≤ R.adjustment ∧ R.adjustment ≤ 0.0

theorem rock_mass_rating_closed_from_evidence
    (R : RockMassRatingPackage) (E : RockMassRatingEvidence R) :
    RockMassRatingClosed R := by
  exact And.intro E.ucsClosed
    (And.intro E.rqdClosed
      (And.intro E.jointSpacingClosed
        (And.intro E.jointConditionClosed
          (And.intro E.groundwaterClosed E.adjustmentClosed))))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse