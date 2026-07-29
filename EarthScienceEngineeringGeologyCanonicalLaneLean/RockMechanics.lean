import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure RockMechanicsPackage where
  fractureToughness : Type u
  hoekBrownCriterion : Prop
  mohrCoulombCriterion : Prop
  deformationModulus : Prop
  anisotropyModel : Prop

structure RockMechanicsEvidence (R : RockMechanicsPackage) where
  hoekBrownCriterionClosed : R.hoekBrownCriterion
  mohrCoulombCriterionClosed : R.mohrCoulombCriterion
  deformationModulusClosed : R.deformationModulus
  anisotropyModelClosed : R.anisotropyModel

def RockMechanicsClosed (R : RockMechanicsPackage) : Prop :=
  R.hoekBrownCriterion ∧ R.mohrCoulombCriterion ∧ R.deformationModulus ∧ R.anisotropyModel

theorem rock_mechanics_closed_from_evidence (R : RockMechanicsPackage) (E : RockMechanicsEvidence R) :
    RockMechanicsClosed R := by
  exact And.intro E.hoekBrownCriterionClosed
    (And.intro E.mohrCoulombCriterionClosed
      (And.intro E.deformationModulusClosed E.anisotropyModelClosed))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse
