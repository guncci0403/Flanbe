package kr.or.ddit.email;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;

@Service("MailSendService")
public class MailSendService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request) {
		
		String key = getKey(false, 10);
		UserVo user = new UserVo();
		user.setUser_id(user_id);
		user.setU_act(key);
		userDao.updateKey(user);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 프랜비입니다 ✋✋</h2><br>" 
				+ "<h3>" + user_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:80" + request.getContextPath() + "/login/certified?user_id="+ user_id +"&u_act="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] 프랜비 인증메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendPass(String e_mail, String user_id, HttpServletRequest request) {
		
		String pass = getKey(false, 20);
		UserVo user = new UserVo();
		user.setUser_id(user_id);
		user.setPass(pass);
		userDao.updatePass(user);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 프랜비입니다 ✋✋</h2><br>" 
				+ "<h3>" + user_id + "님</h3>" + "<p>임시비밀번호를 발급했습니다. <br> 임시비밀번호 : </p>" + "<h4> "+ pass + " </h4>"; 
		try {
			mail.setSubject("[본인인증] 프랜비 임시비밀번호 발급입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
