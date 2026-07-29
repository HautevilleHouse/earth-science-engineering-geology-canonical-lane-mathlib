import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure GroundwaterFlowPackage where
  aquiferGeometry : Type u
  hydraulicConductivity : Type v
  darcyVelocity : Prop
  porosityDistribution : Prop
  rechargeRate : Prop
  contaminantTransport : Prop
  wellYield : Prop

structure GroundwaterFlowEvidence (G : GroundwaterFlowPackage) where
  darcyVelocityClosed : G.darcyVelocity
  porosityDistributionClosed : G.porosityDistribution
  rechargeRateClosed : G.rechargeRate
  contaminantTransportClosed : G.contaminantTransport
  wellYieldClosed : G.wellYield

def GroundwaterFlowClosed (G : GroundwaterFlowPackage) : Prop :=
  G.darcyVelocity ∧ G.porosityDistribution ∧ G.rechargeRate ∧ G.contaminantTransport ∧ G.wellYield

theorem groundwater_flow_closed_from_evidence (G : GroundwaterFlowPackage) (E : GroundwaterFlowEvidence G) :
    GroundwaterFlowClosed G := by
  exact And.intro E.darcyVelocityClosed
    (And.intro E.porosityDistributionClosed
      (And.intro E.rechargeRateClosed
        (And.intro E.contaminantTransportClosed E.wellYieldClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse