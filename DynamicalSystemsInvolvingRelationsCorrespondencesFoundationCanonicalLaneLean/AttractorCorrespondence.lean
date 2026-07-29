import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure AttractorCorrespondence (X : Type u) (F : SetValuedFlow X) where
  attractorSet : Set X
  attractingProperty : Prop
  invarianceUnderFlow : Prop
  basinOfAttraction : Prop

structure AttractorCorrespondenceEvidence {X : Type u} {F : SetValuedFlow X} (A : AttractorCorrespondence X F) where
  attractingPropertyClosed : A.attractingProperty
  invarianceUnderFlowClosed : A.invarianceUnderFlow
  basinOfAttractionClosed : A.basinOfAttraction

def AttractorCorrespondenceClosed {X : Type u} {F : SetValuedFlow X} (A : AttractorCorrespondence X F) : Prop :=
  A.attractingProperty ∧ A.invarianceUnderFlow ∧ A.basinOfAttraction

theorem attractor_correspondence_closed_from_evidence {X : Type u} {F : SetValuedFlow X} (A : AttractorCorrespondence X F) (E : AttractorCorrespondenceEvidence A) : AttractorCorrespondenceClosed A := by
  exact And.intro E.attractingPropertyClosed (And.intro E.invarianceUnderFlowClosed E.basinOfAttractionClosed)

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse