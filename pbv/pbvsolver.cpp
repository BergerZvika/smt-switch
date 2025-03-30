#include <iostream>
#include <utility>
#include <vector>
// #include <unordered_map>
#include <fstream>
#include <string>
#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <stdexcept>
#include <map>

#include "smt_defs.h"
#include "cvc5_factory.h"
#include "smt.h"
#include "available_solvers.h"
#include "smtlib_reader.h"
#include "pbvsolver.h"

using namespace smt;
using namespace std;
using namespace smt_tests;

#define temp_file "temp.txt"

class SmtLibReaderTester : public SmtLibReader
{
 public:
  SmtLibReaderTester(SmtSolver & solver) : SmtLibReader(solver) {}

  Result check_sat() override
  {
    Result r = solver_->check_sat();
    // save the result to compare later
    results_.push_back(r);
    return r;
  }

  Result check_sat_assuming(const TermVec & assumptions) override
  {
    Result r = solver_->check_sat_assuming(assumptions);
    // save the result to compare later
    results_.push_back(r);
    return r;
  }

  const vector<Result> & get_results() const { return results_; };

 protected:
  vector<Result> results_;
};
std::map<std::string, int> pbv_args;
int help = 0;
int produce_model = 0;
int piand_sum_mode = 3;
int piand_mode = 1;
int difference_lemma = 1;
int skolem_lemma = 0;
int after_simplify = 0;
int get_value = 0;
int get_model = 0;
std::list<string> values;
std::list<string> cvc5_args;
string test = "";

void initializeMap() {
  pbv_args["debug"] = 0;
  pbv_args["pbvsolver"] = 0;
  pbv_args["postwalk"] = 1;
  pbv_args["bvsub"] = 0;
  pbv_args["type_check"] = 0;
  pbv_args["translate_smt"] = 0;
  pbv_args["simplify"] = -1;
  pbv_args["rewrite"] = 1;
  pbv_args["eliminate_or"] = 1;
  pbv_args["eliminate_xor"] = 1;
  pbv_args["redundent_axioms"] = 1;
  pbv_args["lazy_pow"] = 1;
  pbv_args["bvlshr"] = 1;
  pbv_args["multiple_bitwidth"] = 1;
  pbv_args["lazy_piand"] = 1;
  pbv_args["lemmas_piand"] = 1;
  pbv_args["lemmas_pow2"] = 2;
  pbv_args["one_k"] = 0;
  pbv_args["simplify_only"] = 0;
}

int simplifyNumber(const std::string& input) {
    // Check if the input starts with "--simplify="
    const std::string prefix = "--simplify=";
    if (input.rfind(prefix, 0) == 0) {  // Check if input starts with prefix
        std::string numberPart = input.substr(prefix.size());
        try {
            // Convert the number part to an integer
            int number = std::stoi(numberPart);
            return number;
        } catch (const std::invalid_argument&) {
            // Handle the case where conversion fails
            std::cerr << "Invalid format after --simplify=" << std::endl;
            return -1;
        }
    }
    return -1;
}

int cvc5_args_parse(const std::string& input) {
    // Check if the input starts with "--simplify="
    const std::string prefix = "--cvc5:";
    if (input.rfind(prefix, 0) == 0) {  // Check if input starts with prefix
      std::string arg = input.substr(prefix.size());
      cvc5_args.push_back(arg);
      return 1;
    }
    return 0;
}

void parse_args(int argc, char** argv) {
  vector<string> args(argv + 1, argv + argc);
    for (auto i = args.begin(); i != args.end(); ++i) {
      if (!(*i).compare("-h") ||  !(*i).compare("--help")) {
        help = 1;
        cout << "Syntax: ./pbvsolver <path/to/smt2>" << endl;
        cout << endl;
        cout << "\t-h / --help\t\t\tprint help command line arrgument on screen." << endl;
        cout << "\t-d / --debug\t\t\tprint to screen debug meeseges at runtime." << endl;
        // cout << "\t-t / --type-check\ttype checking before solving formula." << endl;
        cout << "\t--trans\t\t\t\tcreate smt2 file of the translation." << endl;
        cout << "\t--cvc5:{args}\t\t\tsend arguments to cvc5 solver. for example --cvc5:nl-cov or --cvc5:mbqi=fmc." << endl;
        cout << "\t\t\t\t\tyou can also send a list of arguments at once --cvc5:\"nl-cov mbqi\"." << endl;
        
        // cout << "\t-s / --simplify\t\tuse default simplify with bit-width 64." << endl;
        // cout << "\t-fs / --false-simplify\t\tuse simplify when simplify get false or true." << endl;
        // cout << "\t--simplify={num}\t\tuse simplify with bit-width num." << endl;
        // cout << "\t--produce-model\t\tuse produce model solver." << endl;
        cout << endl;
        cout << "\tpiand solver:" << endl;
        cout << "\t\t--cegar\t\t\tput all piand lemmas in cegar loop." << endl;
        cout << "\t\t--no-cegar\t\tput all piand lemmas in initilize." << endl;
        cout << "\t\t--no-sum-based-lemma\tremove sum based lemma." << endl;
        cout << "\t\t--sum-eq-lemma\t\tuse sum based lemma eq." << endl;
        cout << "\t\t--sum-ge-lemma\t\tuse sum based lemma ge." << endl;
        cout << "\t\t---sum-both-lemma\tuse sum based lemma eq + ge." << endl;
        cout << "\t\t--bitwise-based-lemma\tuse bitwised based lemma ibtead of sum lemma." << endl;
        cout << "\t\t--skolem-lemmas\t\tadd skolems lemmas." << endl;

        cout << endl;
        cout << "\tattributes of pbv solver:" << endl;
        cout << "\t\t-w / --no-postwalk\tdisable postwalk." << endl;
        cout << "\t\t-r / --rewrite\t\tdisable rewrite rules on pbv formula." << endl;
        cout << "\t\t--always-axioms\t\tinsert axioms in all formulas." << endl;
        cout << "\t\t--eager-pow\t\tsolved pow2 in eager approach." << endl;
        cout << "\t\t--eager-piand\t\tsolved piand in eager approach." << endl;
        cout << "\t\t--lazy-pow\t\tsolved pow2 in lazy approach." << endl;
        cout << "\t\t--lazy-piand\t\tsolved piand in lazy approach." << endl;
        cout << "\t\t--lemmas-pow\t\tadd our new lemmas to solved pow2." << endl;
        cout << "\t\t--lemmas-pow-all\tadd more new lemmas to solved pow2 (not in paper)." << endl;
        cout << "\t\t--lemmas-piand\t\tadd our new lemmas to solved piand." << endl;
        cout << "\t\t--one-k\t\t\toptimize cade19 solver with same k in all axioms." << endl;
        cout << "\t\t--no-elimination\tdo not eliminate bvor and bvxor to bvand." << endl;
        cout << "\t\t--bvor\t\t\tdo not eliminate bvor to bvand." << endl;
        cout << "\t\t--bvxor\t\t\tdo not eliminate bvxor to bvand." << endl;
        cout << "\t\t-mw / --one-bitwidth\tsolved only pbv formulas with one bitwidth." << endl;
        cout << "\t\t--no-sub\t\ttranslate x-y to x + (-y)." << endl;
        cout << "\t\t--no-solving\t\tnot use cvc5 solver just simplify." << endl;
        
        cout << endl;
        cout << "\tconfigurations from paper:" << endl;
        cout << "\t\t--baseline\t\tour implementation for cade19 approach." << endl;
        cout << "\t\t--pow2++\t\tlike baseline with new lemmas for pow2." << endl;
        cout << "\t\t--piand++\t\tlike baseline with new lemmas for piand." << endl;
        cout << "\t\t--pow2-l\t\tlike baseline with lazy solver for pow2." << endl;
        cout << "\t\t--piand-l\t\tlike baseline with lazy solver for piand." << endl;
        cout << "\t\t--or-e\t\t\tlike baseline with elimination for bvor operation." << endl;
        cout << "\t\t--xor-e\t\t\tlike baseline with elimination for bvxor operation." << endl;
        cout << "\t\t--sh-m-e\t\tlike baseline with elimination of mod in bvshl operation." << endl;
        cout << "\t\t--all-e\t\t\tlike baseline with elimination of bvor, bvxor and mod in bvshl." << endl;
        cout << "\t\t--eager-no-opt\t\tlike baseline with all eliminations, new lemmas for piand and pow2, supporting multiple bitwidth and redundant axioms." << endl;
        cout << "\t\t--eager\t\t\tlike eager-no-opt with optimization on the integer formula for eliminate mod." << endl;
        cout << "\t\t--eager-no-opt-B\tlike eager-no-opt with rewriter for the pbv formula." << endl;
        cout << "\t\t--eagerB\t\tlike eager-no-opt-B with optimization on the integer formula for eliminate mod." << endl;
        cout << "\t\t--lazy-no-opt\t\tlike eager-no-opt with lazy solvers for piand and pow2." << endl;
        cout << "\t\t--lazy\t\t\tlike eager with lazy solvers for piand and pow2." << endl;
        cout << "\t\t--lazy-no-opt-B\t\tlike eager-no-opt-B with lazy solvers for piand and pow2." << endl;
        cout << "\t\t--lazyB\t\t\tlike eagerB with lazy solvers for piand and pow2." << endl;
        cout << "\t\t--simp\t\t\tlike eagerB but not solved the formula just use cvc5 simplify." << endl;
        

        cout << endl;
        cout << "\tpbvsolver solver:" << endl;
        cout << "\t\t--pbvsolver\t\tuse default piand PBVSolver." << endl;
        cout << "\t\t-c / --combine\t\tuse eager piand approach PBVSolver with combaine (default)." << endl;
        cout << "\t\t-f / --full\t\tuse eager piand approach PBVSolver with full." << endl;
        cout << "\t\t-p / --partial\t\tuse eager piand approach PBVSolver with partial." << endl;
        cout << "\t\t-t19 / --cade19-translate\t\tuse  PBVSolver with cade19 translation." << endl;
        cout << "\t\t-m / --maxint\t\tnon pure piand solver, upper bound of bit-width 67108864." << endl;
        

        
      } else if (!(*i).compare("-d") ||  !(*i).compare("--debug")) {
        pbv_args["debug"] = 1;
      } else if (!(*i).compare("--pbvsolver")) {
        pbv_args["pbvsolver"] = 0; // efficient pbvsolver
      }  else if (!(*i).compare("-c") ||  !(*i).compare("--comb") ||  !(*i).compare("--combine")) {
        pbv_args["pbvsolver"] = 1; // combine
      } else if (!(*i).compare("-f") ||  !(*i).compare("--full")) {
        pbv_args["pbvsolver"] = 2; // full
      }  else if (!(*i).compare("-p") ||  !(*i).compare("--partial")) {
        pbv_args["pbvsolver"] = 3; //partial
      } else if (!(*i).compare("-m") ||  !(*i).compare("--maxint")) {
        pbv_args["pbvsolver"] = 4; // non pure pbv solver, k <= 67,108,864
      } else if (!(*i).compare("-t19") ||  !(*i).compare("--cade19-translate")) {
        pbv_args["pbvsolver"] = 5; // cade19 solver
      } else if (!(*i).compare("-w") ||  !(*i).compare("--no-postwalk")) { 
        pbv_args["postwalk"] = 0;
      } else if (!(*i).compare("--no-sub")) { 
        pbv_args["bvsub"] = 1;
      } else if (!(*i).compare("--always-axioms")) { 
        pbv_args["redundent_axioms"] = 0;
      } else if (!(*i).compare("--eager-pow")) { 
        pbv_args["lazy_pow"] = 0;
      } else if (!(*i).compare("--eager-piand")) { 
        pbv_args["lazy_piand"] = 0;
      } else if (!(*i).compare("--lazy-pow")) { 
        pbv_args["lazy_pow"] = 1;
      } else if (!(*i).compare("--lazy-piand")) { 
        pbv_args["lazy_piand"] = 1;
      }else if (!(*i).compare("--lemmas-pow-all")) { 
        pbv_args["lemmas_pow2"] = 1;
      } else if (!(*i).compare("--lemmas-pow")) { 
        pbv_args["lemmas_pow2"] = 2;
      } else if (!(*i).compare("--lemmas-piand")) { 
        pbv_args["lemmas_piand"] = 1;
      }   else if (!(*i).compare("--one-k")) { 
        pbv_args["one_k"] = 1;
      }  else if (!(*i).compare("--no-elimination")) { 
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
      } else if (!(*i).compare("--bvor")) { 
        pbv_args["eliminate_or"] = 0;
      } else if (!(*i).compare("--bvxor")) { 
        pbv_args["eliminate_xor"] = 0;
      } else if (!(*i).compare("-mw") || !(*i).compare("--no-multiple-bitwidth")) { 
        pbv_args["multiple_bitwidth"] = 0;
      } else if (!(*i).compare("--bvlshr") || !(*i).compare("-l")) { 
        pbv_args["bvlshr"] = 0;
      } else if (!(*i).compare("--no-solving")) { 
        pbv_args["simplify_only"] = 1;
      }  else if (!(*i).compare("--simp")) { 
        pbv_args["simplify_only"] = 1;
        pbv_args["postwalk"] = 1;
        pbv_args["rewrite"] = 1;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 1;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lazy_piand"] = 1;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
      } else if (!(*i).compare("--baseline")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--pow2++")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 2;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--piand++")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--pow2-l")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 1;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 2;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--piand-l")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 1;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--or-e")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["  "] = 1;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--xor-e")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 0;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--sh-m-e")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 0;
        pbv_args["eliminate_xor"] = 0;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--all-e")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 0;
        pbv_args["lazy_pow"] = 0;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["lemmas_piand"] = 0;
        pbv_args["lemmas_pow2"] = 0;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--eager-no-opt")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--eager")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 1;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--eager-no-opt-B")) {
        pbv_args["pbvsolver"] = 5; 
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 1;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--eagerB")) { 
        pbv_args["pbvsolver"] = 5;
        pbv_args["postwalk"] = 1;
        pbv_args["rewrite"] = 1;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 0;
        pbv_args["lazy_piand"] = 0;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
        pbv_args["one_k"] = 0;
      } else if (!(*i).compare("--lazy-no-opt")) { 
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 1;
        pbv_args["lazy_piand"] = 1;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
      } else if (!(*i).compare("--lazy")) { 
        pbv_args["postwalk"] = 1;
        pbv_args["rewrite"] = 0;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 1;
        pbv_args["lazy_piand"] = 1;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
      } else if (!(*i).compare("--lazy-no-opt-B")) { 
        pbv_args["postwalk"] = 0;
        pbv_args["rewrite"] = 1;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 1;
        pbv_args["lazy_piand"] = 1;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
      } else if (!(*i).compare("--lazyB")) { 
        pbv_args["postwalk"] = 1;
        pbv_args["rewrite"] = 1;
        pbv_args["eliminate_or"] = 1;
        pbv_args["eliminate_xor"] = 1;
        pbv_args["redundent_axioms"] = 1;
        pbv_args["lazy_pow"] = 1;
        pbv_args["lazy_piand"] = 1;
        pbv_args["bvlshr"] = 1;
        pbv_args["multiple_bitwidth"] = 1;
        pbv_args["lemmas_piand"] = 1;
        pbv_args["lemmas_pow2"] = 2;
      }else if (simplifyNumber(*i) >= 0) { 
        pbv_args["simplify"] = simplifyNumber(*i);
      } else if (!(*i).compare("-s") || !(*i).compare("--simplify")) { 
        pbv_args["simplify"] = 64;
      } else if (!(*i).compare("-fs") || !(*i).compare("--false-simplify")) {
        if (pbv_args["simplify"] > 0) {
          pbv_args["simplify"] = pbv_args["simplify"] * -1;
        } else {
          pbv_args["simplify"] = -64;
        }
      } else if (cvc5_args_parse(*i)) {
        continue;
      } else if (!(*i).compare("--produce-model")) {
        produce_model = 1;
      } else if (!(*i).compare("--cegar")) {
        piand_mode = 2;
      } else if (!(*i).compare("--no-cegar")) {
        piand_mode = 3;
      } else if (!(*i).compare("--piand-solver")) {
        piand_mode = 4;
      }else if (!(*i).compare("--no-sum-based-lemma")) {
        piand_sum_mode = 0;
      } else if (!(*i).compare("--sum-eq-lemma")) {
        piand_sum_mode = 1;
      }  else if (!(*i).compare("--sum-ge-lemma")) {
        piand_sum_mode = 3;
      } else if (!(*i).compare("--sum-both-lemma")) {
        piand_sum_mode = 4;
      } else if (!(*i).compare("--bitwise-based-lemma")) {
        piand_sum_mode = 2;
      } else if (!(*i).compare("--no-difference-lemma")) {
        difference_lemma = 0;
      } else if (!(*i).compare("--skolem-lemmas")) {
        skolem_lemma = 1;
      } else if (!(*i).compare("--trans")) {
        pbv_args["translate_smt"] = 1;
      } else if (!(*i).compare("-t") ||  !(*i).compare("--type-check")) {
        pbv_args["type_check"] = 1;
      } else if (!(*i).compare("-r") ||  !(*i).compare("--no-rewrite")) {
        pbv_args["rewrite"] = 0;
      } else if (!(*i).compare("--get-value")) {
        get_value = 1;
      }   else if (!(*i).compare("--get-model")) {
        get_model = 1;
      } else if ((*i).length() >= 5 && (*i).compare((*i).length() - 5, 5, ".smt2") == 0) {
        test = (*i);
      } else {
        throw std::runtime_error("Invalid Argument: " + *i + "\n\tplease run again with -h to show valid arguments.");
      }
  }
}

