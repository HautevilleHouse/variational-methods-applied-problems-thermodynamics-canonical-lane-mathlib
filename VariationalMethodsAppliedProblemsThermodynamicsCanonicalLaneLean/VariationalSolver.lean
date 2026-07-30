import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure VariationalSolver where
  objectiveFunctional : Type u
  admissibleSet : Type v
  existenceOfMinimizer : Prop
  eulerLagrangeEquation : Prop
  noetherConservationLaw : Prop
  numericalConvergence : Prop

structure VariationalSolverEvidence (S : VariationalSolver) where
  existenceOfMinimizerClosed : S.existenceOfMinimizer
  eulerLagrangeEquationClosed : S.eulerLagrangeEquation
  noetherConservationLawClosed : S.noetherConservationLaw
  numericalConvergenceClosed : S.numericalConvergence

def VariationalSolverClosed (S : VariationalSolver) : Prop :=
  S.existenceOfMinimizer ∧ S.eulerLagrangeEquation ∧
  S.noetherConservationLaw ∧ S.numericalConvergence

theorem variational_solver_closed_from_evidence (S : VariationalSolver)
    (Ev : VariationalSolverEvidence S) : VariationalSolverClosed S := by
  exact And.intro Ev.existenceOfMinimizerClosed
    (And.intro Ev.eulerLagrangeEquationClosed
      (And.intro Ev.noetherConservationLawClosed Ev.numericalConvergenceClosed))

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse