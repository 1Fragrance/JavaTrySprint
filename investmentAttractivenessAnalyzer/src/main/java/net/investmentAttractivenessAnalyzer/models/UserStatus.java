package net.investmentAttractivenessAnalyzer.models;

import javax.persistence.*;

@Entity
@Table(name = "user_statuses")
public class UserStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    public String getName() {
        return name;
    }

    public Long getId() {
        return id;
    }
}
