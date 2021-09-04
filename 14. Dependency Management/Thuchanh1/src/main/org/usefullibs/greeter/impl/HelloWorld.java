package main.org.usefullibs.greeter.impl;

import main.org.usefullibs.greeter.Greeter;

public class HelloWorld implements Greeter {
    @Override
    public String greet() {
        return "Hello world";
    }
}