void create_translate_smt() {
    std::string end = "";
    // output file
    std::string out = test.substr(test.find_last_of("/\\") + 1);
    out = out.substr(0, out.find_last_of(".")) + "_translate.smt2";
    std::ofstream outFile(out);
    if (!outFile) {
        throw std::runtime_error("Unable to create the file: " + out);
    }
    if (pbv_args["pbvsolver"]) {
      outFile << "(set-logic UFNIA)" << std::endl;
      outFile << "(declare-fun bvand (Int Int Int) Int)" << std::endl;
      if (pbv_args["eliminate_or_xor"] == 0) {
        outFile << "(declare-fun bvor (Int Int Int) Int)" << std::endl;
        outFile << "(declare-fun bvxor (Int Int Int) Int)" << std::endl;
      }
      if (pbv_args["lazy_pow"] == 0) {
        outFile << "(declare-fun ufpow (Int) Int)" << std::endl;
      }
    } else {
      outFile << "(set-logic UFNIA)" << std::endl;
    } 


    // read the origion file
    std::ifstream origion(test);
    if (!origion) {
        throw std::runtime_error("Unable to open the file: " + test);
    }
    int assert = 0;
    bool isfun = false;
    std::string line;
    while (std::getline(origion, line)) {
        size_t bitvec_pos = line.find("_ BitVec");
        size_t logic_pos = line.find("set-logic");
        size_t assert_pos = line.find("assert");
        if (assert_pos != std::string::npos) {
          assert++;
        } else if (logic_pos != std::string::npos) {
           continue;
        } else if (assert) {
          size_t check_pos = line.find("(check");
          size_t get_pos = line.find("(get-");
          size_t set_pos = line.find("(set-");
          size_t exit_pos = line.find("(exit)");
          size_t push_pos = line.find("(push");
          size_t pop_pos = line.find("(pop");
          if (check_pos != std::string::npos || get_pos != std::string::npos || set_pos != std::string::npos || 
              exit_pos != std::string::npos ||  push_pos != std::string::npos || pop_pos != std::string::npos) {
            end += line + "\n";
          }
        } else if (bitvec_pos != std::string::npos) {
            size_t declareFunPos = line.find("declare-fun");
            size_t declareConstPos = line.find("declare-const");
            size_t defineFunPos = line.find("define-fun");
            // Found "_BitVec" in the line, replace it with "int"
            if (declareFunPos != std::string::npos) {
              line = line.substr(0, bitvec_pos - 4) + "Int)";
              line.replace(declareFunPos, std::string("declare-fun ").length(), "declare-const _pbv_");
            }
            else if (declareConstPos != std::string::npos) {
              line = line.substr(0, bitvec_pos - 1) + "Int)";
              line.replace(declareConstPos, std::string("declare-const ").length(), "declare-const _pbv_");
            } else if (defineFunPos != std::string::npos) {
              isfun = true;
              continue;
            } 
        }
        if (!assert && !isfun) {
          outFile << line << std::endl;
        }
    }
    origion.close();

    // read the translate formula
    std::ifstream temp(temp_file);
    if (!temp) {
        throw std::runtime_error(std::string("Unable to open the file: ") + temp_file);
    }
    std::string formula;
    while (std::getline(temp, formula))  {
      outFile << "(assert " << formula << ")" <<  endl;
    }
    outFile << end;

    temp.close();
    outFile.close();
    // remove temp_file
    if (std::remove(temp_file) != 0) {
        throw std::runtime_error(std::string("Unable to open the file: ") + temp_file);
    }
}



