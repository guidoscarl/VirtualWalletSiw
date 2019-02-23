package models;

public class Utente {
	private String nome;
	private String cognome;
	private String email;
	private String pass;
	private int saldo;
	private String image;
	private boolean active;
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public Utente(String nome, String cognome,String email,String pass, int saldo,String image,boolean active) {
		this.nome=nome;
		this.cognome=cognome;
		this.email=email;
		this.pass=pass;
		this.saldo=saldo;
		this.image=image;
		this.active=active;
	}
	public int getSaldo() {
		return saldo;
	}
	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
}
