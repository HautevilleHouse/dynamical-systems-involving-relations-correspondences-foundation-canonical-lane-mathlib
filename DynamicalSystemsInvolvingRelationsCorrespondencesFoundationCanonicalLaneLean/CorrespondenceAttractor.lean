import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingRelationsCorrespondencesFoundation.RelationDynamicalSystem

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure CorrespondenceAttractor {S : RelationDynamicalSystem} where
  attractorSet : Set S.stateSpace
  forwardInvariantUnderRelation : ∀ x ∈ attractorSet, ∀ y, S.relation x y → y ∈ attractorSet
  attractsFromBasin : Prop
  attractsFromBasinTerm : attractsFromBasin

structure CorrespondenceAttractorEvidence {S : RelationDynamicalSystem}
    (A : CorrespondenceAttractor S) where
  forwardInvariantClosed : A.forwardInvariantUnderRelation
  attractsFromBasinClosed : A.attractsFromBasin

def CorrespondenceAttractorClosed {S : RelationDynamicalSystem}
    (A : CorrespondenceAttractor S) : Prop :=
  A.forwardInvariantUnderRelation ∧ A.attractsFromBasin

theorem correspondence_attractor_closed_from_evidence
    {S : RelationDynamicalSystem} (A : CorrespondenceAttractor S)
    (E : CorrespondenceAttractorEvidence A) : CorrespondenceAttractorClosed A := by
  exact And.intro E.forwardInvariantClosed E.attractsFromBasinClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse
