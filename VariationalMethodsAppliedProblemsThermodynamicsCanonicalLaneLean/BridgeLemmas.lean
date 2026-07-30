import VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ThermodynamicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end VariationalMethodsAppliedProblemsThermodynamicsCanonicalLaneLean
end HautevilleHouse