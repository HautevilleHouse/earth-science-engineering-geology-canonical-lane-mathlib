import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure GeothermalPackage where
  thermalGradientMeasured : Prop
  reservoirPermeability : Prop
  fluidChemistry : Prop
  resourceCapacityEstimated : Prop
  productionSimulation : Prop

structure GeothermalEvidence (G : GeothermalPackage) where
  thermalGradientMeasuredClosed : G.thermalGradientMeasured
  reservoirPermeabilityClosed : G.reservoirPermeability
  fluidChemistryClosed : G.fluidChemistry
  resourceCapacityEstimatedClosed : G.resourceCapacityEstimated
  productionSimulationClosed : G.productionSimulation

def GeothermalClosed (G : GeothermalPackage) : Prop :=
  G.thermalGradientMeasured ∧ G.reservoirPermeability ∧
  G.fluidChemistry ∧ G.resourceCapacityEstimated ∧ G.productionSimulation

theorem geothermal_closed_from_evidence (G : GeothermalPackage)
    (E : GeothermalEvidence G) : GeothermalClosed G := by
  exact And.intro E.thermalGradientMeasuredClosed
    (And.intro E.reservoirPermeabilityClosed
      (And.intro E.fluidChemistryClosed
        (And.intro E.resourceCapacityEstimatedClosed
          E.productionSimulationClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse