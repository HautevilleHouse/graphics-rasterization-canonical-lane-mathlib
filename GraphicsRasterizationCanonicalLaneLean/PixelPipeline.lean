import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure PixelPipelinePackage where
  vertexShader : Prop
  fragmentShader : Prop
  depthTest : Prop
  blending : Prop
  outputMerger : Prop

structure PixelPipelineEvidence (P : PixelPipelinePackage) where
  vertexShaderClosed : P.vertexShader
  fragmentShaderClosed : P.fragmentShader
  depthTestClosed : P.depthTest
  blendingClosed : P.blending
  outputMergerClosed : P.outputMerger

def PixelPipelineClosed (P : PixelPipelinePackage) : Prop :=
  P.vertexShader ∧ P.fragmentShader ∧ P.depthTest ∧ P.blending ∧ P.outputMerger

theorem pixel_pipeline_closed_from_evidence (P : PixelPipelinePackage) (E : PixelPipelineEvidence P) :
    PixelPipelineClosed P := by
  exact And.intro E.vertexShaderClosed
    (And.intro E.fragmentShaderClosed
      (And.intro E.depthTestClosed
        (And.intro E.blendingClosed E.outputMergerClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse