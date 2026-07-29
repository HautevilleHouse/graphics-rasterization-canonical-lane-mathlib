import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure ZBuffer (A : AdmissibleClass) where
  resolution : Nat × Nat
  depthValues : List (List Float)
  depthFunction : (Nat × Nat) → Float → Bool
  occludingTest : (Nat × Nat) → Float → Bool
  zBufferCorrectness : Prop
  depthResolutionAdequate : Prop
  earlyZOptimization : Prop

structure ZBufferEvidence {A : AdmissibleClass} (Z : ZBuffer A) where
  zBufferCorrectnessClosed : Z.zBufferCorrectness
  depthResolutionAdequateClosed : Z.depthResolutionAdequate
  earlyZOptimizationClosed : Z.earlyZOptimization

def ZBufferClosed {A : AdmissibleClass} (Z : ZBuffer A) : Prop :=
  Z.zBufferCorrectness ∧ Z.depthResolutionAdequate ∧ Z.earlyZOptimization

theorem z_buffer_closed_from_evidence {A : AdmissibleClass} (Z : ZBuffer A) (E : ZBufferEvidence Z) : ZBufferClosed Z :=
  And.intro E.zBufferCorrectnessClosed (And.intro E.depthResolutionAdequateClosed E.earlyZOptimizationClosed)

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse