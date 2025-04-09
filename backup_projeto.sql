-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Abr-2025 às 21:03
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--
CREATE DATABASE IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairros`
--

DROP TABLE IF EXISTS `bairros`;
CREATE TABLE `bairros` (
  `id` int(11) NOT NULL,
  `bairro` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `bairros`
--

INSERT INTO `bairros` (`id`, `bairro`) VALUES
(1, 'Nadyr de Paula Edua'),
(2, 'Vila Portuguesa'),
(3, 'Jardim Alvorada'),
(4, 'Nova Prudente'),
(5, 'Parque Industrial Ta'),
(6, 'Residencial e Comer'),
(7, 'Conjunto Residencia'),
(8, 'Vale do Sol'),
(9, 'Jardim do Bosque'),
(10, 'Jardim Comendador'),
(11, 'Núcleo de Desenvol'),
(12, 'Jardim Nadir I'),
(13, 'Parque Residencial'),
(14, 'Jardim Paraiso'),
(15, 'Centro ( Guariroba )'),
(16, 'Tennis Park Condom'),
(17, 'Jardim Contendas'),
(18, 'Conjunto Habitacion'),
(19, 'Jardim Buscardi'),
(20, 'Villagio D\'Itália'),
(21, 'Residencial Alto da'),
(22, 'Quinta da Boa Vista'),
(23, 'Jardim Ribeirãozinho'),
(24, 'Jardim Doutor Élcio'),
(25, 'Jardim Ignez'),
(26, 'Jardim Sobral'),
(27, 'Santa Cruz'),
(28, 'Jardim São Sebastiã'),
(29, 'Nova Matão'),
(30, 'Parque Mônaco'),
(31, 'Jardim Brasil'),
(32, 'Jardim Brasil II'),
(33, 'Portal Terra da Saudade'),
(34, 'Residencial Nova Aurora');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE `cidades` (
  `id` int(11) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `idestado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`id`, `cidade`, `idestado`) VALUES
