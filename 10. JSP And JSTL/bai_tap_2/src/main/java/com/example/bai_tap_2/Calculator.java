package com.example.bai_tap_2;

public class Calculator extends ArithmeticException{
    @Override
    public String getMessage() {
        return "Loi chia het cho 0!";
    }
}
