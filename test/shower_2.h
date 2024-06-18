#include "Pythia8/Pythia.h"
namespace myv2 {
class Holder2 {
public:
    Holder2(std::string a):m_dir(a) {};
    void fill_next_event(Pythia8::Event& pyev);
    int m_counter=0;
    std::string  m_dir;
    ~Holder2() {};
};
}
