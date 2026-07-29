import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

structure Framebuffer where
  colorAttachments : Type
  depthAttachment : Type
  colorClear : Prop
  depthClear : Prop
  formatCompatibility : Prop

structure FramebufferEvidence (F : Framebuffer) where
  colorClearClosed : F.colorClear
  depthClearClosed : F.depthClear
  formatCompatibilityClosed : F.formatCompatibility

def FramebufferClosed (F : Framebuffer) : Prop :=
  F.colorClear ∧ F.depthClear ∧ F.formatCompatibility

theorem framebuffer_closed_from_evidence (F : Framebuffer) (E : FramebufferEvidence F) :
    FramebufferClosed F :=
  And.intro E.colorClearClosed (And.intro E.depthClearClosed E.formatCompatibilityClosed)

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse
