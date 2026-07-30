import VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean.FreeEnergyFunctional

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure EntropyProductionPackage {G : RiemannianCurvaturePackage}
    (F : FreeEnergyFunctionalPackage G) where
  entropyProductionRate : Type u
  clausiusDuhemInequality : Prop
  secondLawVariational : Prop
  dissipationFunctional : Prop

structure EntropyProductionEvidence {G : RiemannianCurvaturePackage}
    {F : FreeEnergyFunctionalPackage G} (E : EntropyProductionPackage F) where
  clausiusDuhemInequalityClosed : E.clausiusDuhemInequality
  secondLawVariationalClosed : E.secondLawVariational
  dissipationFunctionalClosed : E.dissipationFunctional

def EntropyProductionClosed {G : RiemannianCurvaturePackage}
    {F : FreeEnergyFunctionalPackage G} (E : EntropyProductionPackage F) : Prop :=
  E.clausiusDuhemInequality ∧ E.secondLawVariational ∧ E.dissipationFunctional

theorem entropy_production_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : FreeEnergyFunctionalPackage G}
    (E : EntropyProductionPackage F) (Ev : EntropyProductionEvidence E) :
    EntropyProductionClosed E := by
  exact And.intro Ev.clausiusDuhemInequalityClosed
    (And.intro Ev.secondLawVariationalClosed Ev.dissipationFunctionalClosed)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse