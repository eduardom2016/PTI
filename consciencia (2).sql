-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 01-Set-2016 às 12:17
-- Versão do servidor: 5.5.47-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `consciencia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `dataComentario` date NOT NULL,
  `textoComentario` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `idConteudo` int(11) NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_comentario_usuario1_idx` (`idUsuario`),
  KEY `fk_comentario_conteudo1_idx` (`idConteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conteudo`
--

CREATE TABLE IF NOT EXISTS `conteudo` (
  `idConteudo` int(11) NOT NULL AUTO_INCREMENT,
  `dataConteudo` date NOT NULL,
  `textoConteudo` blob NOT NULL,
  `idTipoConteudo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`idConteudo`),
  KEY `fk_conteudo_tipoConteudo1_idx` (`idTipoConteudo`),
  KEY `fk_conteudo_usuario1_idx` (`idUsuario`),
  KEY `fk_conteudo_disciplina1_idx` (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nomeDisciplina` varchar(45) NOT NULL,
  PRIMARY KEY (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`idDisciplina`, `nomeDisciplina`) VALUES
(1, 'Filosofia'),
(2, 'Sociologia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoConteudo`
--

CREATE TABLE IF NOT EXISTS `tipoConteudo` (
  `idTipoConteudo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeConteudo` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoConteudo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tipoConteudo`
--

INSERT INTO `tipoConteudo` (`idTipoConteudo`, `nomeConteudo`) VALUES
(1, 'Filmes'),
(2, 'Artigos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoUsuario`
--

CREATE TABLE IF NOT EXISTS `tipoUsuario` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tipoUsuario`
--

INSERT INTO `tipoUsuario` (`idTipo`, `nomeUsuario`) VALUES
(1, 'Administrador'),
(2, 'User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `idTipo` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_tipoUsuario_idx` (`idTipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `email`, `senha`, `idTipo`) VALUES
(1, 'Eduardo', 'edu@gmail.com', '123', 1),
(2, 'Rafaela', 'rafa@gmail.com', '123', 2),
(5, 'fdsdfsg', 'dfgdgdgdf', '123', 2),
(6, 'bruninha', 'bruninhas2', '12345', 2),
(7, 'fsfdsfagfsd', 'eduardo', '123', 2),
(8, 'adadadada', 'sdsdad', '123', 2),
(9, 'sdwadf', 'sadasdsa', '123', 2),
(10, 'asdsadsad', 'sadafdaf', '123', 2),
(11, 'kkkkk', 'kkkkkkkkkk', '123', 2),
(12, '11111', '1111111', '123', 2),
(13, 'Rafaea', 'ramaaaa', '123', 2),
(14, 'Eduardo', 'ramsos', '123', 2),
(15, 'Eduardo', 'SFDGH@dewdfsd.com', '123', 2);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentario_conteudo1` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `conteudo`
--
ALTER TABLE `conteudo`
  ADD CONSTRAINT `fk_conteudo_tipoConteudo1` FOREIGN KEY (`idTipoConteudo`) REFERENCES `tipoConteudo` (`idTipoConteudo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conteudo_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conteudo_disciplina1` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipoUsuario` FOREIGN KEY (`idTipo`) REFERENCES `tipoUsuario` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
