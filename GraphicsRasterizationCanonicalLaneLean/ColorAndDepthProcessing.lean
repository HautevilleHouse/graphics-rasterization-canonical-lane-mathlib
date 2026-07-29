import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure ColorAndDepthProcessingPackage {R : RasterizationPipelinePackage} (F : Framebuffer) where
  colorWriteEnabled : Prop
  depthTestEnabled : Prop
  depthCompare : Prop
  alphaBlending : Prop
  colorCorrectDerived : Prop
  depthConsistentDerived : Prop

structure ColorAndDepthProcessingEvidence {R : RasterizationPipelinePackage} {F : Framebuffer} (C : ColorAndDepthProcessingPackage R F) where
  colorWriteEnabledClosed : C.colorWriteEnabled
  depthTestEnabledClosed : C.depthTestEnabled
  depthCompareClosed : C.depthCompare
  alphaBlendingClosed : C.alphaBlending
  colorCorrectDerivedClosed : C.colorCorrectDerived
  depthConsistentDerivedClosed : C.depthConsistentDerived

def ColorAndDepthProcessingClosed {R : RasterizationPipelinePackage} {F : Framebuffer} (C : ColorAndDepthProcessingPackage R F) : Prop :=
  C.colorWriteEnabled ∧ C.depthTestEnabled ∧ C.depthCompare ∧ C.alphaBlending ∧ C.colorCorrectDerived ∧ C.depthConsistentDerived

theorem color_and_depth_processing_closed_from_evidence {R : RasterizationPipelinePackage} {F : Framebuffer} (C : ColorAndDepthProcessingPackage R F) (E : ColorAndDepthProcessingEvidence C) :
    ColorAndDepthProcessingClosed C :=
  And.intro E.colorWriteEnabledClosed (And.intro E.depthTestEnabledClosed (And.intro E.depthCompareClosed (And.intro E.alphaBlendingClosed (And.intro E.colorCorrectDerivedClosed E.depthConsistentDerivedClosed))))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse
