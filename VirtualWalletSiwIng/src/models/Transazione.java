package models;

public class Transazione {
	private String nomeMittente;
	private String cognomeMittente;
	private String nomeDestinatario;
	private String cognomeDestinatario;
	private String email;
	private String data;
	private int importo;
	public Transazione(String nomeMittente, String cognomeMittente, String nomeDestinatario, String cognomeDestinatario,
			int importo,String email,String data) {
		
		this.nomeMittente = nomeMittente;
		this.cognomeMittente = cognomeMittente;
		this.nomeDestinatario = nomeDestinatario;
		this.cognomeDestinatario = cognomeDestinatario;
		this.email=email;
		this.importo = importo;
		this.data=data;
		
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNomeMittente() {
		return nomeMittente;
	}
	public void setNomeMittente(String nomeMittente) {
		this.nomeMittente = nomeMittente;
	}
	public String getCognomeMittente() {
		return cognomeMittente;
	}
	public void setCognomeMittente(String cognomeMittente) {
		this.cognomeMittente = cognomeMittente;
	}
	public String getNomeDestinatario() {
		return nomeDestinatario;
	}
	public void setNomeDestinatario(String nomeDestinatario) {
		this.nomeDestinatario = nomeDestinatario;
	}
	public String getCognomeDestinatario() {
		return cognomeDestinatario;
	}
	public void setCognomeDestinatario(String cognomeDestinatario) {
		this.cognomeDestinatario = cognomeDestinatario;
	}
	public int getImporto() {
		return importo;
	}
	public void setImporto(int importo) {
		this.importo = importo;
	}
	
	
	
	
	
	
	
	
}
