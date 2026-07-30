import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure FreeEnergyMinimizationPackage where
  freeEnergyFunctional : Type u → Type v
  equilibriumState : Type w
  minimizerExists : Prop
  uniqueness : Prop
  stability : Prop

structure FreeEnergyMinimizationEvidence (F : FreeEnergyMinimizationPackage) where
  minimizerExistsClosed : F.minimizerExists
  uniquenessClosed : F.uniqueness
  stabilityClosed : F.stability

def FreeEnergyMinimizationClosed (F : FreeEnergyMinimizationPackage) : Prop :=
  F.minimizerExists ∧ F.uniqueness ∧ F.stability

theorem free_energy_minimization_closed_from_evidence (F : FreeEnergyMinimizationPackage) (Ev : FreeEnergyMinimizationEvidence F) : FreeEnergyMinimizationClosed F := by
  exact And.intro Ev.minimizerExistsClosed (And.intro Ev.uniquenessClosed Ev.stabilityClosed)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse