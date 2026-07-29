import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure SetValuedFlow (X : Type u) where
  time : Type v
  initial : X → Set X
  evolution : X → time → Set X
  forwardInvariant : Prop
  closedGraph : Prop

structure SetValuedFlowEvidence {X : Type u} (F : SetValuedFlow X) where
  forwardInvariantClosed : F.forwardInvariant
  closedGraphClosed : F.closedGraph

def SetValuedFlowClosed {X : Type u} (F : SetValuedFlow X) : Prop :=
  F.forwardInvariant ∧ F.closedGraph

theorem set_valued_flow_closed_from_evidence {X : Type u} (F : SetValuedFlow X) (E : SetValuedFlowEvidence F) : SetValuedFlowClosed F := by
  exact And.intro E.forwardInvariantClosed E.closedGraphClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse