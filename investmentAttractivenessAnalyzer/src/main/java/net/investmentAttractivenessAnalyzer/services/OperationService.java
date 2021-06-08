package net.investmentAttractivenessAnalyzer.services;

import com.google.gson.Gson;
import net.investmentAttractivenessAnalyzer.enums.OperationTypes;
import net.investmentAttractivenessAnalyzer.repositories.ResultLogRepository;
import net.investmentAttractivenessAnalyzer.models.ResultLog;
import net.investmentAttractivenessAnalyzer.services.interfaces.IOperationService;
import net.investmentAttractivenessAnalyzer.utils.HttpRequestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

@Service
public class OperationService implements IOperationService {

    @Autowired
    private ResultLogRepository resultLogRepository;

    @Override
    public List<ResultLog> findAllByUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        return resultLogRepository.getAllByAuthor(authentication.getName());
    }

    @Override
    public List<ResultLog> findAllByUserNameAndOperationType(int operationType) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        return resultLogRepository.getAllByAuthorAndOperationTypeId(authentication.getName(), operationType);
    }

    @Override
    public float calcAssetTurnover(float SANG, float SAKG, float N) {
        float result = N / ((SANG + SAKG) / 2);
        logResult(String.valueOf(result), OperationTypes.AssetTurnover);

        return result;
    }

    @Override
    public float calcCompanyPerformance(int N, float XIEJ, float XIET) {
        double kipP = (1 - (XIEJ / XIET));
        for (int i = 1; i >= N; i++) {
            kipP = pow(kipP + 1, 2);
        }

        float result = (float) sqrt(kipP);
        logResult(String.valueOf(result), OperationTypes.CompanyPerformance);

        return result;
    }

    @Override
    public float calcFinancialStability(float SK, float VB) {
        float result = SK/VB;
        logResult(String.valueOf(result), OperationTypes.FinancialStability);

        return result;
    }

    @Override
    public float calcLiquidityAndSolvency(float KO, float OA) {
        float result = OA/KO;
        logResult(String.valueOf(result), OperationTypes.LiquidityAndSolvency);

        return result;
    }

    @Override
    public float calcProfitabilityOfEconomicActivity(float RC, float AKG, float ANG) {
        float result = RC / ((AKG + ANG) / 2);
        logResult(String.valueOf(result), OperationTypes.ProfitabilityOfEconomicActivity);

        return result;
    }

    private void logResult(String result, OperationTypes operationType) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        ResultLog resultLog = new ResultLog();
        resultLog.setAuthor(authentication.getName());
        resultLog.setOperationTypeId(operationType.ordinal());
        resultLog.setReturnedResult(result);
        resultLog.setCreateDate(new Date());
        resultLog.setIpAddress(HttpRequestUtils.getRemoteIP(RequestContextHolder.currentRequestAttributes()));
        HttpServletRequest currentRequest = HttpRequestUtils.getCurrentHttpRequest();
        Map queryParams = currentRequest.getParameterMap();
        Gson gson = new Gson();
        resultLog.setRequestInfo(gson.toJson(queryParams));

        resultLogRepository.save(resultLog);
    }
}
