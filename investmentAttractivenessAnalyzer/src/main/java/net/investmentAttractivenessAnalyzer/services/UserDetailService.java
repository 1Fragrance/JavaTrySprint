package net.investmentAttractivenessAnalyzer.services;

import net.investmentAttractivenessAnalyzer.enums.UserStatuses;
import net.investmentAttractivenessAnalyzer.models.UserStatus;
import net.investmentAttractivenessAnalyzer.repositories.UserRepository;
import net.investmentAttractivenessAnalyzer.models.Role;
import net.investmentAttractivenessAnalyzer.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

public class UserDetailService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userRepository.findByUsername(username);
        if((user.getStatus().getId().intValue() == UserStatuses.Blocked.getStatus())) {
            throw new UsernameNotFoundException("user is blocked");
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole().getName()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
    }
}
