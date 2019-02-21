package models;

public class Message {
	private String sender;
	private String receiver;
	private String value;
	private String date;
	
	
	public Message(String sender, String receiver, String value, String date) {
		
		this.sender = sender;
		this.receiver = receiver;
		this.value = value;
		this.date=date;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
