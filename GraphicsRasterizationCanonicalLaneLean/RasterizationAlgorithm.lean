import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure RasterizationAlgorithmPackage where
  scanlineConversion : Prop
  barycentricCoordinate : Prop
  edgeFunction : Prop
  coverageMask : Prop
  earlyDepthTest : Prop

structure RasterizationAlgorithmEvidence (R : RasterizationAlgorithmPackage) where
  scanlineConversionClosed : R.scanlineConversion
  barycentricCoordinateClosed : R.barycentricCoordinate
  edgeFunctionClosed : R.edgeFunction
  coverageMaskClosed : R.coverageMask
  earlyDepthTestClosed : R.earlyDepthTest

def RasterizationAlgorithmClosed (R : RasterizationAlgorithmPackage) : Prop :=
  R.scanlineConversion ∧ R.barycentricCoordinate ∧ R.edgeFunction ∧ R.coverageMask ∧ R.earlyDepthTest

theorem rasterization_algorithm_closed_from_evidence (R : RasterizationAlgorithmPackage) (E : RasterizationAlgorithmEvidence R) :
    RasterizationAlgorithmClosed R := by
  exact And.intro E.scanlineConversionClosed
    (And.intro E.barycentricCoordinateClosed
      (And.intro E.edgeFunctionClosed
        (And.intro E.coverageMaskClosed E.earlyDepthTestClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse