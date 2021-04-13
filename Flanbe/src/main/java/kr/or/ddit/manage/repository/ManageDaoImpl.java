package kr.or.ddit.manage.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

@Repository("manageDao")
public class ManageDaoImpl implements ManageDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<UserVo> selectUserList(String purpose) {
		return template.selectList("manage.selectUserList", purpose);
	}

	@Override
	public List<ProjectVo> requestProjectList() {
		return template.selectList("manage.requestProjectList");
	}

	@Override
	public int approvalProject(int p_code) {
		return template.update("manage.approvalProject", p_code);
	}

	@Override
	public int refusalProject(int p_code) {
		return template.update("manage.refusalProject", p_code);
	}

	@Override
	public List<ContractVo> requestContractList() {
		return template.selectList("manage.requestContractList");
	}

	@Override
	public int updateProjectState(int p_code) {
		return template.update("manage.updateProjectState", p_code);
	}

	@Override
	public int updatePattendState(ContractVo contract) {
		return template.update("manage.updatePattendState", contract);
	}
	
}
