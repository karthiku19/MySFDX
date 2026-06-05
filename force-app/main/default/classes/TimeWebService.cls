global class TimeWebService {
    public static string getTime() {
        String Session = UserInfo.getSessionId();
        system.debug(Session);
        return Session;
    }
}