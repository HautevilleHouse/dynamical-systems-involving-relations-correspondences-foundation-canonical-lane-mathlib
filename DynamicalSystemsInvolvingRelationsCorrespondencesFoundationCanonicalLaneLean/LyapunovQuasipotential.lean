import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean.RelationCorrespondenceBase

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure LyapunovQuasipotentialPackage {R : RelationCorrespondencePackage} where
  LyapunovStrictDecrease : ∀ x y, R.correspondence x y → R.LyapunovFunction y < R.LyapunovFunction x
  quasipotentialDefined : R.chainRecurrence → R.quasipotentialUnique
  attractorReachable : ∀ x, ∃ y, R.correspondence x y ∧ R.globalAttractor y

structure LyapunovQuasipotentialEvidence {R : RelationCorrespondencePackage}
    (L : LyapunovQuasipotentialPackage R) where
  LyapunovStrictDecreaseClosed : L.LyapunovStrictDecrease
  quasipotentialDefinedClosed : L.quasipotentialDefined
  attractorReachableClosed : L.attractorReachable

def LyapunovQuasipotentialClosed {R : RelationCorrespondencePackage}
    (L : LyapunovQuasipotentialPackage R) : Prop :=
  L.LyapunovStrictDecrease ∧ L.quasipotentialDefined ∧ L.attractorReachable

theorem lyapunov_quasipotential_closed_from_evidence
    {R : RelationCorrespondencePackage} (L : LyapunovQuasipotentialPackage R)
    (E : LyapunovQuasipotentialEvidence L) : LyapunovQuasipotentialClosed L := by
  exact And.intro E.LyapunovStrictDecreaseClosed
    (And.intro E.quasipotentialDefinedClosed E.attractorReachableClosed)

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse
