import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ExponentialGibbsMeasurePackage where
  configurationSpace : Type u
  hamiltonian : configurationSpace → ℝ
  inverseTemperature : ℝ
  partitionFunction : ℝ
  gibbsMeasure : configurationSpace → ℝ
  partitionFunctionFinite : Prop
  gibbsMeasureNormalized : Prop
  partitionFunctionFiniteClosed : partitionFunctionFinite
  gibbsMeasureNormalizedClosed : gibbsMeasureNormalized

structure ExponentialGibbsMeasureEvidence (E : ExponentialGibbsMeasurePackage) where
  partitionFunctionFiniteClosedClosed : E.partitionFunctionFiniteClosed
  gibbsMeasureNormalizedClosedClosed : E.gibbsMeasureNormalizedClosed

def ExponentialGibbsMeasureClosed (E : ExponentialGibbsMeasurePackage) : Prop :=
  E.partitionFunctionFiniteClosed ∧ E.gibbsMeasureNormalizedClosed

theorem exponential_gibbs_measure_closed_from_evidence (E : ExponentialGibbsMeasurePackage) (Ev : ExponentialGibbsMeasureEvidence E) : ExponentialGibbsMeasureClosed E := by
  exact And.intro Ev.partitionFunctionFiniteClosedClosed Ev.gibbsMeasureNormalizedClosedClosed

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse