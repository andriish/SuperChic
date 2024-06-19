#include "shower_3.h"
#include "Pythia8Plugins/HepMC3.h"
#include "HepMC3/WriterAsciiHepMC2.h"
namespace myv3 {
void  Holder3::fill_next_event(Pythia8::Event& pyev) {
    system(("mkdir -p "+m_dir).c_str());
    auto  m_out = std::make_shared<HepMC3::WriterAsciiHepMC2>(m_dir+"/"+std::to_string(m_counter)+".hepmc");
    HepMC3::GenEvent m_evt;
    auto m_converter = std::make_shared<Pythia8::Pythia8ToHepMC>();
    m_converter->fill_next_event(pyev,m_evt);
    m_out->write_event(m_evt);
    m_counter++;
}
}
