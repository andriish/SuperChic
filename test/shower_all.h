#include "Pythia8/Pythia.h"
#include "HepMC3/WriterAsciiHepMC2.h"
#include "HepMC/IO_GenEvent.h"
#include <filesystem>
#include <iostream>
namespace fs = std::filesystem;
namespace myvall {
class Holderall {
public:
    Holderall(std::string a, std::string b="_2", std::string c = "_3", std::string d = "_f") {
        fs::path ap{a};
        fs::create_directory(ap.parent_path() / b);
        fs::create_directory(ap.parent_path() / c);
        fs::create_directory(ap.parent_path() / d);
        auto ri3 = std::make_shared<HepMC3::GenRunInfo>();
        auto rifix = std::make_shared<HepMC3::GenRunInfo>();
        ri3->set_weight_names({"Weight"});
        rifix->set_weight_names({"Weight"});
        m_out_3 = std::make_shared<HepMC3::WriterAsciiHepMC2>(ap.parent_path() / c /ap.filename(),ri3);
        m_out_fix = std::make_shared<HepMC3::WriterAsciiHepMC2>(ap.parent_path() / d /ap.filename(),rifix);
        m_out_2 = std::make_shared<HepMC::IO_GenEvent>(ap.parent_path() / b / ap.filename());
    };
    void fill_next_event(Pythia8::Event& pyev,const Pythia8::Info*  pyinfo) {
        m_counter++;
        m_pyinfo = pyinfo;
        Pythia8::Event event2(pyev);
        Pythia8::Event event3(pyev);
        Pythia8::Event eventfix(pyev);
        fill_next_event_2(event2);
        fill_next_event_3(event3);
        fill_next_event_fix(eventfix);
    }
    void fill_next_event_2(Pythia8::Event& pyev);
    void fill_next_event_3(Pythia8::Event& pyev);
    void fill_next_event_fix(Pythia8::Event& pyev);
    int m_counter = 0;
    std::shared_ptr<HepMC3::WriterAsciiHepMC2> m_out_fix;
    std::shared_ptr<HepMC3::WriterAsciiHepMC2> m_out_3;
    std::shared_ptr<HepMC::IO_GenEvent> m_out_2;
    const Pythia8::Info* m_pyinfo = nullptr;
    ~Holderall() {};
};
}
