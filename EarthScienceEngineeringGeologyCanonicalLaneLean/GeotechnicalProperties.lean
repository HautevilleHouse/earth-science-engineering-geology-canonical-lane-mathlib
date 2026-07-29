import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure GeotechnicalPackage where
  soilBoreholeData : Prop
  shearStrengthProfile : Prop
  permeabilityMeasured : Prop
  consolidationTested : Prop
  bearingCapacityComputed : Prop

structure GeotechnicalEvidence (G : GeotechnicalPackage) where
  soilBoreholeDataClosed : G.soilBoreholeData
  shearStrengthProfileClosed : G.shearStrengthProfile
  permeabilityMeasuredClosed : G.permeabilityMeasured
  consolidationTestedClosed : G.consolidationTested
  bearingCapacityComputedClosed : G.bearingCapacityComputed

def GeotechnicalClosed (G : GeotechnicalPackage) : Prop :=
  G.soilBoreholeData ∧ G.shearStrengthProfile ∧
  G.permeabilityMeasured ∧ G.consolidationTested ∧ G.bearingCapacityComputed

theorem geotechnical_closed_from_evidence (G : GeotechnicalPackage)
    (E : GeotechnicalEvidence G) : GeotechnicalClosed G := by
  exact And.intro E.soilBoreholeDataClosed
    (And.intro E.shearStrengthProfileClosed
      (And.intro E.permeabilityMeasuredClosed
        (And.intro E.consolidationTestedClosed E.bearingCapacityComputedClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse