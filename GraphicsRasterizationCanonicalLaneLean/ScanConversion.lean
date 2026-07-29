import GraphicsRasterizationCanonicalLaneLean.FragmentPipeline

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure ScanConversionPackage {G : FragmentPipelinePackage} where
  edgeWalking : Prop
  boundingBox : Prop
  pixelCoverage : Prop
  interpolationSetup : Prop

structure ScanConversionEvidence {G : FragmentPipelinePackage} (S : ScanConversionPackage G) where
  edgeWalkingClosed : S.edgeWalking
  boundingBoxClosed : S.boundingBox
  pixelCoverageClosed : S.pixelCoverage
  interpolationSetupClosed : S.interpolationSetup

def ScanConversionClosed {G : FragmentPipelinePackage} (S : ScanConversionPackage G) : Prop :=
  S.edgeWalking ∧ S.boundingBox ∧ S.pixelCoverage ∧ S.interpolationSetup

theorem scan_conversion_closed_from_evidence {G : FragmentPipelinePackage} (S : ScanConversionPackage G)
    (E : ScanConversionEvidence S) : ScanConversionClosed S := by
  exact And.intro E.edgeWalkingClosed
    (And.intro E.boundingBoxClosed
      (And.intro E.pixelCoverageClosed E.interpolationSetupClosed))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse