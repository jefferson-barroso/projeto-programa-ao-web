package model;

//1- Criar a classe com os atribitos da tabela do BD
public class loja {
	private int id;
	private String cpf; 
	private String nome; 
	private String telefone; 
	private String email;
	
	
	//2- Cria o construtor
	public loja(String cpf, String nome, String telefone, String email) {
		super();
		this.cpf = cpf;
		this.nome = nome;
		this.telefone = telefone;
		this.email = email;
	}
	
	//3 - Cria os GETTERS E SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
//aGORA CRIA O DAO - DATA ACESS OBJECT -> DAO SERÁ O UNICO QUE FARÁ CONTATO COM O BD