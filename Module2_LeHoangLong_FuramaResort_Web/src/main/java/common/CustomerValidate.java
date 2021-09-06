package common;

import java.util.regex.Pattern;

public class CustomerValidate {
    private static final String REGEX_CUSTOMER_ID = "^KH-[\\d]{4}$";
    private static final String REGEX_CUSTOMER_EMAIL = "^[a-zA-Z]([\\w-]|\\.)+@([\\w]+\\.[\\w]{2,}|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$";
    private static final String REGEX_CUSTOMER_PHONE = "((84)+9[0|1])?[\\d]{7}|(09[0|1])[\\d]{7}";
    private static final String REGEX_CUSTOMER_ID_CARD = "[\\d]{9}|[\\d]{12}";

    public static boolean validateCustomerId(String customerId) {
        Pattern pattern = Pattern.compile(REGEX_CUSTOMER_ID);
        return pattern.matcher(customerId).matches();
    }

    public static boolean validateCustomerPhone(String customerPhone) {
        Pattern pattern = Pattern.compile(REGEX_CUSTOMER_PHONE);
        return pattern.matcher(customerPhone).matches();
    }

    public static boolean validateCustomerEmail(String customerEmail) {
        Pattern pattern = Pattern.compile(REGEX_CUSTOMER_EMAIL);
        return pattern.matcher(customerEmail).matches();
    }

    public static boolean validateCustomerIdCard(String customerIdCard) {
        Pattern pattern = Pattern.compile(REGEX_CUSTOMER_ID_CARD);
        return pattern.matcher(customerIdCard).matches();
    }
}
