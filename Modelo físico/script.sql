USE [DBANDOR]
GO
/****** Object:  Table [dbo].[Experiencias]    Script Date: 08/01/2022 20:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiencias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_pessoa] [int] NOT NULL,
	[Nome] [nvarchar](40) NULL,
	[Descricao] [nvarchar](200) NULL,
	[Cargo] [nvarchar](20) NULL,
	[Instituicao] [nvarchar](20) NULL,
	[Inicio] [datetime] NULL,
	[Fim] [datetime] NULL,
	[PessoaId] [int] NULL,
 CONSTRAINT [PK_Experiencias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formacoes]    Script Date: 08/01/2022 20:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formacoes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_pessoa] [int] NOT NULL,
	[Nome] [nvarchar](40) NULL,
	[Descricao] [nvarchar](200) NULL,
	[Instituicao] [nvarchar](20) NULL,
	[Inicio] [datetime] NULL,
	[Fim] [datetime] NULL,
	[Situacao] [nvarchar](10) NULL,
	[PessoaId] [int] NULL,
 CONSTRAINT [PK_Formacoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moradias]    Script Date: 08/01/2022 20:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moradias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_pessoa] [int] NOT NULL,
	[Name] [nvarchar](40) NULL,
	[Descricao] [nvarchar](200) NULL,
	[Tipo] [nvarchar](15) NULL,
	[Preco] [money] NOT NULL,
	[Endereco] [nvarchar](60) NULL,
	[Numero] [int] NOT NULL,
	[CEP] [int] NOT NULL,
	[UF] [nvarchar](2) NULL,
	[Cidade] [nvarchar](20) NULL,
	[NomeContato] [nvarchar](40) NULL,
	[TelefoneContato] [nvarchar](13) NULL,
	[EmailContato] [nvarchar](40) NULL,
	[DataCadastro] [datetime] NOT NULL,
	[PessoaId] [int] NULL,
 CONSTRAINT [PK_Moradias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 08/01/2022 20:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[Senha] [nvarchar](15) NOT NULL,
	[Telefone] [nvarchar](13) NULL,
	[CRNM] [nvarchar](15) NULL,
	[CPF] [nvarchar](11) NULL,
	[Endereco] [nvarchar](60) NULL,
	[Numero] [int] NOT NULL,
	[CEP] [int] NOT NULL,
	[Sexo] [nvarchar](1) NULL,
	[DataNascimento] [datetime] NULL,
	[Nacionalidade] [nvarchar](20) NULL,
	[DataCadastro] [datetime] NULL,
	[Classe] [nvarchar](10) NULL,
 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabalhos]    Script Date: 08/01/2022 20:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabalhos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_pessoa] [int] NOT NULL,
	[Instituicao] [nvarchar](20) NULL,
	[Nome] [nvarchar](40) NULL,
	[Atividade] [nvarchar](200) NULL,
	[Tipo] [nvarchar](10) NULL,
	[Salario] [money] NOT NULL,
	[Endereco] [nvarchar](60) NULL,
	[Numero] [int] NOT NULL,
	[CEP] [int] NOT NULL,
	[UF] [nvarchar](max) NULL,
	[Cidade] [nvarchar](20) NULL,
	[NomeContato] [nvarchar](40) NULL,
	[TelefoneContato] [nvarchar](13) NULL,
	[EmailContato] [nvarchar](40) NULL,
	[DataCadastro] [datetime] NOT NULL,
	[PessoaId] [int] NULL,
 CONSTRAINT [PK_Trabalhos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Experiencias]  WITH CHECK ADD  CONSTRAINT [FK_Experiencias_Pessoas_PessoaId] FOREIGN KEY([PessoaId])
REFERENCES [dbo].[Pessoas] ([Id])
GO
ALTER TABLE [dbo].[Experiencias] CHECK CONSTRAINT [FK_Experiencias_Pessoas_PessoaId]
GO
ALTER TABLE [dbo].[Formacoes]  WITH CHECK ADD  CONSTRAINT [FK_Formacoes_Pessoas_PessoaId] FOREIGN KEY([PessoaId])
REFERENCES [dbo].[Pessoas] ([Id])
GO
ALTER TABLE [dbo].[Formacoes] CHECK CONSTRAINT [FK_Formacoes_Pessoas_PessoaId]
GO
ALTER TABLE [dbo].[Moradias]  WITH CHECK ADD  CONSTRAINT [FK_Moradias_Pessoas_PessoaId] FOREIGN KEY([PessoaId])
REFERENCES [dbo].[Pessoas] ([Id])
GO
ALTER TABLE [dbo].[Moradias] CHECK CONSTRAINT [FK_Moradias_Pessoas_PessoaId]
GO
ALTER TABLE [dbo].[Trabalhos]  WITH CHECK ADD  CONSTRAINT [FK_Trabalhos_Pessoas_PessoaId] FOREIGN KEY([PessoaId])
REFERENCES [dbo].[Pessoas] ([Id])
GO
ALTER TABLE [dbo].[Trabalhos] CHECK CONSTRAINT [FK_Trabalhos_Pessoas_PessoaId]
GO
