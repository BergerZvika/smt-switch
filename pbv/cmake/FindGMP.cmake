# FindGMP.cmake
# Search for the GMP static library and header files

set(_GMP_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
set(CMAKE_FIND_LIBRARY_SUFFIXES .a)

find_path(GMP_INCLUDE_DIR gmp.h PATH_SUFFIXES gmp)
find_library(GMP_LIBRARIES NAMES gmp libgmp PATH_SUFFIXES lib
             PATHS /usr/lib /usr/local/lib /opt/local/lib /usr/lib/x86_64-linux-gnu)

# Check if the GMP library and header files are found
if (GMP_INCLUDE_DIR AND GMP_LIBRARIES)
    set(GMP_FOUND TRUE)
endif ()

# Provide variables for the GMP library and header files
if (GMP_FOUND)
    if (NOT GMP_FIND_QUIETLY)
        message(STATUS "Found GMP: ${GMP_LIBRARIES}")
    endif ()
else ()
    if (GMP_FIND_REQUIRED)
        message(FATAL_ERROR "GMP library not found")
    endif ()
endif ()

# Set the GMP_INCLUDE_DIRS variable
set(GMP_INCLUDE_DIRS ${GMP_INCLUDE_DIR})

# Export the variables
if (NOT GMP_FIND_QUIETLY)
    get_directory_property(PARENT_DIRECTORY PARENT_SCOPE)
    mark_as_advanced(GMP_INCLUDE_DIRS GMP_LIBRARIES)
endif ()
