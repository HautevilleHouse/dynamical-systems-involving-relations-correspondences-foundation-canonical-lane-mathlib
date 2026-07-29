import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure RelationCorrespondencePackage where
  stateSpace : Type u
  correspondence : stateSpace → stateSpace → Prop
  globalAttractor : Prop
  chainRecurrence : Prop
  LyapunovFunction : stateSpace → ℝ
  quasipotentialUnique : Prop
  attractorBasis : Prop

structure RelationCorrespondenceEvidence (R : RelationCorrespondencePackage) where
  globalAttractorClosed : R.globalAttractor
  chainRecurrenceClosed : R.chainRecurrence
  LyapunovFunctionClosed : ∀ x, R.LyapunovFunction x ≥ 0
  quasipotentialUniqueClosed : R.quasipotentialUnique
  attractorBasisClosed : R.attractorBasis

def RelationCorrespondenceClosed (R : RelationCorrespondencePackage) : Prop :=
  R.globalAttractor ∧ R.chainRecurrence ∧ (∀ x, R.LyapunovFunction x ≥ 0) ∧ R.quasipotentialUnique ∧ R.attractorBasis

theorem relation_correspondence_closed_from_evidence
    (R : RelationCorrespondencePackage) (E : RelationCorrespondenceEvidence R) :
    RelationCorrespondenceClosed R := by
  exact And.intro E.globalAttractorClosed
    (And.intro E.chainRecurrenceClosed
      (And.intro E.LyapunovFunctionClosed
        (And.intro E.quasipotentialUniqueClosed E.attractorBasisClosed)))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse
