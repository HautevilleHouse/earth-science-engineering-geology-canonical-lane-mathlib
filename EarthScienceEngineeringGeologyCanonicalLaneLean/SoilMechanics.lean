import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure SoilMechanicsPackage where
  effectiveStress : Type u
  consolidation : Type v
  shearStrength : Prop
  compaction : Prop
  hydraulicConductivitySoil : Prop

structure SoilMechanicsEvidence (S : SoilMechanicsPackage) where
  shearStrengthClosed : S.shearStrength
  compactionClosed : S.compaction
  hydraulicConductivitySoilClosed : S.hydraulicConductivitySoil

def SoilMechanicsClosed (S : SoilMechanicsPackage) : Prop :=
  S.shearStrength ∧ S.compaction ∧ S.hydraulicConductivitySoil

theorem soil_mechanics_closed_from_evidence (S : SoilMechanicsPackage)
    (E : SoilMechanicsEvidence S) : SoilMechanicsClosed S := by
  exact And.intro E.shearStrengthClosed
    (And.intro E.compactionClosed E.hydraulicConductivitySoilClosed)

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse