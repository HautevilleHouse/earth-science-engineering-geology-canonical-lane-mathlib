import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure EarthquakeSourceModel where
  faultGeometryDefined : Prop
  recurrenceModel : Prop
  magnitudeFrequencyDistribution : Prop
  ruptureBehaviorModeled : Prop
  seismicHazardInput : Prop

structure EarthquakeEvidence (E : EarthquakeSourceModel) where
  faultGeometryDefinedClosed : E.faultGeometryDefined
  recurrenceModelClosed : E.recurrenceModel
  magnitudeFrequencyDistributionClosed : E.magnitudeFrequencyDistribution
  ruptureBehaviorModeledClosed : E.ruptureBehaviorModeled
  seismicHazardInputClosed : E.seismicHazardInput

def EarthquakeSourceClosed (E : EarthquakeSourceModel) : Prop :=
  E.faultGeometryDefined ∧ E.recurrenceModel ∧
  E.magnitudeFrequencyDistribution ∧ E.ruptureBehaviorModeled ∧
  E.seismicHazardInput

theorem earthquake_source_closed_from_evidence
    (E : EarthquakeSourceModel) (Ev : EarthquakeEvidence E) :
    EarthquakeSourceClosed E := by
  exact And.intro Ev.faultGeometryDefinedClosed
    (And.intro Ev.recurrenceModelClosed
      (And.intro Ev.magnitudeFrequencyDistributionClosed
        (And.intro Ev.ruptureBehaviorModeledClosed Ev.seismicHazardInputClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse