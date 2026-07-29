import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure RelationDynamicalSystem where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  relation : stateSpace → stateSpace → Prop
  forwardInvariant : Prop
  backwardInvariant : Prop
  forwardInvariantTerm : forwardInvariant
  backwardInvariantTerm : backwardInvariant

structure RelationDynamicalSystemEvidence (S : RelationDynamicalSystem) where
  forwardInvariantClosed : S.forwardInvariant
  backwardInvariantClosed : S.backwardInvariant

def RelationDynamicalSystemClosed (S : RelationDynamicalSystem) : Prop :=
  S.forwardInvariant ∧ S.backwardInvariant

theorem relation_dynamical_system_closed_from_evidence
    (S : RelationDynamicalSystem) (E : RelationDynamicalSystemEvidence S) :
    RelationDynamicalSystemClosed S := by
  exact And.intro E.forwardInvariantClosed E.backwardInvariantClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse
