import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure InvariantMeasure where
  stateSpace : Type u
  sigmaAlgebra : SigmaAlgebra stateSpace
  measure : Measure stateSpace
  invarianceCondition : ∀ A, measurableSet A → measure A = measure (preimage relation A)
  invarianceConditionTerm : invarianceCondition

structure InvariantMeasureEvidence (M : InvariantMeasure) where
  invarianceConditionClosed : M.invarianceCondition

def InvariantMeasureClosed (M : InvariantMeasure) : Prop :=
  M.invarianceCondition

theorem invariant_measure_closed_from_evidence
    (M : InvariantMeasure) (E : InvariantMeasureEvidence M) :
    InvariantMeasureClosed M := by
  exact E.invarianceConditionClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse
