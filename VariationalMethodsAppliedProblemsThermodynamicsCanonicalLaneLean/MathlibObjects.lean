import VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ThermodynamicSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ThermodynamicAdmittedObject where
  space : ThermodynamicSpace
  closedSystem : Prop
  equilibriumState : Prop
  variationalPrinciple : Prop
  conclusion : variationalPrinciple

structure ThermodynamicEndgameState where
  object : ThermodynamicAdmittedObject

def ThermodynamicWitnessClosed (O : ThermodynamicAdmittedObject) : Prop :=
  O.variationalPrinciple

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse