/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.googlelogin;

/**
 *
 * @author Admin
 */
public class Constants {

    public static String GOOGLE_CLIENT_ID = "91807241555-hv99gc5grvs76rj1nv4p26igusmtn6g7.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8084/HomePage/LoginGoogleHandler";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
