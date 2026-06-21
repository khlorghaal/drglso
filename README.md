A loader for native development on-device using termux.  
aarch64 GLES3.0  
Bypasses issues with termux packages being broken, and allows live building without signing.  
Scans `/android/media/com.termux/files/home/storage/shared/media-0/drglso.so;` copies it to its own data directory; chmox +x; dlopen; creates a graphical context and invokes the app with it.  
status: hello world
