import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure EarthCrustDeformationModel where
  deformationRate : Prop
  stressField : Prop
  strainAccumulation : Prop
  faultSlipAdmissible : Prop
  crustalBlockModelDefined : Prop

structure DeformationEvidence (E : EarthCrustDeformationModel) where
  deformationRateClosed : E.deformationRate
  stressFieldClosed : E.stressField
  strainAccumulationClosed : E.strainAccumulation
  faultSlipAdmissibleClosed : E.faultSlipAdmissible
  crustalBlockModelDefinedClosed : E.crustalBlockModelDefined

def EarthCrustDeformationClosed (E : EarthCrustDeformationModel) : Prop :=
  E.deformationRate ∧ E.stressField ∧ E.strainAccumulation ∧
  E.faultSlipAdmissible ∧ E.crustalBlockModelDefined

theorem earth_crust_deformation_closed_from_evidence
    (E : EarthCrustDeformationModel) (Ev : DeformationEvidence E) :
    EarthCrustDeformationClosed E := by
  exact And.intro Ev.deformationRateClosed
    (And.intro Ev.stressFieldClosed
      (And.intro Ev.strainAccumulationClosed
        (And.intro Ev.faultSlipAdmissibleClosed Ev.crustalBlockModelDefinedClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse