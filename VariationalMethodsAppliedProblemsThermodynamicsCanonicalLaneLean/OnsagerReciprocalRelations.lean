import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure OnsagerReciprocalRelations (n : ℕ) where
  fluxes : ℝⁿ
  forces : ℝⁿ
  dissipationPotential : ℝ → ℝ
  onsagerMatrix : Matrix (Fin n) (Fin n) ℝ
  reciprocalCondition : ∀ i j, onsagerMatrix i j = onsagerMatrix j i
  positiveSemidefinite : ∀ v : ℝⁿ, 0 ≤ dotProduct v (onsagerMatrix • v)

structure OnsagerEvidence (O : OnsagerReciprocalRelations n) where
  reciprocityCheck : ∀ i j, O.onsagerMatrix i j = O.onsagerMatrix j i
  dissipationPositive : ∀ (x : ℝ), O.dissipationPotential x ≥ 0

def OnsagerClosed (O : OnsagerReciprocalRelations n) : Prop :=
  O.reciprocalCondition ∧ O.positiveSemidefinite ∧ (∀ (x : ℝ), O.dissipationPotential x ≥ 0)

theorem onsager_closed_from_evidence (O : OnsagerReciprocalRelations n) (E : OnsagerEvidence O) :
    OnsagerClosed O := by
  exact And.intro E.reciprocityCheck (And.intro O.positiveSemidefinite E.dissipationPositive)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse