import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure RelationInvariantMeasure (X : Type u) (R : X → X → Prop) where
  measure : Set X → ℝ
  invarianceUnderRelation : Prop
  sigmaAdditivity : Prop
  nontriviality : Prop

structure RelationInvariantMeasureEvidence {X : Type u} {R : X → X → Prop} (M : RelationInvariantMeasure X R) where
  invarianceUnderRelationClosed : M.invarianceUnderRelation
  sigmaAdditivityClosed : M.sigmaAdditivity
  nontrivialityClosed : M.nontriviality

def RelationInvariantMeasureClosed {X : Type u} {R : X → X → Prop} (M : RelationInvariantMeasure X R) : Prop :=
  M.invarianceUnderRelation ∧ M.sigmaAdditivity ∧ M.nontriviality

theorem relation_invariant_measure_closed_from_evidence {X : Type u} {R : X → X → Prop} (M : RelationInvariantMeasure X R) (E : RelationInvariantMeasureEvidence M) : RelationInvariantMeasureClosed M := by
  exact And.intro E.invarianceUnderRelationClosed (And.intro E.sigmaAdditivityClosed E.nontrivialityClosed)

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse