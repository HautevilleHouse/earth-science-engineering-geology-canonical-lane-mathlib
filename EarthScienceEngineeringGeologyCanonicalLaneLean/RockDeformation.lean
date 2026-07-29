import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure RockDeformationPackage where
  stressTensor : Type u
  strainTensor : Type v
  constitutiveLaw : Prop
  yieldCriterion : Prop
  failureSurface : Prop

structure RockDeformationEvidence (R : RockDeformationPackage) where
  constitutiveLawClosed : R.constitutiveLaw
  yieldCriterionClosed : R.yieldCriterion
  failureSurfaceClosed : R.failureSurface

def RockDeformationClosed (R : RockDeformationPackage) : Prop :=
  R.constitutiveLaw ∧ R.yieldCriterion ∧ R.failureSurface

theorem rock_deformation_closed_from_evidence (R : RockDeformationPackage)
    (E : RockDeformationEvidence R) : RockDeformationClosed R := by
  exact And.intro E.constitutiveLawClosed
    (And.intro E.yieldCriterionClosed E.failureSurfaceClosed)

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse