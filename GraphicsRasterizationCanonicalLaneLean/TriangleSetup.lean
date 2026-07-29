import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure TriangleSetupPackage where
  vertexFetch : Prop
  primitiveAssembly : Prop
  clipSpaceTransform : Prop
  viewportTransform : Prop
  backfaceCulling : Prop

structure TriangleSetupEvidence (T : TriangleSetupPackage) where
  vertexFetchClosed : T.vertexFetch
  primitiveAssemblyClosed : T.primitiveAssembly
  clipSpaceTransformClosed : T.clipSpaceTransform
  viewportTransformClosed : T.viewportTransform
  backfaceCullingClosed : T.backfaceCulling

def TriangleSetupClosed (T : TriangleSetupPackage) : Prop :=
  T.vertexFetch ∧ T.primitiveAssembly ∧ T.clipSpaceTransform ∧ T.viewportTransform ∧ T.backfaceCulling

theorem triangle_setup_closed_from_evidence (T : TriangleSetupPackage) (E : TriangleSetupEvidence T) :
    TriangleSetupClosed T := by
  exact And.intro E.vertexFetchClosed
    (And.intro E.primitiveAssemblyClosed
      (And.intro E.clipSpaceTransformClosed
        (And.intro E.viewportTransformClosed E.backfaceCullingClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse