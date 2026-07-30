import VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure FreeEnergyFunctionalPackage (G : RiemannianCurvaturePackage) where
  freeEnergy : Type u
  helmholtzEnergy : Type v
  gibbsEnergy : Type w
  freeEnergyMinimization : Prop
  variationalDerivative : Prop
  thermodynamicConsistency : Prop

structure FreeEnergyFunctionalEvidence {G : RiemannianCurvaturePackage}
    (F : FreeEnergyFunctionalPackage G) where
  freeEnergyMinimizationClosed : F.freeEnergyMinimization
  variationalDerivativeClosed : F.variationalDerivative
  thermodynamicConsistencyClosed : F.thermodynamicConsistency

def FreeEnergyFunctionalClosed {G : RiemannianCurvaturePackage}
    (F : FreeEnergyFunctionalPackage G) : Prop :=
  F.freeEnergyMinimization ∧ F.variationalDerivative ∧ F.thermodynamicConsistency

theorem free_energy_functional_closed_from_evidence
    {G : RiemannianCurvaturePackage} (F : FreeEnergyFunctionalPackage G)
    (E : FreeEnergyFunctionalEvidence F) : FreeEnergyFunctionalClosed F := by
  exact And.intro E.freeEnergyMinimizationClosed
    (And.intro E.variationalDerivativeClosed E.thermodynamicConsistencyClosed)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse