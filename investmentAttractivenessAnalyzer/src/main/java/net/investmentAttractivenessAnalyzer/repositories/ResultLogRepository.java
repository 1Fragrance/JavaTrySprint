package net.investmentAttractivenessAnalyzer.repositories;

import net.investmentAttractivenessAnalyzer.models.ResultLog;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResultLogRepository extends JpaRepository<ResultLog, Long> {
    List<ResultLog> getAllByAuthor(String author);
    List<ResultLog> getAllByAuthorAndOperationTypeId(String author, int operationType);
}
