string(APPEND _ANDROID_ABI_INIT_CFLAGS
  " -funwind-tables"
  " -no-canonical-prefixes"
  )

if(NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE
    AND NOT CMAKE_SYSTEM_VERSION VERSION_LESS 16)
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

if(CMAKE_POSITION_INDEPENDENT_CODE)
  string(APPEND _ANDROID_ABI_INIT_EXE_LDFLAGS " -fPIE -pie")
endif()

string(APPEND _ANDROID_ABI_INIT_EXE_LDFLAGS " -Wl,--gc-sections")

if(NOT _ANDROID_ABI_INIT_EXE_LDFLAGS_NO_nocopyreloc)
  string(APPEND _ANDROID_ABI_INIT_EXE_LDFLAGS " -Wl,-z,nocopyreloc")
endif()