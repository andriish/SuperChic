#include "Pythia8/Pythia.h"
#include "HepMC3/WriterAsciiHepMC2.h"
#include "HepMC/IO_GenEvent.h"
namespace myvall {
class Holderall {
public:
    Holderall(std::string a, std::string b="_2", std::string c = "_3") {
        m_out_3 = std::make_shared<HepMC3::WriterAsciiHepMC2>(a+c);
        m_out_2 = std::make_shared<HepMC::IO_GenEvent>(a+b);
    };
    void fill_next_event(Pythia8::Event& pyev) {
        Pythia8::Event event2(pyev);
        Pythia8::Event event3(pyev);
        fill_next_event_2(event2);
        fill_next_event_3(event3);
    }
    void fill_next_event_2(Pythia8::Event& pyev);
    void fill_next_event_3(Pythia8::Event& pyev);
    int m_counter = 0;
    std::shared_ptr<HepMC3::WriterAsciiHepMC2> m_out_3;
    std::shared_ptr<HepMC::IO_GenEvent> m_out_2;
    ~Holderall() {};
};
}
