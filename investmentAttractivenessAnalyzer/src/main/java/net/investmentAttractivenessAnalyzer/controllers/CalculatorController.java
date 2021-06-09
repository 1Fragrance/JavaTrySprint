package net.investmentAttractivenessAnalyzer.controllers;

import net.investmentAttractivenessAnalyzer.enums.OperationTypes;
import net.investmentAttractivenessAnalyzer.services.interfaces.IOperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculatorController {

    @Autowired
    private IOperationService operationService;

    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = {"calculator/liquidity-and-solvency"}, method = RequestMethod.GET)
    public String CalcLiquidityAndSolvency(Model model,
                            @RequestParam(value = "OA", required = false) final String OA,
                            @RequestParam(value = "KO", required = false) final String KO) {
        float result = 0;
        if (OA != null && KO != null && !OA.equals("") && !KO.equals("")) {
            result = operationService.calcLiquidityAndSolvency(Float.parseFloat(KO), Float.parseFloat(OA));
        }

        model.addAttribute("result", result);
        model.addAttribute("allResult", operationService.findAllByUserNameAndOperationType(OperationTypes.LiquidityAndSolvency.getOperationType()));

        model.addAttribute("value1", OA);
        model.addAttribute("value2", KO);

        return "calculator/liquidityAndSolvencyCalc";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = {"calculator/financial-stability"}, method = RequestMethod.GET)
    public String calcFinancialStability(Model model,
                            @RequestParam(value = "SK", required = false) final String SK,
                            @RequestParam(value = "VB", required = false) final String VB) {
        float result = 0;
        if (SK != null && VB != null && !SK.equals("") && !VB.equals("")) {
            result = operationService.calcFinancialStability(Float.parseFloat(SK),  Float.parseFloat(VB));
        }

        model.addAttribute("result", result);
        model.addAttribute("allResult", operationService.findAllByUserNameAndOperationType(OperationTypes.FinancialStability.getOperationType()));

        model.addAttribute("value1", SK);
        model.addAttribute("value2", VB);

        return "calculator/financialStabilityCalc";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = {"calculator/asset-turnover"}, method = RequestMethod.GET)
    public String calcAssetTurnover(Model model,
                         @RequestParam(value = "N", required = false) final String N,
                         @RequestParam(value = "SANG", required = false) final String SANG,
                         @RequestParam(value = "SAKG", required = false) final String SAKG) {
        float result = 0;
        if (N != null && SANG != null  && SAKG != null && !N.equals("") && !SANG.equals("") && !SAKG.equals("")){
            result = operationService.calcAssetTurnover(Float.parseFloat(SANG), Float.parseFloat(SAKG), Float.parseFloat(N));
        }

        model.addAttribute("result", result);
        model.addAttribute("allResult", operationService.findAllByUserNameAndOperationType(OperationTypes.AssetTurnover.getOperationType()));

        model.addAttribute("value1", N);
        model.addAttribute("value2", SANG);
        model.addAttribute("value3", SAKG);

        return "calculator/assetTurnoverCalc";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = {"calculator/profitability-of-economic-activity"}, method = RequestMethod.GET)
    public String calcProfitabilityOfEconomicActivity(Model model,
                         @RequestParam(value = "RC", required = false) final String RC,
                         @RequestParam(value = "AKG", required = false) final String AKG,
                         @RequestParam(value = "ANG", required = false) final String ANG) {
        float result = 0;
        if (RC != null && AKG != null && ANG != null && !RC.equals("") && !AKG.equals("") && !ANG.equals("")){
            result = operationService.calcProfitabilityOfEconomicActivity(Float.parseFloat(RC), Float.parseFloat(AKG), Float.parseFloat(ANG));
        }

        model.addAttribute("result", result);
        model.addAttribute("allResult", operationService.findAllByUserNameAndOperationType(OperationTypes.ProfitabilityOfEconomicActivity.getOperationType()));

        model.addAttribute("value1", RC);
        model.addAttribute("value2", AKG);
        model.addAttribute("value3", ANG);

        return "calculator/profitabilityOfEconomicActivityCalc";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
    @RequestMapping(value = {"calculator/company-performance"}, method = RequestMethod.GET)
    public String calcCompanyPerformance(Model model,
                         @RequestParam(value = "N", required = false) final String N,
                         @RequestParam(value = "XIJ", required = false) final String XIEJ,
                         @RequestParam(value = "XIET", required = false) final String XIET) {
        float result = 0;
        if (N != null && XIEJ != null && XIET != null && !N.equals("") && !XIEJ.equals("") && !XIET.equals("")) {
            result = operationService.calcCompanyPerformance(Integer.valueOf(N), Float.parseFloat(XIEJ), Float.parseFloat(XIET));
        }

        model.addAttribute("result", result);
        model.addAttribute("allResult", operationService.findAllByUserNameAndOperationType(OperationTypes.CompanyPerformance.getOperationType()));

        model.addAttribute("value1", N);
        model.addAttribute("value2", XIEJ);
        model.addAttribute("value3", XIET);

        return "calculator/companyPerformanceCalc";
    }
}
