import GraphicsRasterizationCanonicalLaneLean.ClippingCulling

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure FragmentShaderPackage (P : RasterizationPipeline) (C : ClippingCullingPackage P) where
  interpolatedAttributes : Prop
  textureSampling : Prop
  blendingLogic : Prop
  depthTesting : Prop

structure FragmentShaderEvidence (P : RasterizationPipeline) (C : ClippingCullingPackage P) (F : FragmentShaderPackage P C) where
  interpolatedAttributesClosed : F.interpolatedAttributes
  textureSamplingClosed : F.textureSampling
  blendingLogicClosed : F.blendingLogic
  depthTestingClosed : F.depthTesting

def FragmentShaderClosed (P : RasterizationPipeline) (C : ClippingCullingPackage P) (F : FragmentShaderPackage P C) : Prop :=
  F.interpolatedAttributes ∧ F.textureSampling ∧ F.blendingLogic ∧ F.depthTesting

theorem fragment_shader_closed_from_evidence (P : RasterizationPipeline) (C : ClippingCullingPackage P) (F : FragmentShaderPackage P C) (E : FragmentShaderEvidence P C F) :
    FragmentShaderClosed P C F := by
  exact And.intro E.interpolatedAttributesClosed
    (And.intro E.textureSamplingClosed
      (And.intro E.blendingLogicClosed E.depthTestingClosed))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse