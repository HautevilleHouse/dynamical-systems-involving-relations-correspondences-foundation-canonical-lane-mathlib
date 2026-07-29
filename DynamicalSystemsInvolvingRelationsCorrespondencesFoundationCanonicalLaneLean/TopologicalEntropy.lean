import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure TopologicalEntropy (X : Type u) [MetricSpace X] where
  entropy : ℝ
  entropyDefined : Prop

def topologicalEntropyClosed {X : Type u} [MetricSpace X] (H : TopologicalEntropy X) : Prop :=
  H.entropyDefined

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse