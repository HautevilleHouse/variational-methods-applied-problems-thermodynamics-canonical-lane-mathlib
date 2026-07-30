import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

structure HeatConductionPackage where
  temperatureField : Type u
  heatFlux : Type v
  thermalConductivity : Type w
  heatEquation : Prop
  boundaryConditions : Prop
  energyConservation : Prop
  heatEquationClosed : heatEquation
  boundaryConditionsClosed : boundaryConditions
  energyConservationClosed : energyConservation

structure HeatConductionEvidence (H : HeatConductionPackage) where
  heatEquationClosedClosed : H.heatEquationClosed
  boundaryConditionsClosedClosed : H.boundaryConditionsClosed
  energyConservationClosedClosed : H.energyConservationClosed

def HeatConductionClosed (H : HeatConductionPackage) : Prop :=
  H.heatEquationClosed ∧ H.boundaryConditionsClosed ∧ H.energyConservationClosed

theorem heat_conduction_closed_from_evidence (H : HeatConductionPackage) (E : HeatConductionEvidence H) : HeatConductionClosed H := by
  exact And.intro E.heatEquationClosedClosed (And.intro E.boundaryConditionsClosedClosed E.energyConservationClosedClosed)

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse