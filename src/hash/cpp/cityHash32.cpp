/*
The code references Google's CityHash, linked at https://github.com/google/cityhash
*/



#include <iostream>


typedef uint32_t uint32;
static const uint32 c1 = 0xcc9e2d51;
static const uint32 c2 = 0x1b873593;

#ifdef WORDS_BIGENDIAN
#define uint32_in_expected_order(x) (bswap_32(x))
#define uint64_in_expected_order(x) (bswap_64(x))
#else
#define uint32_in_expected_order(x) (x)
#define uint64_in_expected_order(x) (x)
#endif

static uint32 UNALIGNED_LOAD32(const char* p) {
	uint32 result;
	memcpy(&result, p, sizeof(result));
	return result;
}

static uint32 Fetch32(const char* p) {
	return uint32_in_expected_order(UNALIGNED_LOAD32(p));
}

static uint32 Rotate32(uint32 val, int shift) {
	// Avoid shifting by 32: doing so yields an undefined result.
	return shift == 0 ? val : ((val >> shift) | (val << (32 - shift)));
}



#include <stdlib.h>
#define bswap_32(x) _byteswap_ulong(x)
#define bswap_64(x) _byteswap_uint64(x)

#undef PERMUTE3
#define PERMUTE3(a, b, c) do { std::swap(a, b); std::swap(a, c); } while (0)

uint32 CityHash32(const char* s, size_t len);

#define C(x) 0x ## x ## ULL
int main()
{
	std::cout << CityHash32("0x9ae16a3b2f90404f", 32) << std::endl;
	std::cout << CityHash32("0x9ae16a3b2f90404f", 32) << std::endl;
	std::cout << CityHash32("0x9ae16a3b2f90404e", 32) << std::endl;
	return 0;
}

uint32 CityHash32(const char* s, size_t len) {

	// len > 24
	uint32 h = static_cast<uint32>(len), g = c1 * h, f = g;
	uint32 a0 = Rotate32(Fetch32(s + len - 4) * c1, 17) * c2;
	uint32 a1 = Rotate32(Fetch32(s + len - 8) * c1, 17) * c2;
	uint32 a2 = Rotate32(Fetch32(s + len - 16) * c1, 17) * c2;
	uint32 a3 = Rotate32(Fetch32(s + len - 12) * c1, 17) * c2;
	uint32 a4 = Rotate32(Fetch32(s + len - 20) * c1, 17) * c2;
	h ^= a0;
	h = Rotate32(h, 19);
	h = h * 5 + 0xe6546b64;
	h ^= a2;
	h = Rotate32(h, 19);
	h = h * 5 + 0xe6546b64;
	g ^= a1;
	g = Rotate32(g, 19);
	g = g * 5 + 0xe6546b64;
	g ^= a3;
	g = Rotate32(g, 19);
	g = g * 5 + 0xe6546b64;
	f += a4;
	f = Rotate32(f, 19);
	f = f * 5 + 0xe6546b64;
	size_t iters = (len - 1) / 20;
	do {
		uint32 a0 = Rotate32(Fetch32(s) * c1, 17) * c2;
		uint32 a1 = Fetch32(s + 4);
		uint32 a2 = Rotate32(Fetch32(s + 8) * c1, 17) * c2;
		uint32 a3 = Rotate32(Fetch32(s + 12) * c1, 17) * c2;
		uint32 a4 = Fetch32(s + 16);
		h ^= a0;
		h = Rotate32(h, 18);
		h = h * 5 + 0xe6546b64;
		f += a1;
		f = Rotate32(f, 19);
		f = f * c1;
		g += a2;
		g = Rotate32(g, 18);
		g = g * 5 + 0xe6546b64;
		h ^= a3 + a1;
		h = Rotate32(h, 19);
		h = h * 5 + 0xe6546b64;
		g ^= a4;
		g = bswap_32(g) * 5;
		h += a4 * 5;
		h = bswap_32(h);
		f += a0;
		PERMUTE3(f, h, g);
		s += 20;
	} while (--iters != 0);
	g = Rotate32(g, 11) * c1;
	g = Rotate32(g, 17) * c1;
	f = Rotate32(f, 11) * c1;
	f = Rotate32(f, 17) * c1;
	h = Rotate32(h + g, 19);
	h = h * 5 + 0xe6546b64;
	h = Rotate32(h, 17) * c1;
	h = Rotate32(h + f, 19);
	h = h * 5 + 0xe6546b64;
	h = Rotate32(h, 17) * c1;
	return h;
}