import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure RelationCorrespondence (X Y : Type u) where
  graph : Set (X × Y)
  upperHemicontinuous : Prop
  lowerHemicontinuous : Prop

def relationCorrespondenceClosed {X Y : Type u} (R : RelationCorrespondence X Y) : Prop :=
  R.upperHemicontinuous ∧ R.lowerHemicontinuous

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse