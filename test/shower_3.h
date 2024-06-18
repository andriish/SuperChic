#include "Pythia8/Pythia.h"
namespace myv3 {
class Holder3 {
  public: 
  Holder3(std::string a);
  void writeNextEvent(Pythia8::Pythia & pythia);
  void* m_impl=nullptr; 
  ~Holder3();
};
}
