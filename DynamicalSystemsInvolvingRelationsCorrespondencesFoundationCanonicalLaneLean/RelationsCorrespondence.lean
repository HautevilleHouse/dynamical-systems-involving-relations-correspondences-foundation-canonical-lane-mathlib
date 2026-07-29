import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure RelationsCorrespondencePackage where
  domain : Type u
  codomain : Type v
  relationSet : Set (domain × codomain)
  closedUnderComposition : Prop
  closedUnderConverse : Prop
  closedUnderSaturation : Prop
  closedUnderReflexiveTransitiveClosure : Prop

structure RelationsCorrespondenceEvidence (R : RelationsCorrespondencePackage) where
  closedUnderCompositionTerm : R.closedUnderComposition
  closedUnderConverseTerm : R.closedUnderConverse
  closedUnderSaturationTerm : R.closedUnderSaturation
  closedUnderReflexiveTransitiveClosureTerm : R.closedUnderReflexiveTransitiveClosure

def RelationsCorrespondenceClosed (R : RelationsCorrespondencePackage) : Prop := 
  R.closedUnderComposition ∧ R.closedUnderConverse ∧ R.closedUnderSaturation ∧ R.closedUnderReflexiveTransitiveClosure

theorem relations_correspondence_closed_from_evidence (R : RelationsCorrespondencePackage)
    (E : RelationsCorrespondenceEvidence R) : RelationsCorrespondenceClosed R := by
  exact And.intro E.closedUnderCompositionTerm
    (And.intro E.closedUnderConverseTerm
      (And.intro E.closedUnderSaturationTerm E.closedUnderReflexiveTransitiveClosureTerm))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse