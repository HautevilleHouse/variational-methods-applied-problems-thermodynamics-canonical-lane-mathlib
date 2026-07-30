import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ThermodynamicLimitProcess where
  stateSpace : Type u
  transitionKernel : Type v
  invariantMeasure : Prop
  entropyProduction : Prop
  detailedBalance : Prop
  largeDeviationsRate : Prop

structure ThermodynamicLimitEvidence (P : ThermodynamicLimitProcess) where
  invariantMeasureClosed : P.invariantMeasure
  entropyProductionClosed : P.entropyProduction
  detailedBalanceClosed : P.detailedBalance
  largeDeviationsRateClosed : P.largeDeviationsRate

def ThermodynamicLimitClosed (P : ThermodynamicLimitProcess) : Prop :=
  P.invariantMeasure ∧ P.entropyProduction ∧ P.detailedBalance ∧ P.largeDeviationsRate

theorem thermodynamic_limit_closed_from_evidence (P : ThermodynamicLimitProcess)
    (Ev : ThermodynamicLimitEvidence P) : ThermodynamicLimitClosed P := by
  exact And.intro Ev.invariantMeasureClosed
    (And.intro Ev.entropyProductionClosed
      (And.intro Ev.detailedBalanceClosed Ev.largeDeviationsRateClosed))

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse