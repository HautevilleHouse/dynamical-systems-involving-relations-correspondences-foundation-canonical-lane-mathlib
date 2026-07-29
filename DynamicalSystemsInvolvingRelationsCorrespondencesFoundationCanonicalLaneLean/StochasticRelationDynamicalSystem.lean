import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundation

structure StochasticRelationDynamicalSystem where
  probabilitySpace : Type u
  measurableSpace : MeasurableSpace probabilitySpace
  markovKernel : probabilitySpace → probabilitySpace → ℝ
  kernelPositivity : ∀ x, ∀ y, markovKernel x y ≥ 0
  kernelSumOne : ∀ x, ∫ y, markovKernel x y = 1
  kernelPositivityTerm : kernelPositivity
  kernelSumOneTerm : kernelSumOne

structure StochasticRelationDynamicalSystemEvidence (S : StochasticRelationDynamicalSystem) where
  kernelPositivityClosed : S.kernelPositivity
  kernelSumOneClosed : S.kernelSumOne

def StochasticRelationDynamicalSystemClosed (S : StochasticRelationDynamicalSystem) : Prop :=
  S.kernelPositivity ∧ S.kernelSumOne

theorem stochastic_relation_dynamical_system_closed_from_evidence
    (S : StochasticRelationDynamicalSystem) (E : StochasticRelationDynamicalSystemEvidence S) :
    StochasticRelationDynamicalSystemClosed S := by
  exact And.intro E.kernelPositivityClosed E.kernelSumOneClosed

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundation
end HautevilleHouse
