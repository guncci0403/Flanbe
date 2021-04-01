package kr.or.ddit.user.repository;

import java.util.List;

import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.CareerVo;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.PortfolioVo;
import kr.or.ddit.user.model.USkillVo;
import kr.or.ddit.user.model.UserVo;

public interface UserDao {

	// 로그인 가능한 유저인지 확인
	UserVo loginUser(String userid);

	// 사용자 조회
	UserVo selectUser(String user_id);

	// 회원가입
	int insertUser(UserVo user);

	// id 찾기
	List<String> selectUserid(UserVo user);

	// 인증키 업데이트
	int updateKey(UserVo user);

	int updateUAct(UserVo user);

	// 임시 비밀번호로 업데이트
	int updatePass(UserVo user);

	// 사용자가 존재하는지 확인 ( id, email )
	int selectUserWhether(UserVo user);

	// 파트너스 리스트 조회 페이징 처리
	List<UserVo> selectPartnerList(PageVo page);

	int selectPartnerCnt();

	// 파트너스 검색(아이디)
	List<UserVo> idsearchPartnerList(String id);

	// 파트너스 검색(팀이름)
	List<UserVo> tnmsearchPartnerList(String teamnm);

	// 파트너스 필터 검색
	List<UserVo> filterPartnerList(PageVo page);

	int filterPartnerCnt(String value);

	// 파트너스 보유기술 필터 검색
	List<UserVo> skilFilterList(SearchVo search);

	int skilFilterListCnt(SearchVo search);
	/////////////////////////////////////////////////////////

	// 사용자가 클라이언트인지 파트너스인지 확인
	String userPurpose(String user_id);

	// 프로젝트 수행이력 테이블 생성
	int insertHistory(String user_id);

	/**
	 * 건영형
	 */
///////////////////////////////////////////////////////////////////////////
	// 	자기소개 수정
	int updateIntro(UserVo userVo);

	// 회원 정보 수정
	int updateInfo(UserVo userVo);

	// 비밀 번호 변경
	int changePass(UserVo userVo);

	// 회원 탈퇴
	int deleteUser(String user_id);

///////////////////////////////////////////////////////////////////////////
	// 	진행한(진행중 포함) 프로젝트 갯수
	int countJoinProject(String user_id);

	// 진행한 프로젝트 누적 금액
	int sumMoney(String user_id);

	// 진행한 프로젝트 분야(프로젝트 수행 이력 테이블 가지고 오기)
	HistoryVo selectProjectHistory(String user_id);

	// 진행한 프로젝트 평균 금액
	int avgMoney(String user_id);

	// 진행한 프로젝트 평균 기간
	int avgPeriod(String user_id);

	// 진행한 프로젝트 리스트 페이징
	List<ProjectVo> joinProjectPaging(PageVo page);

	int joinProjectCnt(String user_id);

///////////////////////////////////////////////////////////////////////////
	//경력 리스트 조회
	List<CareerVo> selectCareerList(String user_id);

	//경력 등록
	int insertCareer(CareerVo careerVo);

	//경력 삭제
	int deleteCareer(int c_no);

	//경력 수정
	int updateCareer(CareerVo careerVo);
	
	//경력 년수
	String selectCareerDate(String user_id);

///////////////////////////////////////////////////////////////////////////
	//보유기술 리스트 조회
	List<USkillVo> selectSkillList(String user_id);

	//보유기술 등록
	int insertSkill(USkillVo uskillVo);

	//보유기술 삭제
	int deleteSkill(int us_no);

	//보유기술 수정
	int updateSkill(USkillVo uskillVo);
	
	// 대표 포트폴리오만 조회 
	List<PortfolioVo> selectReprePopol(String user_id);
	
	/////////////////// 수연
	
	// 포트폴리오 출력(메인, 상세)
	List<PortfolioVo> selectPopol(String user_id);
	
	//해당 포트폴리오 번호의 리스트 출력
	PortfolioVo getPopolList(int po_no);
	
	//포트폴리오 등록
	int insertPopol(PortfolioVo portfolioVo);
	
	//현재 최대 파일번호
	int maxnumFile();
	
	//포트폴리오 해당 a_no에 대한 첨부파일 가져오기
	AttachVo getfiles(int a_no);
	//포트폴리오 첨부파일 출력
	List<AttachVo> selectfiles(int po_no);
	//포트폴리오 첨부파일 등록
	int insertfiles(AttachVo attachVo);
	//포트폴리오 첨부파일 수정
	int updatefiles(AttachVo attachVo);
	//포트폴리오 첨부파일 삭제
	int deletefiles(int a_no);

	//대표 포트폴리오 설정 해제(N으로 초기화)
	int representNPopol(String user_id);
	//대표 포트폴리오 설정
	int representYPopol(PortfolioVo portfolioVo);	
	
	//포트폴리오 삭제
	int deletePopol(int po_no);
	
	//포트폴리오 수정
	int modifyPopol(PortfolioVo portfolioVo);
	
	//분야필터 출력 
	List<PortfolioVo> selectFieldFilter(SearchVo searchVo);
}
