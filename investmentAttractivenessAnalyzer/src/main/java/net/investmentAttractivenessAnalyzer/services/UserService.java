package net.investmentAttractivenessAnalyzer.services;

import net.investmentAttractivenessAnalyzer.enums.Roles;
import net.investmentAttractivenessAnalyzer.enums.UserStatuses;
import net.investmentAttractivenessAnalyzer.models.User;
import net.investmentAttractivenessAnalyzer.repositories.RoleRepository;
import net.investmentAttractivenessAnalyzer.repositories.UserRepository;
import net.investmentAttractivenessAnalyzer.models.Role;
import net.investmentAttractivenessAnalyzer.repositories.UserStatusRepository;
import net.investmentAttractivenessAnalyzer.services.interfaces.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserStatusRepository userStatusRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole(roleRepository.getOne((long) Roles.User.getRole()));
        user.setStatus(userStatusRepository.getOne((long) UserStatuses.Active.getStatus()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void blockUser(Long id) {
        User user = userRepository.findById(id);
        user.setStatus(userStatusRepository.getOne((long) UserStatuses.Blocked.getStatus()));
        userRepository.save(user);
    }

    @Override
    public void restoreUser(Long id) {
        User user = userRepository.findById(id);
        user.setStatus(userStatusRepository.getOne((long) UserStatuses.Active.getStatus()));
        userRepository.save(user);
    }
}