(1, 'Taquaritinga', 1),
(2, 'Taquaritingal', 1),
(3, 'Matão', 1),
(4, 'Rio de Janeiro', 2),
(5, 'Belo Horizonte', 3),
(6, 'Belo Horizonte', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(150) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `idbairro` int(11) DEFAULT NULL,
  `idcidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `cep`, `logradouro`, `numero`, `complemento`, `idbairro`, `idcidade`) VALUES
(27, '15901-553', 'Avenida Doutor Edner Antonio Sendão Accorsi', '3680', 'Apartamento', 1, 1),
(28, '15901-002', 'Avenida Francisco Area Leão', '3800', 'Loja', 2, 1),
(29, '15901-012', 'Avenida Francisco Area Leão', '3920', 'Casa', 3, 1),
(30, '15901-510', 'Avenida Francisco Area Leão', '4040', 'Casa', 4, 1),
(31, '15901-506', 'Avenida Francisco Area Leão', '4160', 'Casa', 5, 1),
(32, '15904-290', 'Avenida Gercina Alves Leite', '4280', 'Casa', 6, 1),
(33, '15902-180', 'Avenida Heitor Alves Gomes', '4400', 'Casa', 7, 1),
(34, '15901-280', 'Avenida Heitor Alves Gomes', '4520', 'Casa', 8, 1),
(35, '15906-852', 'Avenida José Almeida Rollo', '4640', 'Casa', 9, 1),
(36, '15906-260', 'Avenida Linda Antonio Mansur', '4760', 'Casa', 10, 1),
(37, '15907-894', 'Rua A', '4880', 'Casa', 11, 1),
(38, '15903-300', 'Rua Alice Arruda Campos', '5000', 'Casa', 12, 1),
(39, '15904-236', 'Rua Americo Antonio de Oliveira', '5120', 'Casa', 13, 1),
(40, '15906-646', 'Rua Antonio do Amaral Botelho', '5240', 'Casa', 14, 1),
(41, '15908-013', 'Rua Augusto Antônio Gonçalves', '5360', 'Casa', 15, 1),
(42, '15901-014', 'Rua Benedito Ananias de Camargo', '5480', 'Casa', 3, 1),
(43, '15901-370', 'Rua Benta de Andrade Rodrigues', '5600', 'Casa', 16, 1),
(44, '15902-012', 'Rua Caetano Álvaro Pastore', '5720', 'Casa', 17, 1),
(45, '15904-028', 'Rua Caetano Antunes Pereira', '5840', 'Casa', 13, 1),
(46, '15906-792', 'Rua Catharina Adorno Gonçalves', '5960', 'Casa', 18, 1),
(47, '15905-092', 'Rua Coronel Gustavo Augusto de Morais', '6080', 'Casa', 19, 1),
(48, '15905-130', 'Rua Diva Adelina Davóglio de Pedro', '6200', 'Casa', 20, 1),
(49, '15902-350', 'Rua Domingos Antonio Lourençano', '6320', 'Casa', 21, 1),
(50, '15902-160', 'Rua Doutor Geraldo de Arruda Camargo', '6440', 'Casa', 13, 1),
(51, '15901-494', 'Rua Doutor Milve Antônio Peria', '6560', 'Casa', 22, 1),
(52, '15904-050', 'Rua Doutor Olavo Amorim Silveira', '6680', 'Casa', 13, 1),
(53, '15903-320', 'Rua Dromede Anna Calanca Constâncio', '6800', 'Apartamento', 18, 1),
(54, '15901-516', 'Rua Eder Aparecido Andreguetto', '6920', 'Loja', 4, 1),
(55, '15901-092', 'Rua Ernesto Antunes dos Santos', '7040', 'Casa', 23, 1),
(56, '15902-876', 'Rua Fermina Antonia da Silva Francsico', '7160', 'Casa', 24, 1),
(57, '15908-005', 'Rua Fermino Antonio Gonçalves', '7280', 'Casa', 15, 1),
(58, '15903-276', 'Rua Flavio Antonio Mazzi', '7400', 'Casa', 25, 1),
(59, '15901-550', 'Rua Francisco Antonio Arnoni', '7520', 'Casa', 1, 1),
(60, '15906-330', 'Rua Francisco Antonio José', '7640', 'Casa', 26, 1),
(61, '15905-127', 'Rua Hayde Arnoni Milhossi', '7760', 'Casa', 20, 1),
(62, '15904-052', 'Rua Jesumina de Andréa Pascali', '7880', 'Casa', 13, 1),
(63, '15903-398', 'Rua João Antonio de Oliveira', '8000', 'Casa', 18, 1),
(64, '15902-196', 'Rua Joaquim Alves da Silva Leitão', '8120', 'Casa', 7, 1),
(65, '15901-284', 'Rua José Alves Prata', '8240', 'Casa', 8, 1),
(66, '15906-282', 'Rua José Antonio Ferrari', '8360', 'Casa', 27, 1),
(67, '15903-118', 'Rua José Arruda Campos', '8480', 'Casa', 28, 1),
(68, '15902-882', 'Rua José Augusto Sabbatini', '8600', 'Casa', 24, 1),
(69, '15904-096', 'Rua Lavínia de Abreu Moreira da Silva', '8720', 'Casa', 13, 1),
(70, '15904-126', 'Rua Leopoldina Augusta da Rocha', '8840', 'Casa', 13, 2),
(71, '15906-686', 'Rua Luiz Alberto Zucchi', '8960', 'Casa', 14, 1),
(72, '15902-010', 'Rua Major Calderazzo - de 200 a 710 - lado par', '9080', 'Casa', 17, 1),
(73, '15990-560', 'Avenida Daniel Antônio Brito', '145', 'Casa', 29, 3),
(74, '15993-722', 'Avenida David Antonio Sbrissa', '169', 'Casa', 30, 3),
(75, '15996-098', 'Avenida Domingos Mariani - de 540/541 a 649/650', '193', 'Casa', 31, 3),
(76, '15996-130', 'Avenida Domingos Mariani - de 651/652 a 818/819', '217', 'Casa', 32, 3),
(77, '15997-484', 'Avenida Dorival Aparecido Mendonça', '241', 'Casa', 33, 3),
(78, '15992-122', 'Avenida Doutor Hélio Antonio Bernardi', '265', 'Casa', 34, 3),
(79, '15997-536', 'Avenida Edgar Piva ( Gazinho ) - de 400/401 a 898/899', '289', 'Casa', 33, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `estado` varchar(80) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `estados`
--

INSERT INTO `estados` (`id`, `estado`, `uf`) VALUES
(1, 'São Paulo', 'SP'),
(2, 'Rio de Janeiro', 'RJ'),
(3, 'Minas Gerais', 'MG');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bairros`
--
ALTER TABLE `bairros`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bairros`
--
ALTER TABLE `bairros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de tabela `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
