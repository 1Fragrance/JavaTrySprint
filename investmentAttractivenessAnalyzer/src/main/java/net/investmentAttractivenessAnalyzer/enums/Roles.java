package net.investmentAttractivenessAnalyzer.enums;

public enum Roles {
    User(1),
    Admin(2);

    Roles(int role) {
        this.role = role;
    }

    private final int role;

    public int getRole() {
        return role;
    }
}
