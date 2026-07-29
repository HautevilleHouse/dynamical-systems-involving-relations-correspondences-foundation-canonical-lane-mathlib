import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.MorseDecomposition

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure ConleyIndexPackage {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    (M : MorseDecompositionPackage I) where
  isolatingNeighborhood : Set D.stateSpace
  indexPairs : Set (Set D.stateSpace × Set D.stateSpace)
  indexHomotopyEquivalence : Prop
  continuationProperty : Prop
  categoricalMorseDecomposition : Prop

structure ConleyIndexEvidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    {M : MorseDecompositionPackage I} (C : ConleyIndexPackage M) where
  isolatingNeighborhoodTerm : C.isolatingNeighborhood ⊆ D.stateSpace
  indexPairsTerm : ∀ (p : Set D.stateSpace × Set D.stateSpace), p ∈ C.indexPairs → fst p ⊆ D.stateSpace ∧ snd p ⊆ D.stateSpace
  indexHomotopyEquivalenceTerm : C.indexHomotopyEquivalence
  continuationPropertyTerm : C.continuationProperty
  categoricalMorseDecompositionTerm : C.categoricalMorseDecomposition

def ConleyIndexClosed {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    {M : MorseDecompositionPackage I} (C : ConleyIndexPackage M) : Prop :=
  (C.isolatingNeighborhood ⊆ D.stateSpace) ∧
  (∀ (p : Set D.stateSpace × Set D.stateSpace), p ∈ C.indexPairs → fst p ⊆ D.stateSpace ∧ snd p ⊆ D.stateSpace) ∧
  C.indexHomotopyEquivalence ∧ C.continuationProperty ∧ C.categoricalMorseDecomposition

theorem conley_index_closed_from_evidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} {I : InvariantSetPackage D}
    {M : MorseDecompositionPackage I} (C : ConleyIndexPackage M) (E : ConleyIndexEvidence C) :
    ConleyIndexClosed C := by
  exact And.intro E.isolatingNeighborhoodTerm
    (And.intro E.indexPairsTerm
      (And.intro E.indexHomotopyEquivalenceTerm
        (And.intro E.continuationPropertyTerm E.categoricalMorseDecompositionTerm)))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse