import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ThermodynamicLimitPackage where
  particleNumber : ℕ
  volume : ℝ
  freeEnergyDensity : ℝ → ℝ
  limitExists : Prop
  freeEnergyDensityConvex : Prop
  pressureDefined : Prop
  limitExistsClosed : limitExists
  freeEnergyDensityConvexClosed : freeEnergyDensityConvex
  pressureDefinedClosed : pressureDefined

structure ThermodynamicLimitEvidence (T : ThermodynamicLimitPackage) where
  limitExistsClosedClosed : T.limitExistsClosed
  freeEnergyDensityConvexClosedClosed : T.freeEnergyDensityConvexClosed
  pressureDefinedClosedClosed : T.pressureDefinedClosed

def ThermodynamicLimitClosed (T : ThermodynamicLimitPackage) : Prop :=
  T.limitExistsClosed ∧ T.freeEnergyDensityConvexClosed ∧ T.pressureDefinedClosed

theorem thermodynamic_limit_closed_from_evidence (T : ThermodynamicLimitPackage) (E : ThermodynamicLimitEvidence T) : ThermodynamicLimitClosed T := by
  exact And.intro E.limitExistsClosedClosed (And.intro E.freeEnergyDensityConvexClosedClosed E.pressureDefinedClosedClosed)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse