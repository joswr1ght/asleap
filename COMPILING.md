# Compiling the Source

To compile this source you will need the [libxcrypt](https://github.com/besser82/libxcrypt/)
library. At the time of this writing, this is `libxcrypt-dev` on Debian-like systems. Check 
your Linux distribution for installation directions. For Debian systems:

```
$ sudo apt update && sudo apt install libxcrypt-dev -y
```

To build this tool, change to the `asleap` directory and run `make`:

```
$ make
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3    -c -o sha1.o sha1.c
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3    -c -o common.o common.c
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3    -c -o utils.o utils.c
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3  asleap.c -o asleap common.o utils.o sha1.o -lpcap -lxcrypt -lcrypto
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3  md4.c genkeys.c -o genkeys common.o utils.o -lpcap -lxcrypt -lcrypto
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3    -c -o asleap.o asleap.c
gcc -pipe -Wall -D_LINUX -D_OPENSSL_MD4 -g3    -c -o genkeys.o genkeys.c
```

Optionally you can edit the `Makefile` and change the compiler to clang as desired.
