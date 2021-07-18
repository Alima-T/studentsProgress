package services;

import javax.servlet.http.Cookie;

public class CookiesServices {
    public static Cookie getCookieByName(Cookie[] cookies, String cookie) {
        for (Cookie c : cookies) {
            if (c.getName().equals(cookie)) {
                return c;
            }
        }
        return null;
    }
}
