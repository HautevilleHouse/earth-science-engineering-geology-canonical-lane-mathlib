import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure SeismicPackage where
  reflectionProfiles : Prop
  velocityModel : Prop
  stackMigrated : Prop
  horizonPicked : Prop
  faultInterpretation : Prop

structure SeismicEvidence (S : SeismicPackage) where
  reflectionProfilesClosed : S.reflectionProfiles
  velocityModelClosed : S.velocityModel
  stackMigratedClosed : S.stackMigrated
  horizonPickedClosed : S.horizonPicked
  faultInterpretationClosed : S.faultInterpretation

def SeismicClosed (S : SeismicPackage) : Prop :=
  S.reflectionProfiles ∧ S.velocityModel ∧
  S.stackMigrated ∧ S.horizonPicked ∧ S.faultInterpretation

theorem seismic_closed_from_evidence (S : SeismicPackage)
    (E : SeismicEvidence S) : SeismicClosed S := by
  exact And.intro E.reflectionProfilesClosed
    (And.intro E.velocityModelClosed
      (And.intro E.stackMigratedClosed
        (And.intro E.horizonPickedClosed E.faultInterpretationClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse