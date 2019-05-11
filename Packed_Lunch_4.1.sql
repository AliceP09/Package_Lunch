-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
use master

drop database Packed_Lunch_4

create database Packed_Lunch_4

use Packed_Lunch_4


CREATE TABLE Usuario 
(
Id_Usuario Int Primary Key Identity,
login nvarchar(255) ,
senha nvarchar(255) ,
func nvarchar(15),
Id_empresa_fk integer,
constraint Id_Empresa_fk5 FOREIGN KEY(Id_Empresa_fk) REFERENCES Empresa (Id_Empresa)
)

INSERT INTO Usuario VALUES ('alce','1234','adm','3')


INSERT INTO Usuario VALUES ('Nelsão','321','adm','2')
 
SELECT * FROM Usuario

--criando tabela empresa
CREATE TABLE Empresa (
Id_Empresa Int PRIMARY KEY identity,
Cnpj Char(14),
Nome varchar(255),
Login varchar(255),
Senha varchar(255)
)

select * from Empresa
Create function select_empresa(
	@Login varchar(255),
	@Senha varchar(255)
)
returns table
as
return
	
	
	
	select @login=Login,@Senha = Senha from Empresa


	print (@login)
	print (@Senha)



create trigger inserir_login 
on empresa
for insert
as 
begin 
declare 
	@Login varchar(255),
	@Senha varchar(255),
	@Id_Usuario int
	insert  @Login=Login,@Senha=Senha where Id_empresa = @Id_Usuario
end
	 
select * from Empresa


--criando tabela pessoa
CREATE TABLE Pessoa (
Id_Pessoa Int PRIMARY KEY Identity,
Cpf char(11),
Nome varchar(255),
Login varchar(255),
Senha varchar(255),
Id_empresa_fk integer,
constraint Id_Empresa_fk4 FOREIGN KEY(Id_Empresa_fk) REFERENCES Empresa (Id_Empresa)
)
 
INSERT INTO Pessoa VALUES ('12345678912','aLICE','FKDFDS','FASDFD','2')

select * from Pessoa

--criando tabela Entregador
CREATE TABLE Entregador (
Id_Entregador Int PRIMARY KEY identity,
Cpf char(11),
Nome varchar(255),
Login varchar(255),
Senha varchar(255)
)

select * from Entregador

--criando tabela produto
CREATE TABLE Produto (
Id_Produto Int PRIMARY KEY identity,
Descricao varchar(255),
Nome varchar(255)
)

--criando tabela horario_limite
CREATE TABLE Horario_limite (
Id_Horario Int PRIMARY KEY identity,
hora_Limite time,
hora_entrega time
)

--criando tabela pedido
create TABLE Pedido (
Id_Pedido Int PRIMARY KEY identity,
Data_pedido Date,
Total decimal(5,2),
Id_empresa_pedido_fk Int
constraint Id_empresa_pedido_fk FOREIGN KEY(Id_empresa_pedido_fk) REFERENCES Empresa (Id_Empresa)
)

--criando tabela restaurante
create TABLE Restaurante (
Id_Restaurante Int PRIMARY KEY,
Cnpj Char(14),
Nome varchar(255),
Endereco varchar(450),
Cidade varchar(400),
Telefone char(20),
Login varchar(255),
Senha varchar(255),
Id_horario_fk Int,
constraint Id_horario_fk0 FOREIGN KEY(Id_horario_fk) REFERENCES Horario_limite (Id_Horario)
)

--criando tabela entrega
Create table Entrega(
id_Entrega int primary key identity,
Id_pedido_fk int,
constraint Id_pedido_fk1 FOREIGN KEY(Id_pedido_fk) REFERENCES Pedido (Id_Pedido)
)

--criando tabela cardapio
CREATE TABLE Cardapio (
Id_Cardapio Int PRIMARY KEY identity,
Data_Fim Date,
Data_ini Date,
Id_Restaurante_fk Int,
constraint Id_restaurante_fk0 FOREIGN KEY(Id_Restaurante_fk) REFERENCES Restaurante (Id_Restaurante)
)

--criando tabela compoem
CREATE TABLE Compoem (
Valor decimal(5,2),
Id_Cardapio_fk Int,
Id_Produto_fk Int,
constraint Id_cardapio_fk0 FOREIGN KEY(Id_Cardapio_fk) REFERENCES Cardapio (Id_Cardapio),
constraint Id_produto_fk0 FOREIGN KEY(Id_Produto_fk) REFERENCES Produto (Id_Produto)
)

--criando tabela possui_2
CREATE TABLE Possui_2 (
Qtd Int,
Observacao varchar(255),
Id_Produto_fk Int,
Id_Pedido_fk Int,
constraint Id_produto_fk1 FOREIGN KEY(Id_Produto_fk) REFERENCES Produto (Id_Produto),
constraint Id_pedido_fk0 FOREIGN KEY(Id_Pedido_fk) REFERENCES Pedido (Id_Pedido)
)

--criando tabela cria
CREATE TABLE Cria (
Marca_Registrada varchar(255),
Id_Restaurante_fk Int,
Id_Produto_fk Int,
constraint Id_produto_fk2 FOREIGN KEY(Id_Produto_fk) REFERENCES Produto (Id_Produto),
constraint Id_restaurante_fk1 FOREIGN KEY(Id_Restaurante_fk) REFERENCES Restaurante (Id_Restaurante)
)

--criando tabela emprega
CREATE TABLE Emprega (
Id_Empresa_fk Int,
Id_Pessoa_fk Int,
constraint Id_Empresa_fk1 FOREIGN KEY(Id_Empresa_fk) REFERENCES Empresa (Id_Empresa),
constraint Id_Pessoa_fk0 FOREIGN KEY(Id_Pessoa_fk) REFERENCES Pessoa (Id_Pessoa)
)

--criando tabela faz_convenio
CREATE TABLE Faz_Convenio (
Contrato varchar(255),
Data_Ini Date,
Data_Fim Date,
Id_Restaurante_fk Int,
Id_Empresa_fk Int,
constraint Id_empresa_fk2 FOREIGN KEY(Id_Empresa_fk) REFERENCES Empresa (Id_Empresa),
constraint Id_restaurante_fk2 FOREIGN KEY(Id_Restaurante_fk) REFERENCES Restaurante (Id_Restaurante)
)

--criando tabela possui_1
CREATE TABLE Possui_1 (
Id_Horario_fk Int
constraint Id_Horario_fk1 FOREIGN KEY(Id_Horario_fk) REFERENCES Horario_Limite (Id_Horario)
)




