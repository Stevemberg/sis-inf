-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 06-Dez-2023 às 04:26
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dizai`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_item`
--

CREATE TABLE `avaliacao_item` (
  `id` int(11) NOT NULL,
  `fk_avaliacao` int(11) NOT NULL,
  `fk_item_avaliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `fk_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instalacao`
--

CREATE TABLE `instalacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_avaliado`
--

CREATE TABLE `item_avaliado` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `id` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_departamento`
--

CREATE TABLE `professor_departamento` (
  `id` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `fk_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_turma`
--

CREATE TABLE `professor_turma` (
  `id` int(11) NOT NULL,
  `fk_professor` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `ano` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `fk_instalacao` int(11) NOT NULL,
  `fk_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `curso` varchar(100) NOT NULL,
  `vinculado_daces` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_turma`
--

CREATE TABLE `usuario_turma` (
  `id` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_turma` (`fk_turma`),
  ADD KEY `fk_usuario` (`fk_usuario`);

--
-- Índices para tabela `avaliacao_item`
--
ALTER TABLE `avaliacao_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_avaliacao` (`fk_avaliacao`),
  ADD KEY `fk_item_avaliado` (`fk_item_avaliado`);

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamento` (`fk_departamento`);

--
-- Índices para tabela `instalacao`
--
ALTER TABLE `instalacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `item_avaliado`
--
ALTER TABLE `item_avaliado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `professor_departamento`
--
ALTER TABLE `professor_departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_departamento` (`fk_departamento`);

--
-- Índices para tabela `professor_turma`
--
ALTER TABLE `professor_turma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_turma` (`fk_turma`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_disciplina` (`fk_disciplina`),
  ADD KEY `fk_instalacao` (`fk_instalacao`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `usuario_turma`
--
ALTER TABLE `usuario_turma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_turma` (`fk_turma`),
  ADD KEY `fk_usuario` (`fk_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao_item`
--
ALTER TABLE `avaliacao_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `instalacao`
--
ALTER TABLE `instalacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_avaliado`
--
ALTER TABLE `item_avaliado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor_departamento`
--
ALTER TABLE `professor_departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor_turma`
--
ALTER TABLE `professor_turma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_turma`
--
ALTER TABLE `usuario_turma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`fk_turma`) REFERENCES `turma` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `avaliacao_item`
--
ALTER TABLE `avaliacao_item`
  ADD CONSTRAINT `avaliacao_item_ibfk_1` FOREIGN KEY (`fk_avaliacao`) REFERENCES `avaliacao` (`id`),
  ADD CONSTRAINT `avaliacao_item_ibfk_2` FOREIGN KEY (`fk_item_avaliado`) REFERENCES `item_avaliado` (`id`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`fk_departamento`) REFERENCES `departamento` (`id`);

--
-- Limitadores para a tabela `professor_departamento`
--
ALTER TABLE `professor_departamento`
  ADD CONSTRAINT `professor_departamento_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`id`),
  ADD CONSTRAINT `professor_departamento_ibfk_2` FOREIGN KEY (`fk_departamento`) REFERENCES `departamento` (`id`);

--
-- Limitadores para a tabela `professor_turma`
--
ALTER TABLE `professor_turma`
  ADD CONSTRAINT `professor_turma_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`id`),
  ADD CONSTRAINT `professor_turma_ibfk_2` FOREIGN KEY (`fk_turma`) REFERENCES `turma` (`id`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`fk_disciplina`) REFERENCES `disciplina` (`id`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`fk_instalacao`) REFERENCES `instalacao` (`id`);

--
-- Limitadores para a tabela `usuario_turma`
--
ALTER TABLE `usuario_turma`
  ADD CONSTRAINT `usuario_turma_ibfk_1` FOREIGN KEY (`fk_turma`) REFERENCES `turma` (`id`),
  ADD CONSTRAINT `usuario_turma_ibfk_2` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
