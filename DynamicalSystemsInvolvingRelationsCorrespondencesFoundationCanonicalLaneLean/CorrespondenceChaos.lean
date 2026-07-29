import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure CorrespondenceChaos (X : Type u) (R : X → X → Prop) where
  sensitiveDependence : Prop
  topologicalTransitivity : Prop
  densePeriodicPoints : Prop
  correspondenceVersion : Prop

structure CorrespondenceChaosEvidence {X : Type u} {R : X → X → Prop} (C : CorrespondenceChaos X R) where
  sensitiveDependenceClosed : C.sensitiveDependence
  topologicalTransitivityClosed : C.topologicalTransitivity
  densePeriodicPointsClosed : C.densePeriodicPoints
  correspondenceVersionClosed : C.correspondenceVersion

def CorrespondenceChaosClosed {X : Type u} {R : X → X → Prop} (C : CorrespondenceChaos X R) : Prop :=
  C.sensitiveDependence ∧ C.topologicalTransitivity ∧ C.densePeriodicPoints ∧ C.correspondenceVersion

theorem correspondence_chaos_closed_from_evidence {X : Type u} {R : X → X → Prop} (C : CorrespondenceChaos X R) (E : CorrespondenceChaosEvidence C) : CorrespondenceChaosClosed C := by
  exact And.intro E.sensitiveDependenceClosed (And.intro E.topologicalTransitivityClosed (And.intro E.densePeriodicPointsClosed E.correspondenceVersionClosed))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse