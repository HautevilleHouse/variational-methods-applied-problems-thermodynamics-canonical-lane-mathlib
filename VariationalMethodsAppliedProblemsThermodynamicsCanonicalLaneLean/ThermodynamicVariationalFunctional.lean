import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ThermodynamicVariationalFunctional (S : Type u) (T : Type v) where
  stateSpace : S
  temperature : T
  internalEnergy : S → ℝ
  entropy : S → ℝ
  freeEnergy : S → ℝ
  variationalDerivative : S → ℝ

structure ThermodynamicVariationalEvidence {S T : Type u} (F : ThermodynamicVariationalFunctional S T) where
  internalEnergyDefined : F.internalEnergy = F.freeEnergy + (fun s => F.temperature * F.entropy s)
  entropyConcave : ∀ s t ∈ F.stateSpace, F.entropy (s + t) ≥ F.entropy s + F.entropy t
  variationalDerivativeAdmissible : ∀ s ∈ F.stateSpace, F.variationalDerivative s = 0

def ThermodynamicVariationalClosed {S T : Type u} (F : ThermodynamicVariationalFunctional S T) : Prop :=
  F.internalEnergy = F.freeEnergy + (fun s => F.temperature * F.entropy s) ∧
  (∀ s t ∈ F.stateSpace, F.entropy (s + t) ≥ F.entropy s + F.entropy t) ∧
  (∀ s ∈ F.stateSpace, F.variationalDerivative s = 0)

theorem thermodynamic_variational_closed_from_evidence {S T : Type u}
    (F : ThermodynamicVariationalFunctional S T) (E : ThermodynamicVariationalEvidence F) :
    ThermodynamicVariationalClosed F := by
  exact And.intro E.internalEnergyDefined (And.intro E.entropyConcave E.variationalDerivativeAdmissible)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse