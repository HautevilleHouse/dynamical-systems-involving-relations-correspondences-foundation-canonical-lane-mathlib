import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

def bridgeClosed (A : DynamicalAdmissibleClass) : Prop :=
  DynamicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : DynamicalAdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse