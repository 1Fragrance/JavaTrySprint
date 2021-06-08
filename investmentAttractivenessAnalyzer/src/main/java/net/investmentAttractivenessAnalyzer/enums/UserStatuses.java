package net.investmentAttractivenessAnalyzer.enums;

public enum UserStatuses {
    Active(1),
    Blocked(2);

    UserStatuses(int status) {
        this.status = status;
    }

    private final int status;

    public int getStatus() {
        return status;
    }
}
