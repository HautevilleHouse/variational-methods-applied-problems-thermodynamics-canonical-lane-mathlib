import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure PhaseTransitionPackage where
  orderParameter : Type u
  freeEnergyFunctional : Type v
  criticalTemperature : Type w
  symmetryBreaking : Prop
  gibbsPhenomenon : Prop
  latentHeat : Prop
  symmetryBreakingClosed : symmetryBreaking
  gibbsPhenomenonClosed : gibbsPhenomenon
  latentHeatClosed : latentHeat

structure PhaseTransitionEvidence (P : PhaseTransitionPackage) where
  symmetryBreakingClosedClosed : P.symmetryBreakingClosed
  gibbsPhenomenonClosedClosed : P.gibbsPhenomenonClosed
  latentHeatClosedClosed : P.latentHeatClosed

def PhaseTransitionClosed (P : PhaseTransitionPackage) : Prop :=
  P.symmetryBreakingClosed ∧ P.gibbsPhenomenonClosed ∧ P.latentHeatClosed

theorem phase_transition_closed_from_evidence (P : PhaseTransitionPackage) (E : PhaseTransitionEvidence P) : PhaseTransitionClosed P := by
  exact And.intro E.symmetryBreakingClosedClosed (And.intro E.gibbsPhenomenonClosedClosed E.latentHeatClosedClosed)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse