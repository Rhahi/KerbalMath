"""
Rotate `vec` around `base` by angle θ°, while staying in the same plane.
base vector is found using cross product from vec to base, and use RHR to rotate.
"""
function planar_rotate(vec::AbstractArray, base::AbstractArray, θ)
    axis = cross(vec, base)
    axial_rotate(vec, axis, θ)
end
function planar_rotate(vec::NTuple{3, T}, base::NTuple{3, T}, θ) where T <: Real
    V2T(planar_rotate(T2V(vec), T2V(base), θ))
end

"Rotate `vec` about `base` by angle θ° (right hand rule)"
function axial_rotate(vec::AbstractArray, axis::AbstractArray, θ)
    n = axis / norm(axis)
    RotationVec((deg2rad(θ)*n)...) * vec
end
function axial_rotate(vec::NTuple{3, T}, axis::NTuple{3, T}, θ) where T <: Real
    V2T(axial_rotate(T2V(vec), T2V(axis), θ))
end

"Rotate `vec` about `base` by angle θ° (left hand rule)"
axial_rotateₗ(vec, axis, θ) = axial_rotate(vec, axis, -θ)

"""
    angle_direction(r, θ, ϕ)

A new vector pointing at azimuth ϕ°, pitched down by θ° from vertical.
"""
function angle_direction(r, θ, ϕ, north)
    up = r./norm(r)
    east = cross(north, up)
    azi = axial_rotate(east, up, ϕ+90)
    planar_rotate(azi, up, θ)
end
angle_direction(r::NTuple{3, T}, θ, ϕ; north=(0., 1., 0.)) where T <: Real = angle_direction(r, θ, ϕ, north)
angle_direction(r::AbstractArray, θ, ϕ; north=[0., 1., 0.]) = angle_direction(r, θ, ϕ, north)
angle_directionₗ(r, θ, ϕ) = angle_direction(r, -θ+180, -ϕ)
