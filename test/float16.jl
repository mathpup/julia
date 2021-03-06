
f = float16(2.)
g = float16(1.)

@test f >= g
@test f > g
@test g < f
@test g <= g
@test all([g g] .< [f f])
@test all([g g] .<= [f f])
@test all([f f] .> [g g])
@test all([f f] .>= [g g])
@test isless(g, f)
@test !isless(f, g)

@test -f === float16(-2.)

@test f+g === float16(3f0)
@test f-g === float16(1f0)
@test f*g === float16(2f0)
@test f/g === float16(2f0)

@test f + 2 === float32(4f0)
@test f - 2 === float32(0f0)
@test f*2 === float32(4f0)
@test f/2 === float32(1f0)
@test f + 2. === 4.
@test f - 2. === 0.
@test f*2. === 4.
@test f/2. === 1.

@test_approx_eq sin(f) sin(2f0)

@test isnan(NaN16)
@test isnan(-NaN16)
@test !isnan(Inf16)
@test !isnan(-Inf16)
@test !isnan(float16(2.6))
@test NaN16 != NaN16
@test isequal(NaN16, NaN16)
@test repr(NaN16) == "NaN16"
@test sprint(showcompact, NaN16) == "NaN"

@test isinf(Inf16)
@test isinf(-Inf16)
@test !isinf(NaN16)
@test !isinf(-NaN16)
@test !isinf(float16(2.6))
@test Inf16 == Inf16
@test Inf16 != -Inf16
@test -Inf16 < Inf16
@test isequal(Inf16, Inf16)
@test repr(Inf16) == "Inf16"
@test sprint(showcompact, Inf16) == "Inf"

for z1 in (float16(0.0), float16(-0.0)), z2 in (float16(0.0), float16(-0.0))
    @test z1 == z2
    @test isequal(z1, z1)
    @test z1 === z1
    for elty in (Float32, Float64)
        z3 = convert(elty, z2)
        @test z1==z3
    end
end

@test float16(2.5) == float16(2.5)
@test float16(2.5) != float16(2.6)
@test isequal(float16(0.0), float16(0.0))
@test !isequal(float16(-0.0), float16(0.0))
@test !isequal(float16(0.0), float16(-0.0))

@test isnan(reinterpret(Float16,0x7c01))
@test !isinf(reinterpret(Float16,0x7c01))

@test nextfloat(Inf16) === Inf16
@test prevfloat(-Inf16) === -Inf16
