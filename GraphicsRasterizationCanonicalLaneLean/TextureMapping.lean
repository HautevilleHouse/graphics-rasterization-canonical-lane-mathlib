import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure TextureMappingPackage where
  textureFetch : Prop
  bilinearFilter : Prop
  mipmapSelection : Prop
  anisotropicFiltering : Prop
  wrapMode : Prop

structure TextureMappingEvidence (T : TextureMappingPackage) where
  textureFetchClosed : T.textureFetch
  bilinearFilterClosed : T.bilinearFilter
  mipmapSelectionClosed : T.mipmapSelection
  anisotropicFilteringClosed : T.anisotropicFiltering
  wrapModeClosed : T.wrapMode

def TextureMappingClosed (T : TextureMappingPackage) : Prop :=
  T.textureFetch ∧ T.bilinearFilter ∧ T.mipmapSelection ∧ T.anisotropicFiltering ∧ T.wrapMode

theorem texture_mapping_closed_from_evidence (T : TextureMappingPackage) (E : TextureMappingEvidence T) :
    TextureMappingClosed T := by
  exact And.intro E.textureFetchClosed
    (And.intro E.bilinearFilterClosed
      (And.intro E.mipmapSelectionClosed
        (And.intro E.anisotropicFilteringClosed E.wrapModeClosed)))

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse