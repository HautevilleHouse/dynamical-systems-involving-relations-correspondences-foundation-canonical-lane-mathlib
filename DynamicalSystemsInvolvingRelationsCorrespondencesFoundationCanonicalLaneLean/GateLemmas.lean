import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondenceFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  match A with
  | ⟨_, _, _, h⟩ => h

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  match A with
  | ⟨_, _, _, h⟩ => exact h

end DynamicalSystemsInvolvingRelationsCorrespondenceFoundationCanonicalLaneLean
end HautevilleHouse