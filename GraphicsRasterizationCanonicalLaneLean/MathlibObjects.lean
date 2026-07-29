import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GraphicsRasterizationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure RasterizationSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure RasterizationAdmittedObject where
  space : RasterizationSpace
  closedTwoManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure RasterizationEndgameState where
  object : RasterizationAdmittedObject

def RasterizationWitnessClosed (O : RasterizationAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end GraphicsRasterizationCanonicalLaneLean
end HautevilleHouse