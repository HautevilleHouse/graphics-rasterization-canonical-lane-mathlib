import GraphicsRasterizationCanonicalLaneLean.RasterizationPipeline

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure ClippingCullingPackage (P : RasterizationPipeline) where
  viewFrustumClipping : Prop
  backfaceCulling : Prop
  occlusionCulling : Prop
  nearPlaneClipping : Prop

structure ClippingCullingEvidence (P : RasterizationPipeline) (C : ClippingCullingPackage P) where
  viewFrustumClippingClosed : C.viewFrustumClipping
  backfaceCullingClosed : C.backfaceCulling
  occlusionCullingClosed : C.occlusionCulling
  nearPlaneClippingClosed : C.nearPlaneClipping

def ClippingCullingClosed (P : RasterizationPipeline) (C : ClippingCullingPackage P) : Prop :=
  C.viewFrustumClipping ∧ C.backfaceCulling ∧ C.occlusionCulling ∧ C.nearPlaneClipping

theorem clipping_culling_closed_from_evidence (P : RasterizationPipeline) (C : ClippingCullingPackage P) (E : ClippingCullingEvidence P C) :
    ClippingCullingClosed P C := by
  exact And.intro E.viewFrustumClippingClosed
    (And.intro E.backfaceCullingClosed
      (And.intro E.occlusionCullingClosed E.nearPlaneClippingClosed))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse