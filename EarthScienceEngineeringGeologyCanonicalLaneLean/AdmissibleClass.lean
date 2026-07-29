import EarthScienceEngineeringGeologyCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure AdmissibleClass where
  object : GeologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GeologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse