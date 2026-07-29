import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure FragmentProcessing (A : AdmissibleClass) where
  interpolation : (Float × Float × Float) → (Float × Float × Float) → (Float × Float) → (Float × Float × Float)
  shading : (Float × Float × Float) → (Float × Float × Float Float)
  alphaBlending : (Float × Float × Float Float) → (Float × Float × Float Float) → (Float × Float × Float Float)
  fogEffect : (Float × Float × Float Float) → Float → (Float × Float × Float Float)
  interpolationCorrectness : Prop
  shadingCorrectness : Prop
  blendingCorrectness : Prop
  fogCorrectness : Prop

structure FragmentProcessingEvidence {A : AdmissibleClass} (F : FragmentProcessing A) where
  interpolationCorrectnessClosed : F.interpolationCorrectness
  shadingCorrectnessClosed : F.shadingCorrectness
  blendingCorrectnessClosed : F.blendingCorrectness
  fogCorrectnessClosed : F.fogCorrectness

def FragmentProcessingClosed {A : AdmissibleClass} (F : FragmentProcessing A) : Prop :=
  F.interpolationCorrectness ∧ F.shadingCorrectness ∧ F.blendingCorrectness ∧ F.fogCorrectness

theorem fragment_processing_closed_from_evidence {A : AdmissibleClass} (F : FragmentProcessing A) (E : FragmentProcessingEvidence F) : FragmentProcessingClosed F :=
  And.intro E.interpolationCorrectnessClosed (And.intro E.shadingCorrectnessClosed (And.intro E.blendingCorrectnessClosed E.fogCorrectnessClosed))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse