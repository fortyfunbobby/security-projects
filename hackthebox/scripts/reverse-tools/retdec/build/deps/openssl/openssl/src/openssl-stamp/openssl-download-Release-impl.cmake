set(command "/usr/bin/cmake;-P;/home/fortyfunbobby/hackthebox/scripts/reverse-tools/retdec/retdec-master/build/deps/openssl/openssl/src/openssl-stamp/download-openssl.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/bin/cmake;-P;/home/fortyfunbobby/hackthebox/scripts/reverse-tools/retdec/retdec-master/build/deps/openssl/openssl/src/openssl-stamp/verify-openssl.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/bin/cmake;-P;/home/fortyfunbobby/hackthebox/scripts/reverse-tools/retdec/retdec-master/build/deps/openssl/openssl/src/openssl-stamp/extract-openssl.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
