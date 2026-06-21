.PHONY: build clean

ANDROID_JAR = /opt/android-sdk/platforms/android-37.0/android.jar

build: build/drglso.apk
 
build/classes.jar: MainActivity.kt
	mkdir -p build
	mkdir -p build/classes
	kotlinc -cp $(ANDROID_JAR) MainActivity.kt -d build/classes
	jar cf $@ -C build/classes .
 
build/classes.dex: build/classes.jar
	d8 --lib  $(ANDROID_JAR) --output build $<
 
build/drglso.unaligned.apk: AndroidManifest.xml build/classes.dex
	aapt2 link --manifest AndroidManifest.xml \
		-I  $(ANDROID_JAR)\
		--min-sdk-version 28 --target-sdk-version 37 \
		--version-code 1 --version-name 1.0 \
		-o $@
	cd build && zip -u ../build/drglso.unaligned.apk classes.dex
 
build/drglso.apk: build/drglso.unaligned.apk
	zipalign -f 4 $< $@
 
clean:
	rm -rf build

sign:
	keytool -genkey -v -keystore debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -storepass android -keypass android -dname "CN=debug"
	apksigner sign --ks debug.keystore --ks-pass pass:android --key-pass pass:android build/drglso.apk