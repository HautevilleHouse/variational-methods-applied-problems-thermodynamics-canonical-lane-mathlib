import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure GibbsFreeEnergyMinimization {S : Type u} where
  stateSpace : S
  gibbsFreeEnergy : S → ℝ
  equilibriumCondition : S → Prop
  uniqueMinimizer : ∃ s₀ : S, ∀ s : S, gibbsFreeEnergy s₀ ≤ gibbsFreeEnergy s

structure GibbsMinimizationEvidence (G : GibbsFreeEnergyMinimization) where
  gibbsFreeEnergyContinuous : Continuous G.gibbsFreeEnergy
  stateSpaceCompact : IsCompact (Set.univ : Set G.stateSpace)
  equilibrium_from_minimizer : ∀ s : G.stateSpace, G.equilibriumCondition s ↔ G.gibbsFreeEnergy s = (Set.range G.gibbsFreeEnergy).min' (by
    apply Set.Nonempty.image; exact Set.univ_nonempty)

def GibbsMinimizationClosed (G : GibbsFreeEnergyMinimization) : Prop :=
  G.uniqueMinimizer ∧ Continuous G.gibbsFreeEnergy ∧ IsCompact (Set.univ : Set G.stateSpace)

theorem gibbs_minimization_closed_from_evidence (G : GibbsFreeEnergyMinimization)
    (E : GibbsMinimizationEvidence G) : GibbsMinimizationClosed G := by
  refine And.intro G.uniqueMinimizer (And.intro E.gibbsFreeEnergyContinuous E.stateSpaceCompact)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse