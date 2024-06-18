#include "shower_all.h"
#include "Pythia8Plugins/HepMC2.h"
namespace myvall {
void  Holderall::fill_next_event_2(Pythia8::Event& pyev) {
    HepMC::GenEvent m_evt;
    auto m_converter = std::make_shared<Pythia8::Pythia8ToHepMC>();
    m_converter->fill_next_event(pyev,m_evt,m_counter, m_pyinfo);
    m_out_2->write_event(&m_evt);
}
}
