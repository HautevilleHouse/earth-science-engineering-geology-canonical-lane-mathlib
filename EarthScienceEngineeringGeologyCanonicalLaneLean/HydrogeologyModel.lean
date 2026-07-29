import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure HydrogeologyPackage where
  aquiferGeometry : Prop
  hydraulicConductivity : Prop
  rechargeRateQuantified : Prop
  groundwaterFlowSimulated : Prop
  contaminantTransport : Prop

structure HydrogeologyEvidence (H : HydrogeologyPackage) where
  aquiferGeometryClosed : H.aquiferGeometry
  hydraulicConductivityClosed : H.hydraulicConductivity
  rechargeRateQuantifiedClosed : H.rechargeRateQuantified
  groundwaterFlowSimulatedClosed : H.groundwaterFlowSimulated
  contaminantTransportClosed : H.contaminantTransport

def HydrogeologyClosed (H : HydrogeologyPackage) : Prop :=
  H.aquiferGeometry ∧ H.hydraulicConductivity ∧
  H.rechargeRateQuantified ∧ H.groundwaterFlowSimulated ∧
  H.contaminantTransport

theorem hydrogeology_closed_from_evidence (H : HydrogeologyPackage)
    (E : HydrogeologyEvidence H) : HydrogeologyClosed H := by
  exact And.intro E.aquiferGeometryClosed
    (And.intro E.hydraulicConductivityClosed
      (And.intro E.rechargeRateQuantifiedClosed
        (And.intro E.groundwaterFlowSimulatedClosed
          E.contaminantTransportClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse