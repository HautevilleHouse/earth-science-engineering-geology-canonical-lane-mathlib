import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure SeismicHazardPackage where
  sourceModel : Type u
  attenuationRelation : Type v
  hazardCurve : Prop
  probabilisticSeismicHazard : Prop
  siteResponse : Prop

structure SeismicHazardEvidence (S : SeismicHazardPackage) where
  hazardCurveClosed : S.hazardCurve
  probabilisticSeismicHazardClosed : S.probabilisticSeismicHazard
  siteResponseClosed : S.siteResponse

def SeismicHazardClosed (S : SeismicHazardPackage) : Prop :=
  S.hazardCurve ∧ S.probabilisticSeismicHazard ∧ S.siteResponse

theorem seismic_hazard_closed_from_evidence (S : SeismicHazardPackage)
    (E : SeismicHazardEvidence S) : SeismicHazardClosed S := by
  exact And.intro E.hazardCurveClosed
    (And.intro E.probabilisticSeismicHazardClosed E.siteResponseClosed)

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse