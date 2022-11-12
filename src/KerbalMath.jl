module KerbalMath

using LinearAlgebra
import LinearAlgebra: cross, norm, dot
import Base: +, -

export ∠θ, ×ₗ, crossₗ
export planar_rotate, planar_rotateₗ, axial_rotate, angle_direction, angle_directionₗ

include("linearalgebra.jl")
include("rotations.jl")

end # module KerbalMath
