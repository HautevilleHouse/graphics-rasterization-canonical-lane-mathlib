import canonicalLaneMathlib.AdmissibleClass
import GraphicsRasterizationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RasterizationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse