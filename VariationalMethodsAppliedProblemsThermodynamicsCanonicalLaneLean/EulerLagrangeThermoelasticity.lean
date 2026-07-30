import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure EulerLagrangeThermoelasticity {Ω : Type u} where
  referenceConfig : Ω
  deformation : Ω → ℝ³
  temperature : Ω → ℝ
  lagrangian : Ω → ℝ
  actionFunctional : ℝ
  eulerLagrangeEquations : Prop
  stateAdmissible : Prop

structure EulerLagrangeEvidence (E : EulerLagrangeThermoelasticity) where
  eulerLagrangeValid : E.eulerLagrangeEquations
  stateAdmissibleClosed : E.stateAdmissible

def EulerLagrangeThermoelasticityClosed (E : EulerLagrangeThermoelasticity) : Prop :=
  E.eulerLagrangeEquations ∧ E.stateAdmissible

theorem euler_lagrange_thermoelasticity_closed_from_evidence
    (E : EulerLagrangeThermoelasticity) (Ev : EulerLagrangeEvidence E) :
    EulerLagrangeThermoelasticityClosed E := by
  exact And.intro Ev.eulerLagrangeValid Ev.stateAdmissibleClosed

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse