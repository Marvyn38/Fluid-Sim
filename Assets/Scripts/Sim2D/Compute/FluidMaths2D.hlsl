const float Poly6ScalingFactor;
const float SpikyPow3ScalingFactor;
const float SpikyPow2ScalingFactor;
const float SpikyPow3DerivativeScalingFactor;
const float SpikyPow2DerivativeScalingFactor;

float SmoothingKernelPoly6(float dstsqr, float radius)
{
    float radiussqr = radius * radius;
    if (dstsqr < radiussqr)
	{
        float v = radiussqr - dstsqr;
		return v * v * v * Poly6ScalingFactor;
	}
	return 0;
}

float SpikyKernelPow3(float dst, float radius)
{
	if (dst < radius)
	{
		float v = radius - dst;
		return v * v * v * SpikyPow3ScalingFactor;
	}
	return 0;
}

float SpikyKernelPow2(float dst, float radius)
{
	if (dst < radius)
	{
		float v = radius - dst;
		return v * v * SpikyPow2ScalingFactor;
	}
	return 0;
}

float DerivativeSpikyPow3(float dst, float radius)
{
	if (dst <= radius)
	{
		float v = radius - dst;
		return -v * v * SpikyPow3DerivativeScalingFactor;
	}
	return 0;
}

float DerivativeSpikyPow2(float dst, float radius)
{
	if (dst <= radius)
	{
		float v = radius - dst;
		return -v * SpikyPow2DerivativeScalingFactor;
	}
	return 0;
}
