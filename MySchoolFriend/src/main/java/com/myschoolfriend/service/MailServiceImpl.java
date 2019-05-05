package com.myschoolfriend.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;

	// Sample Used
	// http://websystique.com/spring/spring-4-email-integration-tutorial/

	@Override
	public void sendEmail() {

		// ProductOrder order = (ProductOrder) object;

		MimeMessagePreparator preparator = getMessagePreparator();

		try {
			mailSender.send(preparator);
			System.out.println("Message Send...Hurrey");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
	}

	private MimeMessagePreparator getMessagePreparator() {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setFrom("pokuri86@gmail.com");
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress("shivasenator@gmail.com"));
				mimeMessage.setText("Dear Siva, Welcome to My School Friend");
				mimeMessage.setSubject("Welcome from My School Friend");
			}
		};
		return preparator;
	}

}
