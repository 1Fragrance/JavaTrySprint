package net.investmentAttractivenessAnalyzer.services.interfaces;

import net.investmentAttractivenessAnalyzer.models.ResultLog;

import java.util.List;

public interface IOperationService {
    List<ResultLog> findAllByUserName();
    List<ResultLog> findAllByUserNameAndOperationType(int operationType);

    float calcAssetTurnover(float SANG, float SAKG, float N);
    float calcCompanyPerformance(int N, float XIEJ, float XIET);
    float calcFinancialStability(float SK, float VB);
    float calcLiquidityAndSolvency(float KO, float OA);
    float calcProfitabilityOfEconomicActivity(float RC, float AKG, float ANG);
}
