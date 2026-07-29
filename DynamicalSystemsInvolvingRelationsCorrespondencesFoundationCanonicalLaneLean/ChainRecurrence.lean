import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.RelationCorrespondenceBase

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure ChainRecurrencePackage {R : RelationCorrespondencePackage} where
  epsilonAlphabet : ℕ → Prop
  chainingCondition : ∀ n : ℕ, epsilonAlphabet n → (∃ (x : R.stateSpace), True) → Prop
  chainRecurrentSet : Set R.stateSpace
  chainTransitive : Prop
  attractorDecomposition : Prop

structure ChainRecurrenceEvidence {R : RelationCorrespondencePackage}
    (C : ChainRecurrencePackage R) where
  chainTransitiveClosed : C.chainTransitive
  attractorDecompositionClosed : C.attractorDecomposition

def ChainRecurrenceClosed {R : RelationCorrespondencePackage}
    (C : ChainRecurrencePackage R) : Prop :=
  C.chainTransitive ∧ C.attractorDecomposition

theorem chain_recurrence_closed_from_evidence
    {R : RelationCorrespondencePackage} (C : ChainRecurrencePackage R)
    (E : ChainRecurrenceEvidence C) : ChainRecurrenceClosed C := by
  exact And.intro E.chainTransitiveClosed E.attractorDecompositionClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse
