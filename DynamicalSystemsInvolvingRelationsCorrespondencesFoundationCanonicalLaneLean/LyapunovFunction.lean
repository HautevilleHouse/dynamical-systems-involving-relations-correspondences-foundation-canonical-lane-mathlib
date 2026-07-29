import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure LyapunovFunction where
  stateSpace : Type u
  function : stateSpace → ℝ
  nonnegative : ∀ x, function x ≥ 0
  decreasingAlongRelation : ∀ x y, relation x y → function y ≤ function x
  nonnegativeTerm : nonnegative
  decreasingTerm : decreasingAlongRelation

structure LyapunovFunctionEvidence (L : LyapunovFunction) where
  nonnegativeClosed : L.nonnegative
  decreasingClosed : L.decreasingAlongRelation

def LyapunovFunctionClosed (L : LyapunovFunction) : Prop :=
  L.nonnegative ∧ L.decreasingAlongRelation

theorem lyapunov_function_closed_from_evidence
    (L : LyapunovFunction) (E : LyapunovFunctionEvidence L) :
    LyapunovFunctionClosed L := by
  exact And.intro E.nonnegativeClosed E.decreasingClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse
