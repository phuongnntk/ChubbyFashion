package com.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.entity.Accounts;
import com.shop.entity.MailInfo;
import com.shop.repository.AccountsRepo;
import com.shop.utils.MailerService;

@Controller
public class AuthController {

	@Autowired
	HttpSession session;

	@Autowired
	AccountsRepo repo;
	
	@Autowired
	MailerService sendmail;

	@PostMapping("/login")
	public String doPostLogin(@RequestParam String username, @RequestParam String password, Model model) {
		Optional<Accounts> acc = repo.findById(username);

		String mess = "";
		String status = "";
		
		if (!acc.isPresent()) {
			mess = "Username is not exist!";
			status = "error";
		} else if (!password.equals(acc.get().getPassword())) {
			mess = "Password is wrong!";
			status = "error";
		} else {
			session.setAttribute("account", acc.get());
			mess = "Login successed!";
			status = "success";
		}
		String uri = session.getAttribute("historyURI").toString();
		return "redirect:" + uri+"?"+status+"="+mess;
	}

	@SuppressWarnings("resource")
	@PostMapping("/register")
	public String doPostRegister(@RequestParam MultipartFile avatar, Model model, HttpServletRequest req) throws IOException, IllegalAccessException, InvocationTargetException {
		Accounts account = new Accounts();
		BeanUtils.populate(account, req.getParameterMap());
		String confirm = req.getParameter("confirm");
		Optional<Accounts> acc = repo.findById(account.getUsername());
		Optional<Accounts> acc1 = repo.findByEmail(account.getEmail());
		
		String mess = "";
		String status = "";
		
		if (acc.isPresent()) {
			mess = "Username is exist!";
			status = "error";
		}else if (!account.getPassword().equals(confirm)) {
			mess = "Password and password confirm not mapping!";
			status = "error";
		}else if (acc1.isPresent()) {
			mess = "Email is exist!";
			status = "error";
		} else {
			if (!avatar.isEmpty()) {
				String path = "src/main/resources/static/avatar/" + account.getUsername() +".jpg";
				File file = new File(path);
				FileOutputStream fileOutput = new FileOutputStream(file);
				fileOutput.write(avatar.getBytes());
				account.setAvatar(account.getUsername() +".jpg");
			}
			account.setAdmin(false);
			account.setDeleted(false);
			try {
				account = repo.save(account);
				mess = "Register successed!";
				status = "success";
			} catch (Exception e) {
				mess = "Register failed!";
				status = "error";
			}
		}
		String uri = session.getAttribute("historyURI").toString();
		return "redirect:" + uri+"?"+status+"="+mess;
	}
	
	@PostMapping("/forgot")
	public String doPostFotgot(Model model, @RequestParam String username, @RequestParam String email,HttpServletRequest req) throws IllegalAccessException, InvocationTargetException {
		Optional<Accounts> acc = repo.findById(username);
		
		String status = "";
		String mess = "";
		
		if (!acc.isPresent()) {
			model.addAttribute("error", "Tài khoản không tồn tại");
		}else {
			String newPass = ((long) Math.floor(Math.random() * (999999999 - 100000000 + 1) + 100000000)) +"";
			acc.get().setPassword(newPass);
			repo.save(acc.get());
			try {
				MailInfo mail = new MailInfo();
				mail.setFrom("tiachop26042002@gmail.com");
				mail.setTo(email);
				mail.setSubject("Lấy lại mật khẩu");
				mail.setBody("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" width=\"100%\" bgcolor=\"#F0F2FC\">\r\n"
						+ "        <tbody>\r\n"
						+ "            <tr>\r\n"
						+ "                <td align=\"center\" valign=\"top\">\r\n"
						+ "                    <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" width=\"600\" class=\"m_-4516102534817492810container\" style=\"margin:0 auto\">\r\n"
						+ "                        <tbody>\r\n"
						+ "                            <br>\r\n"
						+ "                            <tr>\r\n"
						+ "                                <td valign=\"top\" bgcolor=\"#FFFFFF\">\r\n"
						+ "                                    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"min-width:100%\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                        <tbody>\r\n"
						+ "                                            <tr>\r\n"
						+ "                                                <td class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\">\r\n"
						+ "                                                        <tbody>\r\n"
						+ "                                                            <tr>\r\n"
						+ "                                                                <td align=\"center\">\r\n"
						+ "                                                                    <a href=\"https://click.send.grammarly.com/?qs=92930daabb985ed9db17fcbde4adb9ce04390b859d1fdd021bdc8ccdd8fa56babc7e0863497126a7ccd941711f996f945ca9f7cfbef078c0976029e55415f2c2\" title=\"\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://click.send.grammarly.com/?qs%3D92930daabb985ed9db17fcbde4adb9ce04390b859d1fdd021bdc8ccdd8fa56babc7e0863497126a7ccd941711f996f945ca9f7cfbef078c0976029e55415f2c2&amp;source=gmail&amp;ust=1655575690820000&amp;usg=AOvVaw3sOKohJzOpE9-EGt7CPj3k\"><img src=\"https://ci3.googleusercontent.com/proxy/mXJ_3wL5CQrfFQEvr4fhPWBcJVSyXXax-eiqcYvueb3K0GnjmzGL3-qauNzZoeANgLUV1zLqTGgv1XKlcPj5AvuiBHKLd1UCgIOzJKcOvNVUphbTOZsygHjsV3foAZAKXS4kGB49LeUGFXM=s0-d-e1-ft#https://image.send.grammarly.com/lib/fe8f12747760017576/m/3/3216-June-Promo-Email-1A.png\"\r\n"
						+ "                                                                            alt=\"\" width=\"1200\" style=\"display:block;padding:0px;text-align:center;height:auto;width:100%\" class=\"CToWUd\"></a>\r\n"
						+ "                                                                </td>\r\n"
						+ "                                                            </tr>\r\n"
						+ "                                                        </tbody>\r\n"
						+ "                                                    </table>\r\n"
						+ "                                                </td>\r\n"
						+ "                                            </tr>\r\n"
						+ "                                        </tbody>\r\n"
						+ "                                    </table>\r\n"
						+ "                                    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"background-color:transparent;min-width:100%\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                        <tbody>\r\n"
						+ "                                            <tr>\r\n"
						+ "                                                <td style=\"padding:70px 70px 10px\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
						+ "\r\n"
						+ "                                                        <tbody>\r\n"
						+ "                                                            <tr>\r\n"
						+ "                                                                <td style=\"text-align:start; margin-left:50px;\" valign=\"middle\">\r\n"
						+ "                                                                    <span style=\"font-size:17px;\" class=\"m_-4516102534817492810h1\">Chào, <Strong>" + acc.get().getFullname() + "</Strong><br>\r\n"
						+ "				                                                    </span></td>\r\n"
						+ "                                                            </tr>\r\n"
						+ "                                                        </tbody>\r\n"
						+ "                                                    </table>\r\n"
						+ "                                                </td>\r\n"
						+ "                                            </tr>\r\n"
						+ "                                        </tbody>\r\n"
						+ "                                    </table>\r\n"
						+ "                                    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"background-color:transparent;min-width:100%\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                        <tbody>\r\n"
						+ "                                            <tr>\r\n"
						+ "                                                <td style=\"padding:0px 0px 20px\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
						+ "\r\n"
						+ "                                                        <tbody>\r\n"
						+ "                                                            <tr>\r\n"
						+ "                                                                <td align=\"center\" style=\"padding-bottom:0px\" valign=\"top\">\r\n"
						+ "                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"m_-4516102534817492810MobileTableWidth\" width=\"77%\">\r\n"
						+ "\r\n"
						+ "                                                                        <tbody>\r\n"
						+ "                                                                            <tr>\r\n"
						+ "                                                                                <td align=\"left\" style=\"font-size:16px;line-height:24px\" valign=\"top\">\r\n"
						+ "                                                                                    <b>Yêu cầu lấy lại mật khẩu của bạn đã được xác nhận.</b><br> Mật khẩu của bạn là: " + newPass + "&nbsp; <br> Vui lòng không được cung cấp mật khẩu ra bên ngoài. <br> <br> Trân\r\n"
						+ "                                                                                    trọng,\r\n"
						+ "                                                                                    <br>\r\n"
						+ "                                                                                    <Strong> PT SHOP</Strong>\r\n"
						+ "                                                                                </td>\r\n"
						+ "                                                                            </tr>\r\n"
						+ "                                                                        </tbody>\r\n"
						+ "                                                                    </table>\r\n"
						+ "                                                                </td>\r\n"
						+ "                                                            </tr>\r\n"
						+ "                                                        </tbody>\r\n"
						+ "                                                    </table>\r\n"
						+ "                                                </td>\r\n"
						+ "                                            </tr>\r\n"
						+ "                                        </tbody>\r\n"
						+ "                                    </table>\r\n"
						+ "                                    <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"background-color:transparent;min-width:100%\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                        <tbody>\r\n"
						+ "                                            <tr>\r\n"
						+ "                                                <td style=\"padding:0px\" class=\"m_-4516102534817492810stylingblock-content-wrapper\">\r\n"
						+ "                                                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\" role=\"presentation\">\r\n"
						+ "                                                        <tbody>\r\n"
						+ "                                                            <tr>\r\n"
						+ "                                                                <td align=\"center\">\r\n"
						+ "                                                                    <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\">\r\n"
						+ "                                                                        <tbody>\r\n"
						+ "                                                                            <tr>\r\n"
						+ "                                                                                <td bgcolor=\"#11A683\" style=\"border-radius:5px;background-color:#11a683\">\r\n"
						+ "                                                                                    <a style=\"font-size:14px;font-family:Inter,Helvetica,Arial,sans-serif;font-weight:700;line-height:32px;color:#ffffff;text-align:center;text-decoration:none;display:block;background-color:#11a683;border:1px solid #11a683;padding:8px 32px;border-radius:5px\"\r\n"
						+ "                                                                                        href=\"http://localhost:8080/home\">Đăng nhập ngay</a></td>\r\n"
						+ "                                                                            </tr>\r\n"
						+ "                                                                        </tbody>\r\n"
						+ "                                                                    </table>\r\n"
						+ "                                                                    <br>\r\n"
						+ "                                                                </td>\r\n"
						+ "                                                            </tr>\r\n"
						+ "                                                        </tbody>\r\n"
						+ "                                                    </table>\r\n"
						+ "                                                </td>\r\n"
						+ "                                            </tr>\r\n"
						+ "                                        </tbody>\r\n"
						+ "                                    </table>\r\n"
						+ "                                </td>\r\n"
						+ "                            </tr>\r\n"
						+ "                        </tbody>\r\n"
						+ "                    </table>\r\n"
						+ "                    <br>\r\n"
						+ "                </td>\r\n"
						+ "            </tr>\r\n"
						+ "        </tbody>\r\n"
						+ "    </table>");
				sendmail.send(mail);
				mess = "Gửi thành công!";
				status = "success";
			} catch (MessagingException e) {
				mess = "Gửi thất bại!";
				status = "error";
				e.printStackTrace();
			}
		}
		String uri = session.getAttribute("historyURI").toString();
		return "redirect:" + uri+"?"+status+"="+mess;
	}
	
	@GetMapping("/logout")
	public String doGetLogout() {
		session.removeAttribute("account");
		String uri = session.getAttribute("historyURI").toString();
		return "redirect:"+uri;
	}
}
