import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure StratigraphyPackage where
  layerSequence : List String
  faciesBoundaries : Prop
  unconformitiesDetected : Prop
  biostratigraphyCorrelated : Prop
  chronostratigraphyCalibrated : Prop

structure StratigraphyEvidence (S : StratigraphyPackage) where
  faciesBoundariesClosed : S.faciesBoundaries
  unconformitiesDetectedClosed : S.unconformitiesDetected
  biostratigraphyCorrelatedClosed : S.biostratigraphyCorrelated
  chronostratigraphyCalibratedClosed : S.chronostratigraphyCalibrated

def StratigraphyClosed (S : StratigraphyPackage) : Prop :=
  S.faciesBoundaries ∧ S.unconformitiesDetected ∧
  S.biostratigraphyCorrelated ∧ S.chronostratigraphyCalibrated

theorem stratigraphy_closed_from_evidence (S : StratigraphyPackage)
    (E : StratigraphyEvidence S) : StratigraphyClosed S := by
  exact And.intro E.faciesBoundariesClosed
    (And.intro E.unconformitiesDetectedClosed
      (And.intro E.biostratigraphyCorrelatedClosed
        E.chronostratigraphyCalibratedClosed))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse