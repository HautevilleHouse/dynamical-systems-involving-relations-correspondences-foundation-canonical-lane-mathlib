import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.DynamicalSystem

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure FixedPointPackage {R : RelationsCorrespondencePackage}
    (D : DynamicalSystemPackage R) where
  fixedPointSet : Set D.stateSpace
  existenceCondition : Prop
  uniquenessCondition : Prop
  stabilityCondition : Prop
  attractorContainsFixedPoints : Prop

structure FixedPointEvidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (F : FixedPointPackage D) where
  existenceTerm : F.existenceCondition
  uniquenessTerm : F.uniquenessCondition
  stabilityTerm : F.stabilityCondition
  attractorContainsFixedPointsTerm : F.attractorContainsFixedPoints

def FixedPointClosed {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (F : FixedPointPackage D) : Prop :=
  F.existenceCondition ∧ F.uniquenessCondition ∧ F.stabilityCondition ∧ F.attractorContainsFixedPoints

theorem fixed_point_closed_from_evidence {R : RelationsCorrespondencePackage}
    {D : DynamicalSystemPackage R} (F : FixedPointPackage D) (E : FixedPointEvidence F) :
    FixedPointClosed F := by
  exact And.intro E.existenceTerm
    (And.intro E.uniquenessTerm
      (And.intro E.stabilityTerm E.attractorContainsFixedPointsTerm))

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse