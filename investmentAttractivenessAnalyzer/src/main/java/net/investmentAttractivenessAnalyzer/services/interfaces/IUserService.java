package net.investmentAttractivenessAnalyzer.services.interfaces;

import net.investmentAttractivenessAnalyzer.models.User;

import java.util.List;


public interface IUserService {
    User findByUsername(String username);
    List<User> findAll();

    void saveUser(User user);
    void blockUser(Long id);
    void restoreUser(Long id);
}
