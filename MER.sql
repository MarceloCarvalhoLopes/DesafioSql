CREATE TABLE dbo.Fornecedor (
    Codigo INT NOT NULL,
    Nome nvarchar(110),
    cpfCnpj nvarchar(14),
	CONSTRAINT PK_Fornecedor_Id PRIMARY KEY(Codigo)
);

CREATE TABLE dbo.ContasAPagar (
    Numero INT NOT NULL,
    FornecedorCodigo INT NOT NULL,
    DataVencimento Date,
	DataProrrogacao Date,
	Valor Numeric(18,6),
	Acrescimo Numeric(18,6),
	Desconto Numeric(18,6),
	CONSTRAINT PK_ContasAPagar_Numero PRIMARY KEY(Numero),
	CONSTRAINT FK_Fornec_A_Pagar_Codigo FOREIGN KEY (FornecedorCodigo) REFERENCES dbo.Fornecedor(Codigo) ON DELETE CASCADE
);

CREATE TABLE dbo.ContasPagas (
    Numero INT NOT NULL,
    FornecedorCodigo INT NOT NULL,
    DataVencimento Date,
	DataPagamento Date,
	Valor Numeric(18,6),
	Acrescimo Numeric(18,6),
	Desconto Numeric(18,6),
	CONSTRAINT PK_ContasPagas_Id PRIMARY KEY(Numero),
	CONSTRAINT FK_Fornec_Paga_Codigo FOREIGN KEY (FornecedorCodigo) REFERENCES dbo.Fornecedor(Codigo) ON DELETE CASCADE
);


INSERT INTO Fornecedor (Codigo, Nome, cpfCnpj) values (1,'João da Silva','490.000.210-06');

INSERT INTO ContasAPagar(
						   Numero,
						   FornecedorCodigo,
						   DataVencimento,
						   DataProrrogacao,
						   Valor,
						   Acrescimo,
						   Desconto) 
                     values (
							 123,
							 1,
							 '2024-06-23',
							 '2024-06-24',
							 550,
							 2,
							 3);,
							 

	INSERT INTO ContasPagas(
						   Numero,
						   FornecedorCodigo,
						   DataVencimento,
						   DataPagamento,
						   Valor,
						   Acrescimo,
						   Desconto) 
                     values (
							 123,
							 1,
							 '2024-06-23',
							 '2024-06-23',
							 550,
							 2,
							 3);							 
							 

SELECT CP.Numero,
	   F.Nome,
	   CP.DataVencimento,
	   CP.DataPagamento,
	   CP.Valor,
	   CASE 
	       WHEN CAP.DataVencimento = CP.DataPagamento THEN 'CONTA PAGA'
		   ELSE 'CONTA A PAGAR'
	   END AS IDENTIFICADOR
  FROM Fornecedor F
 INNER JOIN ContasPagas CP ON CP.FornecedorCodigo = F.Codigo
 INNER JOIN ContasAPagar CAP ON CAP.FornecedorCodigo = F.Codigo AND CAP.Numero = CP.Numero
							 
							 
							 
							 
							 
							 
							 
							 