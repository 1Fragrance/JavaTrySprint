package net.investmentAttractivenessAnalyzer.enums;

public enum OperationTypes {
    LiquidityAndSolvency(1),
    FinancialStability(2),
    AssetTurnover(3),
    ProfitabilityOfEconomicActivity(4),
    CompanyPerformance(5);


    OperationTypes(int operationType) {
        this.operationType = operationType;
    }

    private final int operationType;

    public int getOperationType() {
        return operationType;
    }
}
