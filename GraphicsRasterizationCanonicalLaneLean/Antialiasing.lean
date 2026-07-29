import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure AntialiasingPackage where
  multisampling : Prop
  supersampling : Prop
  morphologicalAA : Prop
  temporalAA : Prop
  subpixelCoverage : Prop

structure AntialiasingEvidence (A : AntialiasingPackage) where
  multisamplingClosed : A.multisampling
  supersamplingClosed : A.supersampling
  morphologicalAAClosed : A.morphologicalAA
  temporalAAClosed : A.temporalAA
  subpixelCoverageClosed : A.subpixelCoverage

def AntialiasingClosed (A : AntialiasingPackage) : Prop :=
  A.multisampling ∧ A.supersampling ∧ A.morphologicalAA ∧ A.temporalAA ∧ A.subpixelCoverage

theorem antialiasing_closed_from_evidence (A : AntialiasingPackage) (E : AntialiasingEvidence A) :
    AntialiasingClosed A := by
  exact And.intro E.multisamplingClosed
    (And.intro E.supersamplingClosed
      (And.intro E.morphologicalAAClosed
        (And.intro E.temporalAAClosed E.subpixelCoverageClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse