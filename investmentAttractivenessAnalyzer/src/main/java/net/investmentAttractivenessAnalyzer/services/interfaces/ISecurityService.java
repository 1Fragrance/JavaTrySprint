package net.investmentAttractivenessAnalyzer.services.interfaces;


public interface ISecurityService {
    String findLoggedInUsername();
    void autoLogin(String username, String password);
}
