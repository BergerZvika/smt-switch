cmake_minimum_required(VERSION 3.5)
project(pbvsolver)

# Include the directory where FindGMP.cmake is located
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Find the GMP library
find_package(GMP REQUIRED)

# Add the include directory
include_directories("${PROJECT_SOURCE_DIR}")
include_directories(
	"${PROJECT_SOURCE_DIR}/../build/install/include/smt-switch"
	"${PROJECT_SOURCE_DIR}/../tests"
	"${PROJECT_SOURCE_DIR}/../build/install/lib"
	)

message("-- Project directory source: ${PROJECT_SOURCE_DIR}")

# Add all the header files in the directory
file(GLOB headers "../build/install/include/smt-switch/*.h" "../tests/*.h")

# Add the directory containing libsmt-switch.a and libsmt-switch-cvc5.a to the project
link_directories("${PROJECT_SOURCE_DIR}/../build/install/lib")

add_executable(pbvsolver pbvsolver.cpp ${headers})

# Add the GMP include directories
target_include_directories(pbvsolver PUBLIC ${GMP_INCLUDE_DIRS})

# Link the static libraries to the executable
target_link_libraries(pbvsolver PUBLIC "${PROJECT_SOURCE_DIR}/../build/install/lib/libsmt-switch-cvc5.a")
target_link_libraries(pbvsolver PUBLIC "${PROJECT_SOURCE_DIR}/../build/install/lib/libsmt-switch.a")
target_link_libraries(pbvsolver PUBLIC ${GMP_LIBRARIES})

