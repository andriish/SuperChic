#include "shower_3.h"
#include "HepMC3/Print.h"
#include "Pythia8Plugins/HepMC3.h"

namespace myv3 {
  Holder3::Holder3(std::string a){  m_impl = new Pythia8:: Pythia8ToHepMC(a,Pythia8::Pythia8ToHepMC::OutputType::ascii3); }
  void Holder3::writeNextEvent(Pythia8::Pythia & pythia) {
	  printf("fill\n");
	  auto *x = ((Pythia8:: Pythia8ToHepMC*)m_impl);
	  HepMC3::GenEvent evt;
	  x->fill_next_event(pythia,evt);
	  HepMC3::Print::content(evt);
	  //->writeNextEvent(pythia);
	  } 
  Holder3::~Holder3(){ auto* x = (Pythia8:: Pythia8ToHepMC*)m_impl; delete x;}
}