int main(int argc, char** argv){
  initializeMap();
  // parse arguments
  parse_args(argc, argv);
  if (help) {
    return 0;
  }
  if (!test.compare("")) {
    cout << "Missing path to smt2 file!" << endl;
    return 0;
  }
  if (pbv_args["debug"]) {
    cout << "test path: " << test << endl;
  }

  // create pbvsolver
  SmtSolver s, type_checker;
  SmtSolver cvc5 = Cvc5SolverFactory::create(false);
  s = std::make_shared<PBVSolver>(cvc5, pbv_args);
  s->set_logic("UFNIA");
  s->set_opt("incremental", "false");

  // solver options
  std::size_t equal_pos;
  for (auto arg : cvc5_args) {
    arg.erase(remove(arg.begin(), arg.end(), '\"' ), arg.end());
    size_t pos = 0;
    std::string token;
    while (1) {
      pos = arg.find(' ');
      token = arg.substr(0, pos);
      equal_pos = token.find('=');
      if (equal_pos != std::string::npos) { // Check if '=' is found
          // Split the string into two parts: before and after '='
          std::string key = token.substr(0,equal_pos);         // Before '='
          std::string value = token.substr(equal_pos + 1);       // After '='
          s->set_opt(key, value);
      } else {
        std::string prefix = "no-";
        if (token.rfind(prefix, 0) == 0) {
          token =  token.substr(prefix.length());
          s->set_opt(token, "false");
        } else {
          s->set_opt(token, "true");
        }
      }
      arg.erase(0, pos + 1);
      if (pos == std::string::npos) {
          break;
      }
    }
    equal_pos = arg.find('=');
    if (equal_pos != std::string::npos) { // Check if '=' is found
      // Split the string into two parts: before and after '='
        std::string key = arg.substr(0,equal_pos);         // Before '='
        std::string value = arg.substr(equal_pos + 1);       // After '='
        s->set_opt(key, value);
    } else {
        s->set_opt(arg, "true");
    }
  }

  // if(get_value) {
  //   s->set_opt("produce-model", "true");
  // }
  // if(get_model) {
  //   s->set_opt("produce-model", "true");
  // }
  //piand mode options
  if (piand_mode == 1) {
    s->set_opt("piand-mode", "piand");
  } else if (piand_mode == 2) {
    s->set_opt("piand-mode", "cegar");
  } else if (piand_mode == 3) {
    s->set_opt("piand-mode", "no-cegar");
  }  else if (piand_mode == 4) {
    s->set_opt("piand-mode", "piand_opt");
  }
  // sum lemma options
  if (piand_sum_mode == 1) {
    s->set_opt("piand-lemmas-mode", "sum");
  } else if (piand_sum_mode == 2) {
    s->set_opt("piand-lemmas-mode", "bitwise");
  } else if (piand_sum_mode == 3) {
    s->set_opt("piand-lemmas-mode", "sum_ge");
  } else if (piand_sum_mode == 4) {
    s->set_opt("piand-lemmas-mode", "sum_both");
  } else if (piand_sum_mode == 0) {
    s->set_opt("piand-lemmas-mode", "difference");
  }
  if(difference_lemma){
    s->set_opt("difference-lemmas", "true");
  }
  if(skolem_lemma) {
    s->set_opt("skolem-lemmas", "true");
  }

  // type checker
  if (pbv_args["type_check"]) {
    // zero signifies the absence of debugging
    // type_checker = std::make_shared<PBVSolver>(Cvc5SolverFactory::create(false), 0, pbv_args["pbvsolver"], pbv_args["postwalk"], pbv_args["type_check"], pbv_args["translate_smt"], pbv_args["bvsub"], pbv_args["simplify"], pbv_args["rewrite"]);
    SmtSolver cvc5_type_check = Cvc5SolverFactory::create(false);
    type_checker = std::make_shared<PBVSolver>(cvc5_type_check, pbv_args);

    SmtLibReaderTester* type_reader = new SmtLibReaderTester(type_checker);
    type_reader->parse(test);
    auto type_results = type_reader->get_results();
    if (type_results[0].is_unsat()) {
        throw std::runtime_error("Type Checker Error!");
    }
    pbv_args["type_check"] = 0;
  }
  // run solver on test.
  if (pbv_args["debug"]) {
    switch(pbv_args["pbvsolver"]) {
      case 0: cout << "Piand PBVSolver:" << endl;
        break;
      case 1: cout << "Combine PBVSolver:" << endl;
        break;
      case 2: cout << "Full PBVSolver:" << endl;
        break;
      case 3: cout << "Partial PBVSolver:" << endl;
        break;
      case 4: cout << "Non-Pure Piand PBVSolver:" << endl;
        break;
      case 5: cout << "CADE19 Solver:" << endl;
        break;
      default: break;
    }
    cout << "    Multiple_bitwidth: " << (pbv_args["multiple_bitwidth"] ? "yes":"no") << endl;
    cout << "    Lazy pow: \t\t" << (pbv_args["lazy_pow"] ? "yes":"no") << endl;
    cout << "    Lazy piand: \t" << (pbv_args["lazy_piand"] ? "yes":"no") << endl;
    cout << "    Eliminate or: \t" << (pbv_args["eliminate_or"] ? "yes":"no") << endl;
    cout << "    Eliminate xor: \t" << (pbv_args["eliminate_xor"] ? "yes":"no") << endl;
    cout << "    Remove mod in lshr: " << (pbv_args["bvlshr"] ? "yes":"no") << endl;
    cout << "    Lemmas piand: \t" << (pbv_args["lemmas_piand"] ? "yes":"no") << endl;
    cout << "    Lemmas pow: \t" << (pbv_args["lemmas_pow2"] ? "yes":"no") << endl;
    cout << "    Redundent_axioms: \t" << (pbv_args["redundent_axioms"] ? "yes":"no") << endl;
    cout << "    PBV Rewrite: \t" << (pbv_args["rewrite"] ? "yes":"no") << endl;
    cout << "    Arith Rewrite: \t" << (pbv_args["postwalk"] ? "yes":"no") << endl;
    cout << "    Solved: \t\t" << (pbv_args["simplify_only"] ? "no":"yes") << endl;
    cout <<  endl;
  }

  try {
    SmtLibReaderTester* reader = new SmtLibReaderTester(s);
    reader->parse(test);
    if (pbv_args["translate_smt"]) {
      create_translate_smt();
      return 1;
    } else if(pbv_args["simplify"] == 0) {
      return 1;
    }
    auto results = reader->get_results();
    cout << results[0] << endl;
  } catch (...) {
      cout << "unknown" << endl;
  } 
  return 0;
}