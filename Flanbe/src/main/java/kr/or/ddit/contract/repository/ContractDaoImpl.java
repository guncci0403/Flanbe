package kr.or.ddit.contract.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

@Repository("contractDao")
public class ContractDaoImpl implements ContractDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int insertContract(MeetingVo meeting) {
		return template.insert("contract.insertContract", meeting);
	}
	
	//계약 전 미팅 사용자 조회 
	@Override
	public List<UserVo> selectContractUser(ProjectVo projectVo) {
		return template.selectList("contract.selectContractUser",projectVo);
	}
	
	// 계약 사용자 
	@Override
		public List<ContractVo> selectContractUserState(int p_code) {
		return template.selectList("contract.selectContractUserState",p_code);
	}
	
	// 미팅 완료 상태 변경
	@Override
	public int updateMeetFinish(UserVo userVo) {
		return template.update("contract.updateMeetFinish",userVo);
	}
	
	// 사용자 삭제 
	@Override
	public int updateUserDelete(UserVo userVo) {
		return template.update("contract.updateUserDelete",userVo);
	}
	
	
}
