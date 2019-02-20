package models;

public class Message {
	private String sender;
	private String receiver;
	private String value;
	
	
	public Message(String sender, String receiver, String value) {
		
		this.sender = sender;
		this.receiver = receiver;
		this.value = value;
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
