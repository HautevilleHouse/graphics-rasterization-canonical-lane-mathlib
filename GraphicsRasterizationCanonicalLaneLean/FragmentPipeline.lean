import GraphicsRasterizationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure FragmentPipelinePackage where
  vertexProcessing : Prop
  primitiveAssembly : Prop
  rasterization : Prop
  fragmentShading : Prop
  depthTesting : Prop

structure FragmentPipelineEvidence (P : FragmentPipelinePackage) where
  vertexProcessingClosed : P.vertexProcessing
  primitiveAssemblyClosed : P.primitiveAssembly
  rasterizationClosed : P.rasterization
  fragmentShadingClosed : P.fragmentShading
  depthTestingClosed : P.depthTesting

def FragmentPipelineClosed (P : FragmentPipelinePackage) : Prop :=
  P.vertexProcessing ∧ P.primitiveAssembly ∧ P.rasterization ∧ P.fragmentShading ∧ P.depthTesting

theorem fragment_pipeline_closed_from_evidence (P : FragmentPipelinePackage) (E : FragmentPipelineEvidence P) :
    FragmentPipelineClosed P := by
  exact And.intro E.vertexProcessingClosed
    (And.intro E.primitiveAssemblyClosed
      (And.intro E.rasterizationClosed
        (And.intro E.fragmentShadingClosed E.depthTestingClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse