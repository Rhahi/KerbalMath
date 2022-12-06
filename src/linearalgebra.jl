"Angle between two vectors"
function ∠θ(vec1::NTuple{3, T}, vec2::NTuple{3, T}, norm1::U, norm2::U) where {T <: Real, U <: Real}
    return acos(max(-1, min(1, sum(vec1.*vec2)/norm1/norm2)))
end
∠θ(vec1::NTuple{3, T}, vec2::NTuple{3, T}) where {T <: Real} = ∠θ(vec1, vec2, norm(vec1), norm(vec2))
function ∠θ(vec1::AbstractVector, vec2::AbstractVector, norm1::Real, norm2::Real)
    return acos(max(-1, min(1, (vec1⋅vec2)/norm1/norm2)))
end
∠θ(vec1::AbstractVector, vec2::AbstractVector) = ∠θ(vec1, vec2, norm(vec1), norm(vec2))

norm(vec::NTuple{3, T}) where T <: Real = sqrt(sum(vec.^2))
dot(vec1::NTuple{3, T}, vec2::NTuple{3, T}) where T <: Real = sum(vec1.*vec2)

function cross(v1::NTuple{3, T}, v2::NTuple{3, T}) where T <: Real
    (v1[2]v2[3] - v1[3]v2[2], v1[3]v2[1] - v1[1]v2[3], v1[1]v2[2] - v1[2]v2[1])
end

"Cross product with left-hand rule"
crossₗ(v1::NTuple{3, T}, v2::NTuple{3, T}) where T <: Real = cross(v1, v2).*-1
crossₗ(v1::AbstractVector, v2::AbstractVector) = cross(v2, v1)

"Cross product with left-hand rule"
×ₗ(v1::NTuple{3, T}, v2::NTuple{3, T}) where T <: Real = crossₗ(v1, v2)
×ₗ(v1::AbstractVector, v2::AbstractVector) = cross(v2, v1)


"Direction vector of length 1. Do not give a vector with length 0."
hat(vec::AbstractVector) = vec / norm(vec)
hat(vec::NTuple{3, Number}) = vec ./ norm(vec)
