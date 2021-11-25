import json
import sys

f = open(sys.argv[1])
data = json.load(f)

for i in data:
    if (len(sys.argv) > 2):
        i['arguments'][0] = "/home/gabe/repo/vendor/persistent/standalone-toolchain/bin/arm-linux-androideabi-clang"
    else:
        i['arguments'][0] = "/home/gabe/repo/vendor/persistent/standalone-toolchain/bin/arm-linux-androideabi-clang++"
    i['arguments'].insert(1, "--target=arm-linux-androideabi")
    i['arguments'].insert(1, "--sysroot=/home/gabe/repo/vendor/persistent/standalone-toolchain/sysroot")

# Closing file
f.close()

with open(sys.argv[1], "w") as outfile:
    json.dump(data, outfile, indent=4)
