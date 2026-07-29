import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PoincareWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse