module KerbalMath

using LinearAlgebra
using Rotations
import LinearAlgebra: cross, norm, dot
import Base: +, -

export ∠θ, ×ₗ, crossₗ, hat
export planar_rotate, axial_rotate, axial_rotateₗ, angle_direction, angle_directionₗ
export V2T, T2V, F32, F64, I32, I64, UI32

include("conversions.jl")
include("linearalgebra.jl")
include("rotations.jl")

end # module KerbalMath
