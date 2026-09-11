-- =========================================================================
-- QUERIES DE EXEMPLO E RECONSTITUIÇÃO DA INFORMAÇÃO ORIGINAL
-- Curso de Licenciatura em Informática — Universidade Licungo
-- Base de Dados: GestaoFuncionariosDB
-- =========================================================================

USE GestaoFuncionariosDB;

-- =========================================================================
-- Query 1: Listagem Geral de Funcionários com Cargos e Funções
-- Reconstitui a relação principal ligando as chaves estrangeiras aos respetivos nomes de cargos e funções.
-- =========================================================================
SELECT 
    f.nuit, 
    f.bi, 
    f.nome, 
    f.data_nasc, 
    f.email, 
    CONCAT(f.avenida_rua, ', ', f.numero_bairro, ', ', f.bairro, ' - ', f.cidade, ' (', f.provincia, ')') AS endereco_completo,
    c.nome_cargo AS cargo, 
    fn.nome_funcao AS funcao, 
    f.posto_trabalho, 
    f.data_admissao
FROM Funcionario f
JOIN Cargo c ON f.id_cargo = c.id_cargo
JOIN Funcao fn ON f.id_funcao = fn.id_funcao;


-- =========================================================================
-- Query 2: Reconstituição dos Filhos por Funcionário
-- Utiliza um LEFT JOIN para garantir que todos os funcionários aparecem, 
-- mesmo aqueles que não têm filhos registados na tabela associativa.
-- =========================================================================
SELECT 
    f.nuit,
    f.nome AS funcionario, 
    COALESCE(fi.nome_filho, 'Sem filhos registados') AS filho_registado
FROM Funcionario f
LEFT JOIN Filho fi ON f.nuit = fi.nuit;


-- =========================================================================
-- Query 3: Ficha Completa e Consolidada de um Funcionário Específico
-- Demonstra a união de todas as tabelas (Funcionário, Cargo, Função, Contactos e Filhos)
-- agrupando os dados multivalorados numa única linha de visualização.
-- Exemplo focado no funcionário com NUIT '100234567' (Amélia Cossa).
-- =========================================================================
SELECT 
    f.nuit, 
    f.nome, 
    f.bi, 
    f.email, 
    CONCAT(f.avenida_rua, ', ', f.numero_bairro, ', ', f.bairro) AS morada,
    f.cidade, 
    f.provincia, 
    f.pais,
    c.nome_cargo, 
    fn.nome_funcao,
    f.posto_trabalho,
    f.data_admissao,
    GROUP_CONCAT(DISTINCT ct.telefone SEPARATOR ', ') AS contactos_telefonicos,
    GROUP_CONCAT(DISTINCT fi.nome_filho SEPARATOR ', ') AS filhos
FROM Funcionario f
LEFT JOIN Cargo c ON f.id_cargo = c.id_cargo
LEFT JOIN Funcao fn ON f.id_funcao = fn.id_funcao
LEFT JOIN Contacto ct ON f.nuit = ct.nuit
LEFT JOIN Filho fi ON f.nuit = fi.nuit
WHERE f.nuit = '100234567'
GROUP BY f.nuit;
