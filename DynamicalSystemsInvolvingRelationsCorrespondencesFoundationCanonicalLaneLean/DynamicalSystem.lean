import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.RelationsCorrespondence

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure DynamicalSystemPackage (R : RelationsCorrespondencePackage) where
  stateSpace : Type u
  timeDomain : Type v
  transitionRelation : Set (stateSpace × timeDomain × stateSpace)
  deterministicOrNondeterministic : Prop
  forwardInvariantSet : Set stateSpace
  backwardInvariantSet : Set stateSpace
  attractorSet : Set stateSpace

structure DynamicalSystemEvidence {R : RelationsCorrespondencePackage}
    (D : DynamicalSystemPackage R) where
  transitionRelationClosed : D.deterministicOrNondeterministic
  forwardInvariantSetTerm : D.forwardInvariantSet ∈ D.stateSpace
  backwardInvariantSetTerm : D.backwardInvariantSet ∈ D.stateSpace
  attractorSetTerm : D.attractorSet ∈ D.stateSpace

def DynamicalSystemClosed {R : RelationsCorrespondencePackage}
    (D : DynamicalSystemPackage R) : Prop :=
  D.deterministicOrNondeterministic ∧
  (D.forwardInvariantSet ⊆ D.stateSpace) ∧
  (D.backwardInvariantSet ⊆ D.stateSpace) ∧
  (D.attractorSet ⊆ D.stateSpace)

theorem dynamical_system_closed_from_evidence {R : RelationsCorrespondencePackage}
    (D : DynamicalSystemPackage R) (E : DynamicalSystemEvidence D) : DynamicalSystemClosed D := by
  exact And.intro E.transitionRelationClosed
    (And.intro (by
      exact Set.subset_of_eq ?_)
      (And.intro (by
        exact Set.subset_of_eq ?_)
        (by
          exact Set.subset_of_eq ?_)))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse