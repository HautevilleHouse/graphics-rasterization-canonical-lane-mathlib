import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure VisibilityAndAntialiasing (A : AdmissibleClass) where
  msaaSamplePositions : List (Float × Float)
  sampleCoverage : (Nat × Nat) → List Bool
  resolveFilter : List (Float × Float × Float Float) → (Float × Float × Float Float)
  pixelElimination : (Nat × Nat) → Bool
  msaaCorrectness : Prop
  coverageAccuracy : Prop
  resolveCorrectness : Prop
  eliminationCorrectness : Prop

structure VisibilityAndAntialiasingEvidence {A : AdmissibleClass} (V : VisibilityAndAntialiasing A) where
  msaaCorrectnessClosed : V.msaaCorrectness
  coverageAccuracyClosed : V.coverageAccuracy
  resolveCorrectnessClosed : V.resolveCorrectness
  eliminationCorrectnessClosed : V.eliminationCorrectness

def VisibilityAndAntialiasingClosed {A : AdmissibleClass} (V : VisibilityAndAntialiasing A) : Prop :=
  V.msaaCorrectness ∧ V.coverageAccuracy ∧ V.resolveCorrectness ∧ V.eliminationCorrectness

theorem visibility_and_antialiasing_closed_from_evidence {A : AdmissibleClass} (V : VisibilityAndAntialiasing A) (E : VisibilityAndAntialiasingEvidence V) : VisibilityAndAntialiasingClosed V :=
  And.intro E.msaaCorrectnessClosed (And.intro E.coverageAccuracyClosed (And.intro E.resolveCorrectnessClosed E.eliminationCorrectnessClosed))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse