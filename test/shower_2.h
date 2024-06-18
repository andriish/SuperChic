#include "Pythia8/Pythia.h"
namespace myv2 {
class Holder {
  public: 
  Holder(std::string a);
  void writeNextEvent(Pythia8::Pythia & pythia);
  void* m_impl=nullptr; 
~Holder();
};
}
