#include "Pythia8/Pythia.h"
namespace myv3 {
class Holder3 {
public:
    Holder3(std::string a):m_dir(a) {};
    void fill_next_event(Pythia8::Event& pyev);
    int m_counter=0;
    std::string  m_dir;
    ~Holder3() {};
};
}
