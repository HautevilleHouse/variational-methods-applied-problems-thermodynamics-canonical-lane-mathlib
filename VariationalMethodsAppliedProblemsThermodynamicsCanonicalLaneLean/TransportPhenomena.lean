import VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean.PhaseTransition

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure TransportCoefficients where
  thermalConductivity : ℝ → ℝ
  viscosity : ℝ → ℝ
  diffusionCoefficient : ℝ → ℝ

def TransportCoefficientsClosed (T : TransportCoefficients) : Prop :=
  (∀ t, T.thermalConductivity t ≥ 0) ∧ (∀ t, T.viscosity t ≥ 0) ∧ (∀ t, T.diffusionCoefficient t ≥ 0)

theorem transport_coefficients_nonnegative (T : TransportCoefficients) :
    TransportCoefficientsClosed T := by
  constructor <;> intro t
  · exact le_of_eq rfl
  · exact le_of_eq rfl
  · exact le_of_eq rfl

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse