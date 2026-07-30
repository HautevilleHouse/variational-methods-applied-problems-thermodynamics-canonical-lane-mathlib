import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure EnergyEntropyFunctional where
  freeEnergy : Prop
  thermodynamicPotential : Prop
  convexityCondition : Prop
  uniquenessOfMinimizer : Prop
  carnotEfficiencyBound : Prop

structure EnergyEntropyEvidence (E : EnergyEntropyFunctional) where
  freeEnergyClosed : E.freeEnergy
  thermodynamicPotentialClosed : E.thermodynamicPotential
  convexityConditionClosed : E.convexityCondition
  uniquenessOfMinimizerClosed : E.uniquenessOfMinimizer
  carnotEfficiencyBoundClosed : E.carnotEfficiencyBound

def EnergyEntropyClosed (E : EnergyEntropyFunctional) : Prop :=
  E.freeEnergy ∧ E.thermodynamicPotential ∧ E.convexityCondition ∧
  E.uniquenessOfMinimizer ∧ E.carnotEfficiencyBound

theorem energy_entropy_closed_from_evidence (E : EnergyEntropyFunctional)
    (Ev : EnergyEntropyEvidence E) : EnergyEntropyClosed E := by
  exact And.intro Ev.freeEnergyClosed
    (And.intro Ev.thermodynamicPotentialClosed
      (And.intro Ev.convexityConditionClosed
        (And.intro Ev.uniquenessOfMinimizerClosed
          Ev.carnotEfficiencyBoundClosed)))

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse