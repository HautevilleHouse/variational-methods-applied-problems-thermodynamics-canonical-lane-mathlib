import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure GibbsMeasurePackage where
  stateSpace : Type u
  Hamiltonian : Type v
  inverseTemperature : ℝ
  partitionFunction : ℝ
  measureDefined : Prop
  variationalPrinciple : Prop

structure GibbsMeasureEvidence (G : GibbsMeasurePackage) where
  measureDefinedClosed : G.measureDefined
  variationalPrincipleClosed : G.variationalPrinciple

def GibbsMeasureClosed (G : GibbsMeasurePackage) : Prop :=
  G.measureDefined ∧ G.variationalPrinciple

theorem gibbs_measure_closed_from_evidence (G : GibbsMeasurePackage) (Ev : GibbsMeasureEvidence G) : GibbsMeasureClosed G := by
  exact And.intro Ev.measureDefinedClosed Ev.variationalPrincipleClosed

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse