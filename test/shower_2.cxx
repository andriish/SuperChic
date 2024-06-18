#include "Pythia8Plugins/HepMC2.h"
#include "HepMC/IO_GenEvent.h"
#include "shower_2.h"
namespace myv2 {
void  Holder2::fill_next_event(Pythia8::Event& pyev) {
    system(("mkdir -p "+m_dir).c_str());
    auto  m_out = std::make_shared<HepMC::IO_GenEvent>(m_dir+"/"+std::to_string(m_counter)+".hepmc");
    HepMC::GenEvent m_evt;
    auto m_converter = std::make_shared<Pythia8::Pythia8ToHepMC>();
    m_converter->fill_next_event(pyev,m_evt);
    m_out->write_event(&m_evt);
    m_counter++;
}
}
