#!/usr/bin/python3
import json
import sys

f = open(sys.argv[1])
data = json.load(f)

for i in data:
    if (i['arguments'][0] == "/usr/local/bin/arm-eabi-gcc"):
        i['arguments'][0] = "/home/ggordon/repo/vendor/persistent/arm-eabi/bin/arm-eabi-gcc"
    else:
        if (i['arguments'][0] == "/usr/local/bin/arm-linux-androideabi-clang"):
            i['arguments'][0] = "/home/ggordon/repo/vendor/persistent/standalone-toolchain/bin/arm-linux-androideabi-clang"
        if (i['arguments'][0] == "/usr/local/bin/arm-linux-androideabi-clang++"):
            i['arguments'][0] = "/home/ggordon/repo/vendor/persistent/standalone-toolchain/bin/arm-linux-androideabi-clang++"
        i['arguments'].insert(1, "--target=armv7a-linux-androideabi28")
        i['arguments'].insert(1, "--sysroot=/home/ggordon/repo/vendor/persistent/standalone-toolchain/sysroot")
        i['arguments'].insert(2, "-I")
        i['arguments'].insert(3, "/home/ggordon/repo/vendor/persistent/standalone-toolchain/sysroot/usr/include")

f.close()

with open(sys.argv[1], "w") as outfile:
    json.dump(data, outfile, indent=4)
