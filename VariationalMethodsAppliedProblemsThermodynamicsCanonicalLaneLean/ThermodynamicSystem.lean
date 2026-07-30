import VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ThermodynamicSystem where
  stateSpace : Type
  energy : stateSpace → ℝ
  entropy : stateSpace → ℝ
  temperature : stateSpace → ℝ
  pressure : stateSpace → ℝ
  equilibriumCondition : Prop
  equilibriumConditionClosed : equilibriumCondition

structure ThermodynamicEvidence (S : ThermodynamicSystem) where
  energyDefined : S.energy ≠ ∅
  entropyDefined : S.entropy ≠ ∅
  temperaturePositive : ∀ s : S.stateSpace, S.temperature s > 0
  equilibriumReached : S.equilibriumCondition

def ThermodynamicSystemClosed (S : ThermodynamicSystem) : Prop :=
  S.equilibriumCondition ∧ (∀ s : S.stateSpace, S.temperature s > 0)

theorem thermodynamic_system_closed_from_evidence (S : ThermodynamicSystem) (E : ThermodynamicEvidence S) :
    ThermodynamicSystemClosed S := by
  exact And.intro E.equilibriumReached E.temperaturePositive

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse