import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondenceFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A with
  | ⟨_, h, _, _⟩ => h

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  match A with
  | ⟨_, h, _, _⟩ => exact h

end DynamicalSystemsInvolvingRelationsCorrespondenceFoundationCanonicalLaneLean
end HautevilleHouse