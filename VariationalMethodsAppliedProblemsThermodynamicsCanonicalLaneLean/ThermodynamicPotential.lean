import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure ThermodynamicPotentialPackage where
  freeEnergy : Type u
  entropy : Type v
  internalEnergy : Type w
  temperature : Type x
  freeEnergyDefined : Prop
  entropyDefined : Prop
  internalEnergyDefined : Prop
  temperaturePositive : Prop
  fundamentalRelation : freeEnergy → entropy → internalEnergy → temperature → Prop

structure ThermodynamicPotentialEvidence (T : ThermodynamicPotentialPackage) where
  freeEnergyDefinedClosed : T.freeEnergyDefined
  entropyDefinedClosed : T.entropyDefined
  internalEnergyDefinedClosed : T.internalEnergyDefined
  temperaturePositiveClosed : T.temperaturePositive
  fundamentalRelationClosed : ∀ f e i t, T.fundamentalRelation f e i t

def ThermodynamicPotentialClosed (T : ThermodynamicPotentialPackage) : Prop :=
  T.freeEnergyDefined ∧ T.entropyDefined ∧ T.internalEnergyDefined ∧ T.temperaturePositive ∧
  (∀ f e i t, T.fundamentalRelation f e i t)

theorem thermodynamic_potential_closed_from_evidence (T : ThermodynamicPotentialPackage) (E : ThermodynamicPotentialEvidence T) : ThermodynamicPotentialClosed T := by
  exact And.intro E.freeEnergyDefinedClosed (And.intro E.entropyDefinedClosed (And.intro E.internalEnergyDefinedClosed (And.intro E.temperaturePositiveClosed E.fundamentalRelationClosed)))

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse