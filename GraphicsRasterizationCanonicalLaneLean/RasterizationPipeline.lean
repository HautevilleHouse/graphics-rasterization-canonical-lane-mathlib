import GraphicsRasterizationCanonicalLaneLean.ScanConversion

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure RasterizationPipelinePackage {G : FragmentPipelinePackage} {S : ScanConversionPackage G} where
  pointRasterization : Prop
  lineRasterization : Prop
  triangleRasterization : Prop
  conservativeRasterization : Prop
  multisampleRasterization : Prop

structure RasterizationPipelineEvidence {G : FragmentPipelinePackage} {S : ScanConversionPackage G}
    (R : RasterizationPipelinePackage G S) where
  pointRasterizationClosed : R.pointRasterization
  lineRasterizationClosed : R.lineRasterization
  triangleRasterizationClosed : R.triangleRasterization
  conservativeRasterizationClosed : R.conservativeRasterization
  multisampleRasterizationClosed : R.multisampleRasterization

def RasterizationPipelineClosed {G : FragmentPipelinePackage} {S : ScanConversionPackage G}
    (R : RasterizationPipelinePackage G S) : Prop :=
  R.pointRasterization ∧ R.lineRasterization ∧ R.triangleRasterization ∧
  R.conservativeRasterization ∧ R.multisampleRasterization

theorem rasterization_pipeline_closed_from_evidence
    {G : FragmentPipelinePackage} {S : ScanConversionPackage G}
    (R : RasterizationPipelinePackage G S) (E : RasterizationPipelineEvidence R) :
    RasterizationPipelineClosed R := by
  exact And.intro E.pointRasterizationClosed
    (And.intro E.lineRasterizationClosed
      (And.intro E.triangleRasterizationClosed
        (And.intro E.conservativeRasterizationClosed E.multisampleRasterizationClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse