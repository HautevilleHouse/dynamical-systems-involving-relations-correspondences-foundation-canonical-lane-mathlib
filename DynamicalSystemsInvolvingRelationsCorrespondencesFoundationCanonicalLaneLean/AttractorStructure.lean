import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.RelationCorrespondenceBase

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure AttractorStructurePackage {R : RelationCorrespondencePackage} where
  globalAttractorDefined : R.globalAttractor
  LyapunovCharacterization : ∀ x : R.stateSpace, (∃ y : R.stateSpace, R.correspondence x y) → R.LyapunovFunction x = 0
  attractorBasisClosed : R.attractorBasis
  equivalenceClasses : Prop

structure AttractorStructureEvidence {R : RelationCorrespondencePackage}
    (A : AttractorStructurePackage R) where
  globalAttractorDefinedClosed : A.globalAttractorDefined
  LyapunovCharacterizationClosed : A.LyapunovCharacterization
  attractorBasisClosed : A.attractorBasisClosed
  equivalenceClassesClosed : A.equivalenceClasses

def AttractorStructureClosed {R : RelationCorrespondencePackage}
    (A : AttractorStructurePackage R) : Prop :=
  A.globalAttractorDefined ∧ A.LyapunovCharacterization ∧ A.attractorBasisClosed ∧ A.equivalenceClasses

theorem attractor_structure_closed_from_evidence
    {R : RelationCorrespondencePackage} (A : AttractorStructurePackage R)
    (E : AttractorStructureEvidence A) : AttractorStructureClosed A := by
  exact And.intro E.globalAttractorDefinedClosed
    (And.intro E.LyapunovCharacterizationClosed
      (And.intro E.attractorBasisClosed E.equivalenceClassesClosed))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse
