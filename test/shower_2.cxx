
#include "Pythia8Plugins/HepMC2.h"
#include "shower_2.h"
namespace myv2 {
 
  Holder::Holder(std::string a){  m_impl = new Pythia8:: Pythia8ToHepMC(a); }
  void Holder::writeNextEvent(Pythia8::Pythia & pythia) { //((Pythia8:: Pythia8ToHepMC*)m_impl)->writeNextEvent(pythia);
	  
	  } 
  Holder::~Holder(){ auto* x = (Pythia8:: Pythia8ToHepMC*)m_impl; delete x;}
}
