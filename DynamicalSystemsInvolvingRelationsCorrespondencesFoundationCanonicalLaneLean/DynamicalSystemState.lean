import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean

structure DynamicalSystemState where
  space : Type u
  topology : TopologicalSpace space
  dynamics : space → space
  continuousDynamics : Continuous dynamics

def stateEvolution (x : space) : ℕ → space := fun n => (dynamics^[n]) x

end DynamicalSystemsInvolvingRelationsCorrespondencesFoundationCanonicalLaneLean
end HautevilleHouse