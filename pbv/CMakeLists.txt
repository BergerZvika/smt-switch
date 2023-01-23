cmake_minimum_required(VERSION 3.5)
project(pbvsolver)

add_library(smtswitch STATIC IMPORTED)
set_target_properties(smtswitch PROPERTIES IMPORTED_LOCATION  "../../build/install/lib/libsmt-switch.so")
add_library(cvc5 STATIC IMPORTED)
set_target_properties(cvc5 PROPERTIES IMPORTED_LOCATION "../../build/install/lib/libsmt-switch-cvc5.so")
set(LIBS smtswitch cvc5)


# Add the include directory
include_directories(
	"../build/install/include/smt-switch"
	"../tests"
	"../build/install/lib"
)

# Add all the header files in the directory
file(GLOB_RECURSE headers "../build/install/include/smt-switch/*.h" "../tests/*.h")

add_executable(pbvsolver pbvsolver.cpp ${headers})

target_link_libraries(pbvsolver PUBLIC ${LIBS})