import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceEngineeringGeologyCanonicalLaneLean

structure TunnelSupportPackage where
  rockMassClass : String
  overburden : Float
  tunnelDiameter : Float
  supportType : String
  supportCapacity : Float

def supportFactor (T : TunnelSupportPackage) : Float :=
  match T.rockMassClass with
  | "I" => 0.1
  | "II" => 0.2
  | "III" => 0.4
  | "IV" => 0.6
  | "V" => 0.8
  | _ => 1.0

structure TunnelSupportEvidence (T : TunnelSupportPackage) where
  rockMassClassValid : T.rockMassClass ∈ ["I","II","III","IV","V"]
  overburdenClosed : 0.0 < T.overburden
  tunnelDiameterClosed : 0.0 < T.tunnelDiameter
  supportTypeValid : T.supportType ∈ ["Shotcrete","RockBolt","SteelSet","ConcreteLining"]
  supportCapacityClosed : 0.0 < T.supportCapacity

def TunnelSupportClosed (T : TunnelSupportPackage) : Prop :=
  T.rockMassClass ∈ ["I","II","III","IV","V"] ∧
  0.0 < T.overburden ∧
  0.0 < T.tunnelDiameter ∧
  T.supportType ∈ ["Shotcrete","RockBolt","SteelSet","ConcreteLining"] ∧
  0.0 < T.supportCapacity

theorem tunnel_support_closed_from_evidence
    (T : TunnelSupportPackage) (E : TunnelSupportEvidence T) :
    TunnelSupportClosed T := by
  exact And.intro E.rockMassClassValid
    (And.intro E.overburdenClosed
      (And.intro E.tunnelDiameterClosed
        (And.intro E.supportTypeValid E.supportCapacityClosed)))

end EarthScienceEngineeringGeologyCanonicalLaneLean
end HautevilleHouse