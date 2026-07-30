import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure CaratheodoryAxiomatization (S : Type u) (T : Type v) where
  stateSpace : S
  temperature : T
  heat : S → S → ℝ
  work : S → S → ℝ
  adiabaticAccessibility : S → S → Prop
  caratheodoryAxiom : ∀ s ∈ stateSpace, ∃ U : Set S, s ∈ U ∧ IsOpen U ∧
    ∀ t ∈ U, adiabaticAccessibility s t → heat s t = 0

structure CaratheodoryEvidence (C : CaratheodoryAxiomatization S T) where
  heatWorkConservation : ∀ s t, C.heat s t + C.work s t = 0
  adiabaticImpliesNoHeat : ∀ s t, C.adiabaticAccessibility s t → C.heat s t = 0

def CaratheodoryClosed (C : CaratheodoryAxiomatization S T) : Prop :=
  C.caratheodoryAxiom ∧
  (∀ s t, C.heat s t + C.work s t = 0) ∧
  (∀ s t, C.adiabaticAccessibility s t → C.heat s t = 0)

theorem caratheodory_closed_from_evidence (C : CaratheodoryAxiomatization S T)
    (E : CaratheodoryEvidence C) : CaratheodoryClosed C := by
  exact And.intro C.caratheodoryAxiom (And.intro E.heatWorkConservation E.adiabaticImpliesNoHeat)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse