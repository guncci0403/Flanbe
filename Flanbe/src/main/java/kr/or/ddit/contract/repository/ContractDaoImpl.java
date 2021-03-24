package kr.or.ddit.contract.repository;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.contract.model.MeetingVo;

@Repository("contractDao")
public class ContractDaoImpl implements ContractDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int insertContract(MeetingVo meeting) {
		return template.insert("contract.insertContract", meeting);
	}
	
	
}
