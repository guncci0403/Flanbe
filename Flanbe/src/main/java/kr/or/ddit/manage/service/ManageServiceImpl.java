package kr.or.ddit.manage.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.manage.repository.ManageDao;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

@Service("manageService")
public class ManageServiceImpl implements ManageService {

	@Resource(name="manageDao")
	private ManageDao manageDao;

	@Override
	public List<UserVo> selectUserList(String purpose) {
		return manageDao.selectUserList(purpose);
	}

	@Override
	public List<ProjectVo> requestProjectList() {
		return manageDao.requestProjectList();
	}

	@Override
	public int approvalProject(int p_code) {
		return manageDao.approvalProject(p_code);
	}

	@Override
	public int refusalProject(int p_code) {
		return manageDao.refusalProject(p_code);
	}

	@Override
	public List<ContractVo> requestContractList() {
		return manageDao.requestContractList();
	}

	@Override
	public int updateState(ContractVo contract) {
		int cnt = 0;
		cnt += manageDao.updateProjectState(contract.getP_code());
		cnt += manageDao.updatePattendState(contract);
		return cnt;
	}
	
	
}
