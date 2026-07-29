import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure CorrespondenceDynamicalSystem (S : Type u) (T : Type v) where
  relation : S → T → Prop
  stateSpace : Set S
  targetSpace : Set T
  closedUnderIteration : Prop
  carriesAdmissibleClass : Prop

structure CorrespondenceDynamicalEvidence {S : Type u} {T : Type v} (C : CorrespondenceDynamicalSystem S T) where
  closedUnderIterationClosed : C.closedUnderIteration
  carriesAdmissibleClassClosed : C.carriesAdmissibleClass

def CorrespondenceDynamicalClosed {S : Type u} {T : Type v} (C : CorrespondenceDynamicalSystem S T) : Prop :=
  C.closedUnderIteration ∧ C.carriesAdmissibleClass

theorem correspondence_dynamical_closed_from_evidence {S : Type u} {T : Type v} (C : CorrespondenceDynamicalSystem S T) (E : CorrespondenceDynamicalEvidence C) : CorrespondenceDynamicalClosed C := by
  exact And.intro E.closedUnderIterationClosed E.carriesAdmissibleClassClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse