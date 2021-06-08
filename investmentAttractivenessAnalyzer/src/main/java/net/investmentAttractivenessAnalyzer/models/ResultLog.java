package net.investmentAttractivenessAnalyzer.models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "result_logs")
public class ResultLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "ip_address")
    private String ipAddress;

    @Column(name = "author")
    private String author;

    @Column(name = "request_info")
    private String requestInfo;

    @Column(name = "operation_type_id")
    private int operationTypeId;

    @Column(name = "returned_result")
    private String returnedResult;

    public ResultLog() {
    }

    public ResultLog(Long id, Date createDate, String ipAddress, String author,
                     String requestInfo, int operationTypeId, String returnedResult) {
        this.id = id;
        this.createDate = createDate;
        this.ipAddress = ipAddress;
        this.author = author;
        this.requestInfo = requestInfo;
        this.operationTypeId = operationTypeId;
        this.returnedResult = returnedResult;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getRequestInfo() {
        return requestInfo;
    }

    public void setRequestInfo(String requestInfo) {
        this.requestInfo = requestInfo;
    }

    public int getOperationTypeId() {
        return operationTypeId;
    }

    public void setOperationTypeId(int operationTypeId) {
        this.operationTypeId = operationTypeId;
    }

    public String getReturnedResult() {
        return returnedResult;
    }

    public void setReturnedResult(String returnedResult) {
        this.returnedResult = returnedResult;
    }
}
