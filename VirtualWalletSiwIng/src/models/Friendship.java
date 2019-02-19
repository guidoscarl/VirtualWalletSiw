package models;

public class Friendship {
	int id;
	String sender;
	String receiver;
	String emailSender;
	String emailReceiver;
	public Friendship(int id, String sender, String receiver, String emailSender, String emailReceiver) {
		this.id=id;
		this.sender=sender;
		this.receiver=receiver;
		this.emailSender=emailSender;
		this.emailReceiver=emailReceiver;
	}
	public String getEmailSender() {
		return emailSender;
	}
	public void setEmailSender(String emailSender) {
		this.emailSender = emailSender;
	}
	public String getEmailReceiver() {
		return emailReceiver;
	}
	public void setEmailReceiver(String emailReceiver) {
		this.emailReceiver = emailReceiver;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	
}
