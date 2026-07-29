import canonicalLaneMathlib.AdmissibleClass
import EarthScienceEngineeringGeologyCanonicalLaneLean.BridgeLemmas
import EarthScienceEngineeringGeologyCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

def ConstrainedEarthScienceEngineeringGeologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_earth_science_engineering_geology_endgame (A : AdmissibleClass) :
    ConstrainedEarthScienceEngineeringGeologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse
