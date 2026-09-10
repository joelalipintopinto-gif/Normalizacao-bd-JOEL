
DROP DATABASE IF EXISTS GestaoFuncionariosDB;
CREATE DATABASE GestaoFuncionariosDB;
USE GestaoFuncionariosDB;


CREATE TABLE Cargo (
    id_cargo VARCHAR(10) PRIMARY KEY,
    nome_cargo VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Funcao (
    id_funcao VARCHAR(10) PRIMARY KEY,
    nome_funcao VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Funcionario (
    nuit VARCHAR(20) PRIMARY KEY,
    bi VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    email VARCHAR(100),
    avenida_rua VARCHAR(150),
    numero_bairro VARCHAR(50),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    provincia VARCHAR(100),
    pais VARCHAR(50) DEFAULT 'Moçambique',
    posto_trabalho VARCHAR(100),
    data_admissao DATE,
    id_cargo VARCHAR(10),
    id_funcao VARCHAR(10),
    CONSTRAINT fk_funcionario_cargo FOREIGN KEY (id_cargo) 
        REFERENCES Cargo(id_cargo) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_funcionario_funcao FOREIGN KEY (id_funcao) 
        REFERENCES Funcao(id_funcao) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Filho (
    nuit VARCHAR(20),
    nome_filho VARCHAR(150),
    PRIMARY KEY (nuit, nome_filho),
    CONSTRAINT fk_filho_funcionario FOREIGN KEY (nuit) 
        REFERENCES Funcionario(nuit) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Contacto (
    nuit VARCHAR(20),
    telefone VARCHAR(20),
    PRIMARY KEY (nuit, telefone),
    CONSTRAINT fk_contacto_funcionario FOREIGN KEY (nuit) 
        REFERENCES Funcionario(nuit) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- =========================================================================
-- 2. INSERÇÃO DE TODOS OS DADOS REAIS DO ANEXO (16 Registos)
-- =========================================================================

-- Inserir Tabela de Referência de Cargos
INSERT INTO Cargo (id_cargo, nome_cargo) VALUES
('C01', 'Técnico de Informática'),
('C02', 'Contabilista'),
('C03', 'Engenheiro Civil'),
('C04', 'Enfermeiro'),
('C05', 'Professor'),
('C06', 'Motorista'),
('C07', 'Gestor de Recursos Humanos'),
('C08', 'Assistente Administrativo');

-- Inserir Tabela de Referência de Funções
INSERT INTO Funcao (id_funcao, nome_funcao) VALUES
('F01', 'Tecnologias de Informação'),
('F02', 'Finanças'),
('F03', 'Engenharia'),
('F04', 'Saúde'),
('F05', 'Educação'),
('F06', 'Logística'),
('F07', 'Recursos Humanos'),
('F08', 'Administração');

-- Inserir os 16 Funcionários
INSERT INTO Funcionario (nuit, bi, nome, data_nasc, email, avenida_rua, numero_bairro, bairro, cidade, provincia, pais, posto_trabalho, data_admissao, id_cargo, id_funcao) VALUES
('100234567', '110100123456A', 'Amélia Fernanda Cossa', '1985-03-12', 'amelia.cossa@empresa.co.mz', 'Av. Julius Nyerere', 'n.º 245', 'Sommerschield', 'Maputo', 'Maputo Cidade', 'Moçambique', 'Sede Maputo', '2015-02-05', 'C01', 'F01'),
('100345678', '110100234567B', 'Bernardo Alfredo Machava', '1979-07-22', 'bernardo.machava@empresa.co.mz', 'Rua da Resistência', 'n.º 8', 'Polana Caniço', 'Maputo', 'Maputo Cidade', 'Moçambique', 'Sede Maputo', '2010-09-14', 'C02', 'F02'),
('100456789', '110200345678C', 'Celina Armando Sitoe', '1990-11-03', 'celina.sitoe@empresa.co.mz', 'Av. Samora Machel', 'n.º 12', 'Fomento', 'Matola', 'Maputo Província', 'Moçambique', 'Delegação Matola', '2018-06-01', 'C08', 'F08'),
('100567890', '110300456789D', 'Domingos Paulo Nhantumbo', '1982-01-30', 'domingos.nhantumbo@empresa.co.mz', 'Rua 3', 'n.º 56', 'Chókwè-Sede', 'Chókwè', 'Gaza', 'Moçambique', 'Delegação Gaza', '2012-03-10', 'C06', 'F06'),
('100678901', '110400567890E', 'Eugénia Marta Muchanga', '1988-05-18', 'eugenia.muchanga@empresa.co.mz', 'Av. Eduardo Mondlane', 'n.º 301', 'Maxixe-Sede', 'Maxixe', 'Inhambane', 'Moçambique', 'Delegação Inhambane', '2016-08-20', 'C04', 'F04'),
('100789012', '110500678901F', 'Fernando José Macuácua', '1975-09-25', 'fernando.macuacua@empresa.co.mz', 'Av. Poder Popular', 'n.º 77', 'Macuti', 'Beira', 'Sofala', 'Moçambique', 'Delegação Beira', '2008-01-15', 'C03', 'F03'),
('100890123', '110600789012G', 'Graça Isabel Zunguze', '1992-12-07', 'graca.zunguze@empresa.co.mz', 'Rua da Frescura', 'n.º 19', 'Ponta Gêa', 'Beira', 'Sofala', 'Moçambique', 'Delegação Beira', '2019-02-02', 'C05', 'F05'),
('100901234', '110700890123H', 'Hélder António Cuamba', '1980-04-14', 'helder.cuamba@empresa.co.mz', 'Av. 25 de Setembro', 'n.º 150', 'Alto Maé', 'Maputo', 'Maputo Cidade', 'Moçambique', 'Sede Maputo', '2011-11-11', 'C07', 'F07'),
('101012345', '110800901234I', 'Ivete Sara Chirindza', '1995-06-29', 'ivete.chirindza@empresa.co.mz', 'Rua do Bagamoyo', 'n.º 5', 'Muhipiti', 'Nampula', 'Nampula', 'Moçambique', 'Delegação Nampula', '2020-07-03', 'C01', 'F01'),
('101123456', '110900012345J', 'João Baptista Nhaca', '1978-08-09', 'joao.nhaca@empresa.co.mz', 'Av. Josina Machel', 'n.º 200', 'Namahera', 'Nampula', 'Nampula', 'Moçambique', 'Delegação Nampula', '2009-05-25', 'C02', 'F02'),
('101234567', '111000123456K', 'Lúcia Ermelinda Bila', '1991-02-16', 'lucia.bila@empresa.co.mz', 'Rua da Base', 'n.º 33', 'Chaimite', 'Beira', 'Sofala', 'Moçambique', 'Delegação Beira', '2017-09-19', 'C08', 'F08'),
('101345678', '111100234567L', 'Marcelino Inácio Tembe', '1983-10-21', 'marcelino.tembe@empresa.co.mz', 'Av. Kwame Nkrumah', 'n.º 410', 'Coop', 'Maputo', 'Maputo Cidade', 'Moçambique', 'Sede Maputo', '2013-04-08', 'C03', 'F03'),
('101456789', '111200345678M', 'Noémia Alzira Massingue', '1987-03-04', 'noemia.massingue@empresa.co.mz', 'Rua de Chimoio', 'n.º 67', 'Chingussura', 'Chimoio', 'Manica', 'Moçambique', 'Delegação Manica', '2014-12-12', 'C04', 'F04'),
('101567890', '111300456789N', 'Osvaldo Simião Ubisse', '1976-07-27', 'osvaldo.ubisse@empresa.co.mz', 'Av. 7 de Setembro', 'n.º 90', 'Matundo', 'Tete', 'Tete', 'Moçambique', 'Delegação Tete', '2006-10-30', 'C06', 'F06'),
('101678901', '111400567890O', 'Paulina Fátima Uache', '1993-01-15', 'paulina.uache@empresa.co.mz', 'Rua da Missão', 'n.º 24', 'Chalaua', 'Quelimane', 'Zambézia', 'Moçambique', 'Delegação Zambézia', '2021-09-09', 'C05', 'F05'),
('101789012', '111500678901P', 'Ricardo Manuel Come', '1981-06-02', 'ricardo.come@empresa.co.mz', 'Av. Franqueza', 'n.º 18', 'Chuwaula', 'Pemba', 'Cabo Delgado', 'Moçambique', 'Delegação Cabo Delgado', '2010-07-17', 'C07', 'F07');

-- Inserir Filhos (Apenas para quem tem registados)
INSERT INTO Filho (nuit, nome_filho) VALUES
('100234567', 'Cátia Cossa'),
('100345678', 'Nelson Machava'),
('100345678', 'Ivete Machava'),
('100345678', 'Suzana Machava'),
('100567890', 'Paulo Nhantumbo Jr'),
('100567890', 'Alzira Nhantumbo'),
('100678901', 'Marta Muchanga'),
('100789012', 'José Macuácua'),
('100789012', 'Beatriz Macuácua'),
('100789012', 'Adriano Macuácua'),
('100901234', 'António Cuamba Jr'),
('100901234', 'Filomena Cuamba'),
('101123456', 'Baptista Nhaca Jr'),
('101234567', 'Ermelinda Bila'),
('101345678', 'Inácio Tembe Jr'),
('101345678', 'Rosa Tembe'),
('101567890', 'Simião Ubisse Jr'),
('101567890', 'Alcinda Ubisse'),
('101567890', 'Custódio Ubisse'),
('101789012', 'Manuel Come Jr');

-- Inserir Contactos Telefónicos (Celulares 1, 2 e 3 conforme o anexo)
INSERT INTO Contacto (nuit, telefone) VALUES
('100234567', '841234567'), ('100234567', '821234567'),
('100345678', '845678901'),
('100456789', '861122334'),
('100567890', '847890123'), ('100567890', '878901234'),
('100678901', '849012345'),
('100789012', '823456789'), ('100789012', '843456789'), ('100789012', '863456789'),
('100890123', '844567890'), ('100890123', '824567890'),
('100901234', '825678901'),
('101012345', '846789012'),
('101123456', '827890123'), ('101123456', '847890124'),
('101234567', '848901234'),
('101345678', '829012345'), ('101345678', '849012346'), ('101345678', '869012347'),
('101456789', '841122334'),
('101567890', '822233445'), ('101567890', '842233445'),
('101678901', '843344556'),
('101789012', '824455667'), ('101789012', '844455667');


-- =========================================================================
-- 3. QUERIES DE VALIDAÇÃO E RECONSTITUIÇÃO
-- =========================================================================

-- Consultar todos os funcionários com os respetivos cargos e funções normalizadas
SELECT 
    f.nuit, f.nome, f.cidade, 
    c.nome_cargo AS cargo, 
    fn.nome_funcao AS funcao
FROM Funcionario f
JOIN Cargo c ON f.id_cargo = c.id_cargo
JOIN Funcao fn ON f.id_funcao = fn.id_funcao;

