rm -rf build/main
# shellcheck disable=SC2164
cd src/main
javac org/usefullibs/greeter/impl/HelloWorld.java \
  -d ../../build/main \
  && echo 'Compiled org.usefullibs.greeter.impl.HelloWorld class!'
# shellcheck disable=SC2164
cd ../../build/main
jar cvf greeting.jar \
  org/usefullibs/greeter/Greeter.class \
  org/usefullibs/greeter/impl/HelloWorld.class