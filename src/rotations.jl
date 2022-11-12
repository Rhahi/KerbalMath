"""
    planar_rotate(vec, base, θ)

Rotate `vec` around `base` by angle θ, while staying in the same plane.
Clockwise rotation in game.
"""
function planar_rotate(vec, base, θ)
    axis = cross(base, vec)
    axial_rotate(vec, axis, θ)
end
function planar_rotateₗ(vec, base, θ)
    axis = crossₗ(vec, base)
    axial_rotate(vec, axis, θ)
end

"""
    axial_rotate(vec, base, θ)

Rotate `vec` about `base` by angle θ.
Clockwise rotation in game.
"""
function axial_rotate(vec, axis, θ)
    â = axis / norm(axis)
    RotationVec((deg2rad(-θ)*â)...) * vec
end

"""
    angle_direction(r, θ, ϕ)

A new vector pointing at azimuth ϕ, pitched down by θ from vertical.
"""
function angle_direction(r, θ, ϕ)
    north = [0., 1., 0.]
    up = r/norm(r)
    east = cross(north, up)
    azi = axial_rotate(east, up, ϕ)
    planar_rotate(azi, up, θ-90°)
end
angle_directionₗ(r, θ, ϕ) = angle_direction(r, -θ, -ϕ)
