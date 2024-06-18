#include "shower_all.h"
#include "Pythia8Plugins/HepMC3.h"
#include "HepMC3/WriterAsciiHepMC2.h"
namespace myvall {
void  Holderall::fill_next_event_3(Pythia8::Event& pyev) {
    HepMC3::GenEvent m_evt;
    auto m_converter = std::make_shared<Pythia8::Pythia8ToHepMC>();
    m_converter->fill_next_event(pyev,m_evt);
    m_out_3->write_event(m_evt);
    m_counter++;
}
}
