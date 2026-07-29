import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure StratigraphicBoreholePackage where
  boreholeId : String
  location : String
  depthRange : Float × Float
  strataLog : List (String × Float × Float)  -- (lithology, depth top, depth base)
  coreRecovery : Float
  rqd : Float
  loggingCompleted : Prop

structure StratigraphicBoreholeEvidence (S : StratigraphicBoreholePackage) where
  depthRangeClosed : S.depthRange.1 ≤ S.depthRange.2
  coreRecoveryClosed : 0.0 ≤ S.coreRecovery ∧ S.coreRecovery ≤ 100.0
  rqdClosed : 0.0 ≤ S.rqd ∧ S.rqd ≤ 100.0
  loggingCompletedClosed : S.loggingCompleted

def StratigraphicBoreholeClosed (S : StratigraphicBoreholePackage) : Prop :=
  S.depthRange.1 ≤ S.depthRange.2 ∧
  0.0 ≤ S.coreRecovery ∧ S.coreRecovery ≤ 100.0 ∧
  0.0 ≤ S.rqd ∧ S.rqd ≤ 100.0 ∧
  S.loggingCompleted

theorem stratigraphic_borehole_closed_from_evidence
    (S : StratigraphicBoreholePackage) (E : StratigraphicBoreholeEvidence S) :
    StratigraphicBoreholeClosed S := by
  exact And.intro E.depthRangeClosed
    (And.intro E.coreRecoveryClosed (And.intro E.rqdClosed E.loggingCompletedClosed))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse