### A loader for native development on-device.  
aarch64 GLES3.0  
Allows live building without adb or signing.  
Bypasses issues with ndk tooling being broken.
Scans `/android/media/com.termux/files/home/storage/shared/media-0/drglso.so;` copies it to its own data directory; chmox +x; dlopen; creates a GLES context and invokes the app with it.  
  
status: hello world  
  
#### why not just emit an apk using the mobile device?  
  - packaged compilers: the tooling required for a signed apk isnt as bad as something like Node but its a good number of packages, all which have opportunity to get fucked by either $PREFIX or bionic.  
    as of now all termux jdks on my device are broken to a Perfetto dependency of my android OS libs.  
  - build tools from src: shouldnt be that bad, but is the package situation except worse  
  - proot: the ideal solution, but more chances for things to go wrong  
  - security: adb has lots of vulns and i generally dont want it on my phone; this is also a potential vuln, but an apk has well-controlled permissions  
