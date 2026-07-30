import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure BoltzmannEntropyPackage where
  entropyFunctional : Type u
  thermodynamicLimit : Prop
  microstateCounting : Prop
  entropyConvexity : Prop
  entropyConcave : Prop

structure BoltzmannEntropyEvidence (E : BoltzmannEntropyPackage) where
  thermodynamicLimitClosed : E.thermodynamicLimit
  microstateCountingClosed : E.microstateCounting
  entropyConvexityClosed : E.entropyConvexity
  entropyConcaveClosed : E.entropyConcave

def BoltzmannEntropyClosed (E : BoltzmannEntropyPackage) : Prop :=
  E.thermodynamicLimit ∧ E.microstateCounting ∧ E.entropyConvexity ∧ E.entropyConcave

theorem boltzmann_entropy_closed_from_evidence (E : BoltzmannEntropyPackage) (Ev : BoltzmannEntropyEvidence E) : BoltzmannEntropyClosed E := by
  exact And.intro Ev.thermodynamicLimitClosed (And.intro Ev.microstateCountingClosed (And.intro Ev.entropyConvexityClosed Ev.entropyConcaveClosed))

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse