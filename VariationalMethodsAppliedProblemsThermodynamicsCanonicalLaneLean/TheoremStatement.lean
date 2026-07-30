import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamics

structure VariationalThermodynamicsAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  thermodynamicSystem : Prop
  variationalPrinciple : Prop
  entropyFunctional : Type
  freeEnergy : Type
  equilibriumState : Prop
  conclusion : equilibriumState

def VariationalThermodynamicsWitnessClosed (O : VariationalThermodynamicsAdmittedObject) : Prop :=
  O.equilibriumState

end VariationalMethodsAppliedProblemsThermodynamics
end HautevilleHouse
