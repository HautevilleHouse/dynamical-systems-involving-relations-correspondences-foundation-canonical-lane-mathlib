import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.InvariantSet

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure MorseDecompositionPackage {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (I : InvariantSetPackage D) where
  morseSets : List (Set D.stateSpace)
  partialOrder : D.stateSpace → D.stateSpace → Prop
  recurrenceRespecting : Prop
  gradientLikeFlow : Prop
  heteroclinicConnections : Prop

structure MorseDecompositionEvidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    (M : MorseDecompositionPackage I) where
  morseSetsOrdinary : ∀ S ∈ M.morseSets, I.invariantSet ⊆ S
  partialOrderChain : (∀ x y : D.stateSpace, M.partialOrder x y → M.partialOrder y x → x = y)
  recurrenceRespectingTerm : M.recurrenceRespecting
  gradientLikeFlowTerm : M.gradientLikeFlow
  heteroclinicConnectionsTerm : M.heteroclinicConnections

def MorseDecompositionClosed {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    (M : MorseDecompositionPackage I) : Prop :=
  (∀ S ∈ M.morseSets, I.invariantSet ⊆ S) ∧
  (∀ x y : D.stateSpace, M.partialOrder x y → M.partialOrder y x → x = y) ∧
  M.recurrenceRespecting ∧ M.gradientLikeFlow ∧ M.heteroclinicConnections

theorem morse_decomposition_closed_from_evidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    (M : MorseDecompositionPackage I) (E : MorseDecompositionEvidence M) :
    MorseDecompositionClosed M := by
  exact And.intro E.morseSetsOrdinary
    (And.intro E.partialOrderChain
      (And.intro E.recurrenceRespectingTerm
        (And.intro E.gradientLikeFlowTerm E.heteroclinicConnectionsTerm)))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse