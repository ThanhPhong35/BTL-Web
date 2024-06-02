package util;

import entity.Account;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;

public class Email {
    public static String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    
    public static boolean sendEmail(Account a) {
        boolean test = false;
        String toEmail = a.getEmail();
        String fromEmail = "nguyenthiquyen05032002@gmail.com";

        try {
            Properties pr = configEmail(new Properties());
            
            Session session = Session.getInstance(pr, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, "ruezslppbkablumn");
                }
            });

            // Thiết lập chi tiết thư điện tử
            Message mess = new MimeMessage(session);
            mess.setHeader("Context-Type", "text/plain; charset=UTF-8");
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("Confirm Code");
            mess.setText("Your code is: " + a.getCode());
            // Gửi Email
            Transport.send(mess);
            
            test = true;
        } catch (MessagingException e) {
            e.printStackTrace();
            // Xử lý lỗi theo nhu cầu của bạn, có thể ném ngoại lệ hoặc ghi vào file log.
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
    
    public static Properties configEmail(Properties properties) {
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.host", "smtp.gmail.com"); // Thay thế bằng máy chủ SMTP thực tế
        properties.setProperty("mail.smtp.port", "587"); // Hoặc sử dụng cổng an toàn 465 với "mail.smtp.socketFactory.port"
        return properties;
    }
}
