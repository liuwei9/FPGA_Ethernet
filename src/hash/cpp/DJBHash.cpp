#include <iostream>
#include <string>
typedef uint32_t uint32;
uint32 DJBHash(std::string s);
int main()
{
    std::cout << DJBHash(std::string("C0A80164")) << std::endl;
    std::cout << DJBHash(std::string("C0A80164")) << std::endl;
    std::cout << DJBHash(std::string("C0A80165")) << std::endl;
    std::cout << DJBHash(std::string("C0A90165")) << std::endl;
	return 0;
}

uint32 DJBHash(std::string s) 
{
    long hash = 5381;
    for (int i = 0; i < s.length(); i++) {
        hash = ((hash << 5) + hash) + s.at(i);
        //System.out.println(hash);
    }
    return (hash & 0x7FFFFFFF);//32λ
}