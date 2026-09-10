# Compiling the Source

To compile this source you will need libpcap.  Check your Linux
distribution for installation instructions.  On Debian-like systems:

```
$ sudo apt update && sudo apt install libpcap-dev
```

No other external libraries are required.

To build this tool, change to the `asleap` directory and run `make`.
You can override CC and/or CFLAGS on the `make` command line as usual.
