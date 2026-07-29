import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondenceFoundationCanonicalLaneLean

structure RelationCorrespondenceDynamicsPackage where
  stateSpace : Type u
  relation : stateSpace → stateSpace → Prop
  correspondence : stateSpace → stateSpace → Prop
  dynamics : stateSpace → stateSpace
  relationClosedUnderDynamics : Prop
  correspondenceClosedUnderDynamics : Prop
  forwardInvariance : Prop
  backwardInvariance : Prop
  relationCorrespondenceCompatibility : Prop

structure RelationCorrespondenceDynamicsEvidence (P : RelationCorrespondenceDynamicsPackage) where
  relationClosedUnderDynamicsClosed : P.relationClosedUnderDynamics
  correspondenceClosedUnderDynamicsClosed : P.correspondenceClosedUnderDynamics
  forwardInvarianceClosed : P.forwardInvariance
  backwardInvarianceClosed : P.backwardInvariance
  relationCorrespondenceCompatibilityClosed : P.relationCorrespondenceCompatibility

def RelationCorrespondenceDynamicsClosed (P : RelationCorrespondenceDynamicsPackage) : Prop :=
  P.relationClosedUnderDynamics ∧ P.correspondenceClosedUnderDynamics ∧
  P.forwardInvariance ∧ P.backwardInvariance ∧ P.relationCorrespondenceCompatibility

theorem relation_correspondence_dynamics_closed_from_evidence
    (P : RelationCorrespondenceDynamicsPackage)
    (E : RelationCorrespondenceDynamicsEvidence P) :
    RelationCorrespondenceDynamicsClosed P := by
  exact And.intro E.relationClosedUnderDynamicsClosed
    (And.intro E.correspondenceClosedUnderDynamicsClosed
      (And.intro E.forwardInvarianceClosed
        (And.intro E.backwardInvarianceClosed
          E.relationCorrespondenceCompatibilityClosed)))

end DynamicalSystemsInvolvingRelationsCorrespondenceFoundationCanonicalLaneLean
end HautevilleHouse