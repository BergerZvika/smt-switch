#pragma once

#include <string>

namespace pbv {

// Front-end for the PBV logic.
//
// A PBV file declares parametric bit-vectors with the width-free sort
// PBitVec and refers to widths through (pbvsize t). pbvsolver's integer
// translation works on the ALL-logic encoding, where every bit-vector sort
// carries its width term: (_ BitVec k). This front-end infers a width term
// for every PBitVec (union-find over terms that must have equal width, as in
// cvc5's pbv-to-int pass) and rewrites the file into that ALL encoding, so a
// PBV file goes through exactly the same translation as its ALL counterpart.
//
// Widths that nothing pins to an existing term become fresh Int constants
// named k, k1, k2, ... (skipping names already used in the file).

// True if the file sets the PBV logic: (set-logic PBV).
bool is_pbv_logic_file(const std::string & path);

// Translate the PBV-logic text into ALL-logic text.
// Throws std::runtime_error on input it cannot type.
std::string pbv_to_all(const std::string & text);

// Translate the PBV-logic file at in_path and write the result to out_path.
void pbv_file_to_all(const std::string & in_path, const std::string & out_path);

}  // namespace pbv
