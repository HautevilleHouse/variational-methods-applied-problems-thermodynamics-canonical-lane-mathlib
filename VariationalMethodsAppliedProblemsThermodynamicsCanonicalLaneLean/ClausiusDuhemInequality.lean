import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ClausiusDuhemInequality {Ω : Type u} where
  body : Ω
  temperature : Ω → ℝ
  entropyProduction : Ω → ℝ
  heatFlux : Ω → ℝ
  inequalityStatement : ∀ x ∈ body, entropyProduction x ≥ 0

structure ClausiusDuhemEvidence (C : ClausiusDuhemInequality) where
  entropyProductionPositivity : ∀ x ∈ C.body, C.entropyProduction x ≥ 0
  heatFluxCompatibility : ∀ x ∈ C.body, C.heatFlux x = -C.temperature x * C.entropyProduction x

def ClausiusDuhemClosed (C : ClausiusDuhemInequality) : Prop :=
  C.inequalityStatement ∧ (∀ x ∈ C.body, C.heatFlux x = -C.temperature x * C.entropyProduction x)

theorem clausius_duhem_closed_from_evidence (C : ClausiusDuhemInequality)
    (E : ClausiusDuhemEvidence C) : ClausiusDuhemClosed C := by
  exact And.intro E.entropyProductionPositivity E.heatFluxCompatibility

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse