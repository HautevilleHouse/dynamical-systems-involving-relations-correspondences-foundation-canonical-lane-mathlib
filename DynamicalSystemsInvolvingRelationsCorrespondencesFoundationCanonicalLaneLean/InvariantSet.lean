import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.DynamicalSystem

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure InvariantSetPackage {R : RelationsCorrespondencePackage}
    (D : DynamicalSystemPackage R) where
  invariantSet : Set D.stateSpace
  forwardInvariant : Prop
  backwardInvariant : Prop
  chainRecurrentSet : Set D.stateSpace
  chainTransitiveComponents : Set (Set D.stateSpace)
  attractorRepellerPairs : Prop

structure InvariantSetEvidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (I : InvariantSetPackage D) where
  forwardInvariantTerm : I.forwardInvariant
  backwardInvariantTerm : I.backwardInvariant
  chainRecurrentSetTerm : I.chainRecurrentSet ⊆ D.stateSpace
  chainTransitiveComponentsTerm : (∀ C ∈ I.chainTransitiveComponents, C ⊆ D.stateSpace)
  attractorRepellerPairsTerm : I.attractorRepellerPairs

def InvariantSetClosed {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (I : InvariantSetPackage D) : Prop :=
  I.forwardInvariant ∧ I.backwardInvariant ∧
  (I.chainRecurrentSet ⊆ D.stateSpace) ∧
  (∀ C ∈ I.chainTransitiveComponents, C ⊆ D.stateSpace) ∧
  I.attractorRepellerPairs

theorem invariant_set_closed_from_evidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (I : InvariantSetPackage D) (E : InvariantSetEvidence I) :
    InvariantSetClosed I := by
  exact And.intro E.forwardInvariantTerm
    (And.intro E.backwardInvariantTerm
      (And.intro E.chainRecurrentSetTerm
        (And.intro E.chainTransitiveComponentsTerm E.attractorRepellerPairsTerm)))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse