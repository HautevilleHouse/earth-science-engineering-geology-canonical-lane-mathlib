import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure StratigraphyPackage where
  lithologyUnits : Type u
  depositionalSequences : Type v
  stratigraphicColumns : Type w
  sedimentComposition : Prop
  faciesArchitecture : Prop
  stratalGeometry : Prop
  stratigraphicCorrelation : Prop

structure StratigraphyEvidence (S : StratigraphyPackage) where
  sedimentCompositionClosed : S.sedimentComposition
  faciesArchitectureClosed : S.faciesArchitecture
  stratalGeometryClosed : S.stratalGeometry
  stratigraphicCorrelationClosed : S.stratigraphicCorrelation

def StratigraphyClosed (S : StratigraphyPackage) : Prop :=
  S.sedimentComposition ∧ S.faciesArchitecture ∧ S.stratalGeometry ∧ S.stratigraphicCorrelation

theorem stratigraphy_closed_from_evidence (S : StratigraphyPackage) (E : StratigraphyEvidence S) :
    StratigraphyClosed S := by
  exact And.intro E.sedimentCompositionClosed
    (And.intro E.faciesArchitectureClosed
      (And.intro E.stratalGeometryClosed E.stratigraphicCorrelationClosed))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse