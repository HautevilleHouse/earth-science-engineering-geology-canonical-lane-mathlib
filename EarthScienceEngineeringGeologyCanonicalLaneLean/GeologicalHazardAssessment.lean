import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure HazardAssessmentPackage where
  slopeStabilityAnalysis : Prop
  liquefactionPotential : Prop
  subsidenceRisk : Prop
  seismicAmplification : Prop
  volcanicHazardZonation : Prop
  floodPlainMapping : Prop

structure HazardAssessmentEvidence (H : HazardAssessmentPackage) where
  slopeStabilityAnalysisClosed : H.slopeStabilityAnalysis
  liquefactionPotentialClosed : H.liquefactionPotential
  subsidenceRiskClosed : H.subsidenceRisk
  seismicAmplificationClosed : H.seismicAmplification
  volcanicHazardZonationClosed : H.volcanicHazardZonation
  floodPlainMappingClosed : H.floodPlainMapping

def HazardAssessmentClosed (H : HazardAssessmentPackage) : Prop :=
  H.slopeStabilityAnalysis ∧ H.liquefactionPotential ∧
  H.subsidenceRisk ∧ H.seismicAmplification ∧
  H.volcanicHazardZonation ∧ H.floodPlainMapping

theorem hazard_assessment_closed_from_evidence (H : HazardAssessmentPackage)
    (E : HazardAssessmentEvidence H) : HazardAssessmentClosed H := by
  exact And.intro E.slopeStabilityAnalysisClosed
    (And.intro E.liquefactionPotentialClosed
      (And.intro E.subsidenceRiskClosed
        (And.intro E.seismicAmplificationClosed
          (And.intro E.volcanicHazardZonationClosed
            E.floodPlainMappingClosed))))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse