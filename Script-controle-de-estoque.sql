--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2022-11-02 21:55:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 7 (class 2615 OID 41495)
-- Name: schm_cliente; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schm_cliente;


ALTER SCHEMA schm_cliente OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 16606)
-- Name: schm_produto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schm_produto;


ALTER SCHEMA schm_produto OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 75352)
-- Name: schm_usuario; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schm_usuario;


ALTER SCHEMA schm_usuario OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 41740)
-- Name: ft_inserir_clientes(integer, character varying, character varying); Type: FUNCTION; Schema: schm_cliente; Owner: postgres
--

CREATE FUNCTION schm_cliente.ft_inserir_clientes(codigo integer, nome character varying, telefone character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$ 
	BEGIN 
	
	insert into schm_cliente.tb_clientes(col_codigo, col_nome) values ($1, $2);
 	insert into schm_cliente.tb_telefones(col_fixo) values($3);
	insert into schm_cliente.tb_telefones_clientes(col_id_telefone, col_id_cliente) 
			values((select max(col_id) from schm_cliente.tb_telefones  ), (select max(col_id) from schm_cliente.tb_clientes where col_codigo = codigo));
	 
	END; 
	$_$;


ALTER FUNCTION schm_cliente.ft_inserir_clientes(codigo integer, nome character varying, telefone character varying) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 49944)
-- Name: ft_inserir_clientes(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, character varying, character varying, character varying); Type: FUNCTION; Schema: schm_cliente; Owner: postgres
--

CREATE FUNCTION schm_cliente.ft_inserir_clientes(codigo integer, nome character varying, sobrenome character varying, datadenascimento date, sexo character varying, rg character varying, cpf character varying, cnpj character varying, ie character varying, "razãosocial" character varying, nomefantasia character varying, "responsável" character varying, "observações" text, email character varying, celular character varying, telefone character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$ 
	BEGIN 
	
	insert into schm_cliente.tb_clientes(col_codigo, col_nome, col_sobrenome,
										col_data_de_nascimento, col_sexo, col_rg,
										col_cpf, col_cnpj, col_inscricao_estadual, col_razao_social,
										col_nome_fantasia, col_responsavel, col_observacao, col_email
										) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14);
 	insert into schm_cliente.tb_telefones(col_celular,col_fixo, col_id_cliente) values($15, $16, 
				   (select max(col_id) from schm_cliente.tb_clientes where col_codigo = codigo));
	/**
	insert into schm_cliente.tb_telefones_clientes(col_id_telefone, col_id_cliente) 
			values((select max(col_id) from schm_cliente.tb_telefones), 
				   (select max(col_id) from schm_cliente.tb_clientes where col_codigo = codigo));
	 **/
	END; 
	$_$;


ALTER FUNCTION schm_cliente.ft_inserir_clientes(codigo integer, nome character varying, sobrenome character varying, datadenascimento date, sexo character varying, rg character varying, cpf character varying, cnpj character varying, ie character varying, "razãosocial" character varying, nomefantasia character varying, "responsável" character varying, "observações" text, email character varying, celular character varying, telefone character varying) OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 58145)
-- Name: ft_inserir_clientes(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, character varying, character varying, character varying); Type: FUNCTION; Schema: schm_cliente; Owner: postgres
--

CREATE FUNCTION schm_cliente.ft_inserir_clientes(codigo integer, nome character varying, sobrenome character varying, datadenascimento character varying, sexo character varying, rg character varying, cpf character varying, cnpj character varying, ie character varying, "razãosocial" character varying, nomefantasia character varying, "responsável" character varying, "observações" text, email character varying, celular character varying, telefone character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$ 
	BEGIN 
	
	insert into schm_cliente.tb_clientes(col_codigo, col_nome, col_sobrenome,
										col_data_de_nascimento, col_sexo, col_rg,
										col_cpf, col_cnpj, col_inscricao_estadual, col_razao_social,
										col_nome_fantasia, col_responsavel, col_observacao, col_email
										) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14);
 	insert into schm_cliente.tb_telefones(col_celular,col_fixo) values($15, $16);
	insert into schm_cliente.tb_telefones_clientes(col_id_telefone, col_id_cliente) 
			values((select max(col_id) from schm_cliente.tb_telefones), 
				   (select max(col_id) from schm_cliente.tb_clientes where col_codigo = codigo));
	 
	END; 
	$_$;


ALTER FUNCTION schm_cliente.ft_inserir_clientes(codigo integer, nome character varying, sobrenome character varying, datadenascimento character varying, sexo character varying, rg character varying, cpf character varying, cnpj character varying, ie character varying, "razãosocial" character varying, nomefantasia character varying, "responsável" character varying, "observações" text, email character varying, celular character varying, telefone character varying) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 157546)
-- Name: alterar_estoque_saida(integer, numeric); Type: FUNCTION; Schema: schm_produto; Owner: postgres
--

CREATE FUNCTION schm_produto.alterar_estoque_saida(integer, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$ 
DECLARE   v_coluna_quantidade numeric := $2;   
 
BEGIN 

update schm_produto.tb_produtos produto 
 set col_quantidade = col_quantidade - v_coluna_quantidade WHERE col_id = $1;
 
  
 
  RETURN v_coluna_quantidade; 
 
END; 
$_$;


ALTER FUNCTION schm_produto.alterar_estoque_saida(integer, numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 222 (class 1259 OID 75437)
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    col_id integer NOT NULL,
    col_nome character varying(30)
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 75435)
-- Name: tb_user_col_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_user_col_id_seq OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_user_col_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_col_id_seq OWNED BY public.tb_user.col_id;


--
-- TOC entry 215 (class 1259 OID 58595)
-- Name: tb_clientes; Type: TABLE; Schema: schm_cliente; Owner: postgres
--

CREATE TABLE schm_cliente.tb_clientes (
    col_id integer NOT NULL,
    col_codigo integer NOT NULL,
    col_nome character varying(100) NOT NULL,
    col_sobrenome character varying(100),
    col_data_de_nascimento date,
    col_sexo character varying(15),
    col_rg character varying(15),
    col_cpf character varying(15),
    col_cnpj character varying(19),
    col_inscricao_estadual character varying(19),
    col_razao_social character varying(100),
    col_nome_fantasia character varying(100),
    col_responsavel character varying(100),
    col_observacao text,
    col_email character varying(50)
);


ALTER TABLE schm_cliente.tb_clientes OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 58593)
-- Name: tb_clientes_col_id_seq; Type: SEQUENCE; Schema: schm_cliente; Owner: postgres
--

CREATE SEQUENCE schm_cliente.tb_clientes_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_cliente.tb_clientes_col_id_seq OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_clientes_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_cliente; Owner: postgres
--

ALTER SEQUENCE schm_cliente.tb_clientes_col_id_seq OWNED BY schm_cliente.tb_clientes.col_id;


--
-- TOC entry 219 (class 1259 OID 75006)
-- Name: tb_enderecos; Type: TABLE; Schema: schm_cliente; Owner: postgres
--

CREATE TABLE schm_cliente.tb_enderecos (
    col_id integer NOT NULL,
    col_cep character varying(9),
    col_logradouro character varying(150),
    col_numero character varying(20),
    col_complemento character varying(20),
    col_bairro character varying(50),
    col_cidade character varying(30),
    col_estado character varying(30),
    col_pais character varying(30),
    col_tipo_de_enderecos character varying(30),
    col_id_cliente integer
);


ALTER TABLE schm_cliente.tb_enderecos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 75004)
-- Name: tb_enderecos_col_id_seq; Type: SEQUENCE; Schema: schm_cliente; Owner: postgres
--

CREATE SEQUENCE schm_cliente.tb_enderecos_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_cliente.tb_enderecos_col_id_seq OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_enderecos_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_cliente; Owner: postgres
--

ALTER SEQUENCE schm_cliente.tb_enderecos_col_id_seq OWNED BY schm_cliente.tb_enderecos.col_id;


--
-- TOC entry 217 (class 1259 OID 74978)
-- Name: tb_telefones; Type: TABLE; Schema: schm_cliente; Owner: postgres
--

CREATE TABLE schm_cliente.tb_telefones (
    col_id integer NOT NULL,
    col_celular character varying(20),
    col_fixo character varying(20),
    col_id_cliente integer
);


ALTER TABLE schm_cliente.tb_telefones OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 74976)
-- Name: tb_telefones_col_id_seq; Type: SEQUENCE; Schema: schm_cliente; Owner: postgres
--

CREATE SEQUENCE schm_cliente.tb_telefones_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_cliente.tb_telefones_col_id_seq OWNER TO postgres;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_telefones_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_cliente; Owner: postgres
--

ALTER SEQUENCE schm_cliente.tb_telefones_col_id_seq OWNED BY schm_cliente.tb_telefones.col_id;


--
-- TOC entry 239 (class 1259 OID 157680)
-- Name: vw_clientes; Type: VIEW; Schema: schm_cliente; Owner: postgres
--

CREATE VIEW schm_cliente.vw_clientes AS
 SELECT DISTINCT clientes.col_codigo AS "Código",
    clientes.col_nome AS "Nome",
    clientes.col_sobrenome AS "Sobrenome",
    to_char((clientes.col_data_de_nascimento)::timestamp with time zone, 'dd-mm-yyyy'::text) AS "Data de nascimento",
    clientes.col_sexo AS "Sexo",
    clientes.col_rg AS "RG",
    clientes.col_cpf AS "CPF",
    clientes.col_cnpj AS "CNPJ",
    clientes.col_inscricao_estadual AS "I E",
    clientes.col_razao_social AS "Razão Social",
    clientes.col_nome_fantasia AS "Nome Fantasia",
    clientes.col_responsavel AS "Responsável",
    clientes.col_observacao AS "Observações",
    clientes.col_email AS "Email",
    telefones.col_celular AS "Celular",
    telefones.col_fixo AS "Fixo"
   FROM (schm_cliente.tb_clientes clientes
     LEFT JOIN schm_cliente.tb_telefones telefones ON ((clientes.col_id = telefones.col_id_cliente)))
  GROUP BY clientes.col_codigo, clientes.col_nome, clientes.col_sobrenome, (to_char((clientes.col_data_de_nascimento)::timestamp with time zone, 'dd-mm-yyyy'::text)), clientes.col_sexo, clientes.col_rg, clientes.col_cpf, clientes.col_cnpj, clientes.col_inscricao_estadual, clientes.col_razao_social, clientes.col_nome_fantasia, clientes.col_responsavel, clientes.col_observacao, clientes.col_email, telefones.col_celular, telefones.col_fixo;


ALTER TABLE schm_cliente.vw_clientes OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25048)
-- Name: tb_categorias; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_categorias (
    col_id integer NOT NULL,
    col_nome character varying(100) NOT NULL,
    col_descricao text
);


ALTER TABLE schm_produto.tb_categorias OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41717)
-- Name: categorias; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.categorias AS
 SELECT categoria.col_id AS "Codigo",
    categoria.col_nome AS "Categoria",
    categoria.col_descricao AS "Descrição"
   FROM schm_produto.tb_categorias categoria;


ALTER TABLE schm_produto.categorias OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 33229)
-- Name: tb_produtos; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_produtos (
    col_id integer NOT NULL,
    col_codigo integer NOT NULL,
    col_codigo_extra character varying(10),
    col_nome character varying(100) NOT NULL,
    col_descricao text,
    col_peso numeric(20,2),
    col_quantidade numeric(20,2),
    col_valor numeric(20,2),
    col_valor_venda numeric(20,2),
    col_id_categoria integer DEFAULT 1,
    col_id_fornecedor integer,
    col_id_marca integer,
    col_estoque_minimo numeric(20,2),
    col_estoque_maximo numeric(20,2),
    col_id_medida integer
);


ALTER TABLE schm_produto.tb_produtos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33332)
-- Name: categorias_produtos; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.categorias_produtos AS
 SELECT categoria.col_nome AS "Categoria",
    produto.col_nome AS "Produto",
    produto.col_descricao AS "Descrição"
   FROM schm_produto.tb_categorias categoria,
    schm_produto.tb_produtos produto
  WHERE (produto.col_id_categoria = categoria.col_id)
  GROUP BY categoria.col_nome, produto.col_nome, produto.col_descricao;


ALTER TABLE schm_produto.categorias_produtos OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33278)
-- Name: tb_departamentos; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_departamentos (
    col_id integer NOT NULL,
    col_nome character varying(100) NOT NULL,
    col_descricao text
);


ALTER TABLE schm_produto.tb_departamentos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 75455)
-- Name: departamentos; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.departamentos AS
 SELECT departamentos.col_id AS "ID",
    departamentos.col_nome AS "Departamento",
    departamentos.col_descricao AS "Descrição"
   FROM schm_produto.tb_departamentos departamentos;


ALTER TABLE schm_produto.departamentos OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25216)
-- Name: tb_fornecedores; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_fornecedores (
    col_id integer NOT NULL,
    col_cnpj character varying(19),
    col_razao_social character varying(100),
    col_nome_fantasia character varying(100) NOT NULL,
    col_telefone character varying(20),
    col_responsavel character varying(100)
);


ALTER TABLE schm_produto.tb_fornecedores OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33328)
-- Name: fornecedores; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.fornecedores AS
 SELECT fornecedor.col_cnpj AS "CNPJ",
    fornecedor.col_razao_social AS "Razão Social",
    fornecedor.col_nome_fantasia AS "Nome Fantasia",
    fornecedor.col_telefone AS "Telefone",
    fornecedor.col_responsavel AS "Responsavel"
   FROM schm_produto.tb_fornecedores fornecedor;


ALTER TABLE schm_produto.fornecedores OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25180)
-- Name: tb_marcas; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_marcas (
    col_id integer NOT NULL,
    col_nome character varying(20) NOT NULL,
    col_descricao character varying(100)
);


ALTER TABLE schm_produto.tb_marcas OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33340)
-- Name: marcas; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.marcas AS
 SELECT marca.col_nome AS "Marca",
    marca.col_descricao AS "Descrição"
   FROM schm_produto.tb_marcas marca;


ALTER TABLE schm_produto.marcas OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 165879)
-- Name: tb_unidade_medida; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_unidade_medida (
    col_id integer NOT NULL,
    col_unidade character varying(20),
    col_sigla character varying(10)
);


ALTER TABLE schm_produto.tb_unidade_medida OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 165904)
-- Name: produtos; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.produtos AS
 SELECT DISTINCT produto.col_codigo AS "Código",
    produto.col_codigo_extra AS "Código Extra",
    produto.col_nome AS "Produto",
    produto.col_descricao AS "Descrição",
    produto.col_peso AS "Peso",
    concat(produto.col_quantidade, ' ', medida.col_sigla) AS "Quantidade",
    produto.col_estoque_minimo AS "Mínimo",
    produto.col_estoque_maximo AS "Máximo",
    produto.col_valor AS "Custo",
    produto.col_valor_venda AS "Valor",
    categoria.col_nome AS "Categoria",
    marca.col_nome AS "Marca",
    fornecedor.col_nome_fantasia AS "Fornecedor"
   FROM ((((schm_produto.tb_produtos produto
     LEFT JOIN schm_produto.tb_categorias categoria ON ((produto.col_id_categoria = categoria.col_id)))
     LEFT JOIN schm_produto.tb_marcas marca ON ((produto.col_id_marca = marca.col_id)))
     LEFT JOIN schm_produto.tb_fornecedores fornecedor ON ((produto.col_id_fornecedor = fornecedor.col_id)))
     LEFT JOIN schm_produto.tb_unidade_medida medida ON ((produto.col_id_medida = medida.col_id)))
  GROUP BY produto.col_codigo, produto.col_codigo_extra, produto.col_nome, produto.col_descricao, produto.col_peso, (concat(produto.col_quantidade, ' ', medida.col_sigla)), produto.col_estoque_minimo, produto.col_estoque_maximo, produto.col_valor, produto.col_valor_venda, categoria.col_nome, marca.col_nome, fornecedor.col_nome_fantasia;


ALTER TABLE schm_produto.produtos OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 182288)
-- Name: produtos_edicao; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.produtos_edicao AS
 SELECT DISTINCT produto.col_codigo AS "Código",
    produto.col_codigo_extra AS "Código Extra",
    produto.col_nome AS "Produto",
    produto.col_descricao AS "Descrição",
    produto.col_peso AS "Peso",
    medida.col_sigla AS "Sigla",
    produto.col_quantidade AS "Quantidade",
    produto.col_estoque_minimo AS "Mínimo",
    produto.col_estoque_maximo AS "Máximo",
    produto.col_valor AS "Custo",
    produto.col_valor_venda AS "Valor",
    categoria.col_nome AS "Categoria",
    marca.col_nome AS "Marca",
    fornecedor.col_nome_fantasia AS "Fornecedor"
   FROM ((((schm_produto.tb_produtos produto
     LEFT JOIN schm_produto.tb_categorias categoria ON ((produto.col_id_categoria = categoria.col_id)))
     LEFT JOIN schm_produto.tb_marcas marca ON ((produto.col_id_marca = marca.col_id)))
     LEFT JOIN schm_produto.tb_fornecedores fornecedor ON ((produto.col_id_fornecedor = fornecedor.col_id)))
     LEFT JOIN schm_produto.tb_unidade_medida medida ON ((produto.col_id_medida = medida.col_id)))
  GROUP BY produto.col_codigo, produto.col_codigo_extra, produto.col_nome, produto.col_descricao, produto.col_peso, produto.col_quantidade, medida.col_sigla, produto.col_estoque_minimo, produto.col_estoque_maximo, produto.col_valor, produto.col_valor_venda, categoria.col_nome, marca.col_nome, fornecedor.col_nome_fantasia;


ALTER TABLE schm_produto.produtos_edicao OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25046)
-- Name: tb_categorias_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_categorias_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_categorias_col_id_seq OWNER TO postgres;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 200
-- Name: tb_categorias_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_categorias_col_id_seq OWNED BY schm_produto.tb_categorias.col_id;


--
-- TOC entry 208 (class 1259 OID 33276)
-- Name: tb_departamentos_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_departamentos_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_departamentos_col_id_seq OWNER TO postgres;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 208
-- Name: tb_departamentos_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_departamentos_col_id_seq OWNED BY schm_produto.tb_departamentos.col_id;


--
-- TOC entry 236 (class 1259 OID 157601)
-- Name: tb_entrada_estoque; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_entrada_estoque (
    col_id integer NOT NULL,
    col_id_usuario integer NOT NULL,
    col_id_fornecedor integer,
    col_tipo character varying(20) NOT NULL,
    col_situacao character varying(20) NOT NULL,
    col_data date,
    col_valor numeric(20,2) NOT NULL,
    col_quantidade_volumes integer,
    col_quantidade_itens integer,
    col_hora character(8),
    col_desconto numeric(20,2)
);


ALTER TABLE schm_produto.tb_entrada_estoque OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 157599)
-- Name: tb_entrada_estoque_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_entrada_estoque_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_entrada_estoque_col_id_seq OWNER TO postgres;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 235
-- Name: tb_entrada_estoque_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_entrada_estoque_col_id_seq OWNED BY schm_produto.tb_entrada_estoque.col_id;


--
-- TOC entry 204 (class 1259 OID 25214)
-- Name: tb_fornecedores_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_fornecedores_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_fornecedores_col_id_seq OWNER TO postgres;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 204
-- Name: tb_fornecedores_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_fornecedores_col_id_seq OWNED BY schm_produto.tb_fornecedores.col_id;


--
-- TOC entry 238 (class 1259 OID 157657)
-- Name: tb_itens_entrada; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_itens_entrada (
    col_id integer NOT NULL,
    col_id_produto integer NOT NULL,
    col_id_entrada integer NOT NULL,
    col_numero_item integer NOT NULL,
    col_quantidade numeric(10,2) NOT NULL,
    col_custo numeric(20,2) NOT NULL,
    col_valor_total numeric(20,2) NOT NULL
);


ALTER TABLE schm_produto.tb_itens_entrada OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 157655)
-- Name: tb_intens_entrada_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_intens_entrada_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_intens_entrada_col_id_seq OWNER TO postgres;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 237
-- Name: tb_intens_entrada_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_intens_entrada_col_id_seq OWNED BY schm_produto.tb_itens_entrada.col_id;


--
-- TOC entry 230 (class 1259 OID 124745)
-- Name: tb_itens_saida; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_itens_saida (
    col_id integer NOT NULL,
    col_id_produto integer NOT NULL,
    col_id_saida integer NOT NULL,
    col_numero_item integer NOT NULL,
    col_quantidade numeric(4,2) NOT NULL,
    col_custo numeric(20,2) NOT NULL,
    col_valor_total numeric(20,2) NOT NULL
);


ALTER TABLE schm_produto.tb_itens_saida OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 124743)
-- Name: tb_itens_saida_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_itens_saida_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_itens_saida_col_id_seq OWNER TO postgres;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 229
-- Name: tb_itens_saida_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_itens_saida_col_id_seq OWNED BY schm_produto.tb_itens_saida.col_id;


--
-- TOC entry 202 (class 1259 OID 25178)
-- Name: tb_marcas_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_marcas_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_marcas_col_id_seq OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 202
-- Name: tb_marcas_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_marcas_col_id_seq OWNED BY schm_produto.tb_marcas.col_id;


--
-- TOC entry 206 (class 1259 OID 33227)
-- Name: tb_produtos_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_produtos_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_produtos_col_id_seq OWNER TO postgres;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_produtos_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_produtos_col_id_seq OWNED BY schm_produto.tb_produtos.col_id;


--
-- TOC entry 228 (class 1259 OID 100128)
-- Name: tb_saida_estoque; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_saida_estoque (
    col_id integer NOT NULL,
    col_id_cliente integer,
    col_id_funcionario integer NOT NULL,
    col_id_departamento integer,
    col_tipo character varying(20) NOT NULL,
    col_situacao character varying(20) NOT NULL,
    col_data date,
    col_valor numeric(20,2) NOT NULL,
    col_quantidade_volumes integer,
    col_quantidade_itens integer,
    col_hora character(8),
    col_desconto numeric(20,2)
);


ALTER TABLE schm_produto.tb_saida_estoque OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 100126)
-- Name: tb_saida_estoque_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_saida_estoque_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_saida_estoque_col_id_seq OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_saida_estoque_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_saida_estoque_col_id_seq OWNED BY schm_produto.tb_saida_estoque.col_id;


--
-- TOC entry 234 (class 1259 OID 157577)
-- Name: tb_tipos_transacoes; Type: TABLE; Schema: schm_produto; Owner: postgres
--

CREATE TABLE schm_produto.tb_tipos_transacoes (
    col_id integer NOT NULL,
    col_tipo character varying(30) NOT NULL,
    col_marcador character(1)
);


ALTER TABLE schm_produto.tb_tipos_transacoes OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 157575)
-- Name: tb_tipos_transacoes_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_tipos_transacoes_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_tipos_transacoes_col_id_seq OWNER TO postgres;

--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 233
-- Name: tb_tipos_transacoes_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_tipos_transacoes_col_id_seq OWNED BY schm_produto.tb_tipos_transacoes.col_id;


--
-- TOC entry 247 (class 1259 OID 165877)
-- Name: tb_unidade_medida_col_id_seq; Type: SEQUENCE; Schema: schm_produto; Owner: postgres
--

CREATE SEQUENCE schm_produto.tb_unidade_medida_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_produto.tb_unidade_medida_col_id_seq OWNER TO postgres;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 247
-- Name: tb_unidade_medida_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_produto; Owner: postgres
--

ALTER SEQUENCE schm_produto.tb_unidade_medida_col_id_seq OWNED BY schm_produto.tb_unidade_medida.col_id;


--
-- TOC entry 226 (class 1259 OID 91868)
-- Name: tb_usuarios; Type: TABLE; Schema: schm_usuario; Owner: postgres
--

CREATE TABLE schm_usuario.tb_usuarios (
    col_id integer NOT NULL,
    col_nome character varying(50) NOT NULL,
    col_senha character varying(16) NOT NULL,
    col_tipo character varying(20) NOT NULL,
    col_data timestamp without time zone
);


ALTER TABLE schm_usuario.tb_usuarios OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 157704)
-- Name: vw_entrada_estoque; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_entrada_estoque AS
 SELECT DISTINCT entrada.col_id AS "Id Transação",
    usuario.col_nome AS "Funcionario",
    entrada.col_tipo AS "Tipo",
    entrada.col_situacao AS "Situação",
    to_char((entrada.col_data)::timestamp with time zone, 'dd-mm-yyyy'::text) AS "Data",
    entrada.col_hora AS "Hora",
    entrada.col_valor AS "Valor Total",
    entrada.col_quantidade_volumes AS "Volumes",
    entrada.col_quantidade_itens AS "Total de Itens",
    entrada.col_desconto AS "Desconto"
   FROM (schm_produto.tb_entrada_estoque entrada
     LEFT JOIN schm_usuario.tb_usuarios usuario ON ((entrada.col_id_usuario = usuario.col_id)))
  GROUP BY entrada.col_id, usuario.col_nome, entrada.col_tipo, entrada.col_situacao, (to_char((entrada.col_data)::timestamp with time zone, 'dd-mm-yyyy'::text)), entrada.col_hora, entrada.col_valor, entrada.col_quantidade_volumes, entrada.col_quantidade_itens, entrada.col_desconto
  ORDER BY (to_char((entrada.col_data)::timestamp with time zone, 'dd-mm-yyyy'::text)), entrada.col_hora;


ALTER TABLE schm_produto.vw_entrada_estoque OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 141174)
-- Name: vw_item_saida; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_item_saida AS
 SELECT DISTINCT item.col_id_saida AS "Saída",
    item.col_numero_item AS "Nº",
    produto.col_nome AS "Produto",
    item.col_quantidade AS "Quantidade",
    item.col_custo AS "Custo",
    item.col_valor_total AS "Valor Total"
   FROM (schm_produto.tb_itens_saida item
     LEFT JOIN schm_produto.tb_produtos produto ON ((item.col_id_produto = produto.col_id)))
  GROUP BY item.col_id_saida, item.col_numero_item, produto.col_nome, item.col_quantidade, item.col_custo, item.col_valor_total
  ORDER BY item.col_id_saida, item.col_numero_item;


ALTER TABLE schm_produto.vw_item_saida OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 157551)
-- Name: vw_itens_concatenados; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_itens_concatenados AS
 SELECT vw_item_saida."Saída",
    string_agg(concat(vw_item_saida."Nº", '-', vw_item_saida."Produto"), ('; '::text || chr(10))) AS "Produtos"
   FROM schm_produto.vw_item_saida
  GROUP BY vw_item_saida."Saída";


ALTER TABLE schm_produto.vw_itens_concatenados OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 157709)
-- Name: vw_itens_entrada; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_itens_entrada AS
 SELECT DISTINCT item.col_id_entrada AS "Entrada",
    item.col_numero_item AS "Nº",
    produto.col_nome AS "Produto",
    item.col_quantidade AS "Quantidade",
    item.col_custo AS "Custo",
    item.col_valor_total AS "Valor Total"
   FROM (schm_produto.tb_itens_entrada item
     LEFT JOIN schm_produto.tb_produtos produto ON ((item.col_id_produto = produto.col_id)))
  GROUP BY item.col_id_entrada, item.col_numero_item, produto.col_nome, item.col_quantidade, item.col_custo, item.col_valor_total
  ORDER BY item.col_id_entrada, item.col_numero_item;


ALTER TABLE schm_produto.vw_itens_entrada OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 157713)
-- Name: vw_itens_entrada_concatenados; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_itens_entrada_concatenados AS
 SELECT vw_itens_entrada."Entrada",
    string_agg(concat(vw_itens_entrada."Nº", '-', vw_itens_entrada."Produto"), ('; '::text || chr(10))) AS "Produtos"
   FROM schm_produto.vw_itens_entrada
  GROUP BY vw_itens_entrada."Entrada";


ALTER TABLE schm_produto.vw_itens_entrada_concatenados OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 157695)
-- Name: vw_saida_de_estoque; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_saida_de_estoque AS
 SELECT DISTINCT saida.col_id AS "Id Transação",
    cliente.col_nome AS "Cliente",
    usuario.col_nome AS "Funcionario",
    departamento.col_nome AS "Departamento",
    saida.col_tipo AS "Tipo",
    saida.col_situacao AS "Situação",
    to_char((saida.col_data)::timestamp with time zone, 'dd-mm-yyyy'::text) AS "Data",
    saida.col_hora AS "Hora",
    saida.col_valor AS "Valor Total",
    saida.col_quantidade_volumes AS "Volumes",
    saida.col_quantidade_itens AS "Total de Itens",
    saida.col_desconto AS "Desconto"
   FROM (((schm_produto.tb_saida_estoque saida
     LEFT JOIN schm_cliente.tb_clientes cliente ON ((saida.col_id_cliente = cliente.col_id)))
     LEFT JOIN schm_usuario.tb_usuarios usuario ON ((saida.col_id_funcionario = usuario.col_id)))
     LEFT JOIN schm_produto.tb_departamentos departamento ON ((saida.col_id_departamento = departamento.col_id)))
  GROUP BY saida.col_id, cliente.col_nome, usuario.col_nome, departamento.col_nome, saida.col_tipo, saida.col_situacao, (to_char((saida.col_data)::timestamp with time zone, 'dd-mm-yyyy'::text)), saida.col_hora, saida.col_valor, saida.col_quantidade_volumes, saida.col_quantidade_itens, saida.col_desconto
  ORDER BY (to_char((saida.col_data)::timestamp with time zone, 'dd-mm-yyyy'::text)), saida.col_hora;


ALTER TABLE schm_produto.vw_saida_de_estoque OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 157721)
-- Name: vw_transacao_entrada; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_transacao_entrada AS
 SELECT entrada."Id Transação",
    item."Produtos",
    entrada."Funcionario",
    entrada."Tipo",
    entrada."Situação",
    entrada."Data",
    entrada."Hora",
    entrada."Valor Total",
    entrada."Volumes",
    entrada."Total de Itens",
    entrada."Desconto"
   FROM (schm_produto.vw_entrada_estoque entrada
     JOIN schm_produto.vw_itens_entrada_concatenados item ON ((entrada."Id Transação" = item."Entrada")));


ALTER TABLE schm_produto.vw_transacao_entrada OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 157700)
-- Name: vw_transacao_saida; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_transacao_saida AS
 SELECT saida."Id Transação",
    item."Produtos",
    saida."Cliente",
    saida."Funcionario",
    saida."Departamento",
    saida."Tipo",
    saida."Situação",
    saida."Data",
    saida."Hora",
    saida."Valor Total",
    saida."Volumes",
    saida."Total de Itens",
    saida."Desconto"
   FROM (schm_produto.vw_saida_de_estoque saida
     JOIN schm_produto.vw_itens_concatenados item ON ((saida."Id Transação" = item."Saída")));


ALTER TABLE schm_produto.vw_transacao_saida OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 157735)
-- Name: vw_transacoes; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_transacoes AS
 SELECT vw_transacao_entrada."Id Transação",
    vw_transacao_entrada."Produtos",
    vw_transacao_entrada."Funcionario",
    vw_transacao_entrada."Tipo",
    vw_transacao_entrada."Situação",
    vw_transacao_entrada."Data",
    vw_transacao_entrada."Hora",
    vw_transacao_entrada."Valor Total",
    vw_transacao_entrada."Volumes",
    vw_transacao_entrada."Total de Itens",
    vw_transacao_entrada."Desconto"
   FROM schm_produto.vw_transacao_entrada
UNION
 SELECT vw_transacao_saida."Id Transação",
    vw_transacao_saida."Produtos",
    vw_transacao_saida."Funcionario",
    vw_transacao_saida."Tipo",
    vw_transacao_saida."Situação",
    vw_transacao_saida."Data",
    vw_transacao_saida."Hora",
    vw_transacao_saida."Valor Total",
    vw_transacao_saida."Volumes",
    vw_transacao_saida."Total de Itens",
    vw_transacao_saida."Desconto"
   FROM schm_produto.vw_transacao_saida
  ORDER BY 6 DESC, 7 DESC;


ALTER TABLE schm_produto.vw_transacoes OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 165896)
-- Name: vw_unidade_medida; Type: VIEW; Schema: schm_produto; Owner: postgres
--

CREATE VIEW schm_produto.vw_unidade_medida AS
 SELECT unidade.col_id AS "Código",
    unidade.col_unidade AS "Medida",
    unidade.col_sigla AS "Sigla"
   FROM schm_produto.tb_unidade_medida unidade;


ALTER TABLE schm_produto.vw_unidade_medida OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 91866)
-- Name: tb_usuarios_col_id_seq; Type: SEQUENCE; Schema: schm_usuario; Owner: postgres
--

CREATE SEQUENCE schm_usuario.tb_usuarios_col_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schm_usuario.tb_usuarios_col_id_seq OWNER TO postgres;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_usuarios_col_id_seq; Type: SEQUENCE OWNED BY; Schema: schm_usuario; Owner: postgres
--

ALTER SEQUENCE schm_usuario.tb_usuarios_col_id_seq OWNED BY schm_usuario.tb_usuarios.col_id;


--
-- TOC entry 223 (class 1259 OID 75443)
-- Name: vwusuario; Type: VIEW; Schema: schm_usuario; Owner: postgres
--

CREATE VIEW schm_usuario.vwusuario AS
 SELECT tb_user.col_nome AS "Nome"
   FROM public.tb_user;


ALTER TABLE schm_usuario.vwusuario OWNER TO postgres;

--
-- TOC entry 2918 (class 2604 OID 75440)
-- Name: tb_user col_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN col_id SET DEFAULT nextval('public.tb_user_col_id_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 58598)
-- Name: tb_clientes col_id; Type: DEFAULT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_clientes ALTER COLUMN col_id SET DEFAULT nextval('schm_cliente.tb_clientes_col_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 75009)
-- Name: tb_enderecos col_id; Type: DEFAULT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_enderecos ALTER COLUMN col_id SET DEFAULT nextval('schm_cliente.tb_enderecos_col_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 74981)
-- Name: tb_telefones col_id; Type: DEFAULT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_telefones ALTER COLUMN col_id SET DEFAULT nextval('schm_cliente.tb_telefones_col_id_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 25051)
-- Name: tb_categorias col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_categorias ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_categorias_col_id_seq'::regclass);


--
-- TOC entry 2914 (class 2604 OID 33281)
-- Name: tb_departamentos col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_departamentos ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_departamentos_col_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 157604)
-- Name: tb_entrada_estoque col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_entrada_estoque ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_entrada_estoque_col_id_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 25219)
-- Name: tb_fornecedores col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_fornecedores ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_fornecedores_col_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 157660)
-- Name: tb_itens_entrada col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_entrada ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_intens_entrada_col_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 124748)
-- Name: tb_itens_saida col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_saida ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_itens_saida_col_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 25183)
-- Name: tb_marcas col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_marcas ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_marcas_col_id_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 33232)
-- Name: tb_produtos col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_produtos_col_id_seq'::regclass);


--
-- TOC entry 2920 (class 2604 OID 100131)
-- Name: tb_saida_estoque col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_saida_estoque ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_saida_estoque_col_id_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 157580)
-- Name: tb_tipos_transacoes col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_tipos_transacoes ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_tipos_transacoes_col_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 165882)
-- Name: tb_unidade_medida col_id; Type: DEFAULT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_unidade_medida ALTER COLUMN col_id SET DEFAULT nextval('schm_produto.tb_unidade_medida_col_id_seq'::regclass);


--
-- TOC entry 2919 (class 2604 OID 91871)
-- Name: tb_usuarios col_id; Type: DEFAULT; Schema: schm_usuario; Owner: postgres
--

ALTER TABLE ONLY schm_usuario.tb_usuarios ALTER COLUMN col_id SET DEFAULT nextval('schm_usuario.tb_usuarios_col_id_seq'::regclass);


--
-- TOC entry 3144 (class 0 OID 75437)
-- Dependencies: 222
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user (col_id, col_nome) FROM stdin;
1	postgres
2	Davi
\.


--
-- TOC entry 3138 (class 0 OID 58595)
-- Dependencies: 215
-- Data for Name: tb_clientes; Type: TABLE DATA; Schema: schm_cliente; Owner: postgres
--

COPY schm_cliente.tb_clientes (col_id, col_codigo, col_nome, col_sobrenome, col_data_de_nascimento, col_sexo, col_rg, col_cpf, col_cnpj, col_inscricao_estadual, col_razao_social, col_nome_fantasia, col_responsavel, col_observacao, col_email) FROM stdin;
58	123	DJANGO	DINOSSAURO MALANDRO	2017-05-23	Masculino	rg	cp	cnp	ie	RS	NF	RESP	OBS	email.
59	123122233	LIDIANE	ARAUJO DA SILVA DE LIMA	1988-01-03	Feminino	0207651787	11911421059	sem cnpj	sem ie	SEM RS	SEM NF	LIDIANE	SEM OBSERVAÇÕES	lydy.araujo@hotmail.com
60	341222	JEANNY	DA SILVA	2012-02-01	Feminino	-	-	-	-	-	-	LIDIANE		-
61	1922332	MARCELO	NOBREGA DIAS	1988-12-23	Masculino	0102341231	10203405498	012123123123	123456					
62	12312	JOBISGLAYSON	JOHNES	1945-05-23	Masculino	12.312.312-31	123.123.123-12	96.958.585/7473-93	12312312	HODSAS	QWDASXASSSX			
63	123123412	LAVINIA	DA SILVA DE LIMA	2021-02-22	Feminino	12.312.312-31	312.312.312-31	31.231.231/2312-31	312412	LAVINIA DA SILVA	LAVINIA SA	LAVINIA SILVA		lavinia@hotmail.com
\.


--
-- TOC entry 3142 (class 0 OID 75006)
-- Dependencies: 219
-- Data for Name: tb_enderecos; Type: TABLE DATA; Schema: schm_cliente; Owner: postgres
--

COPY schm_cliente.tb_enderecos (col_id, col_cep, col_logradouro, col_numero, col_complemento, col_bairro, col_cidade, col_estado, col_pais, col_tipo_de_enderecos, col_id_cliente) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 74978)
-- Dependencies: 217
-- Data for Name: tb_telefones; Type: TABLE DATA; Schema: schm_cliente; Owner: postgres
--

COPY schm_cliente.tb_telefones (col_id, col_celular, col_fixo, col_id_cliente) FROM stdin;
40	celu	fixo	58
41	21965122448	2131493136	59
42	-	-	60
43			61
44	(12) 31221-2312	(31) 2312-3123	62
45	(43) 41231-2312	(32) 1231-2312	63
\.


--
-- TOC entry 3128 (class 0 OID 25048)
-- Dependencies: 201
-- Data for Name: tb_categorias; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_categorias (col_id, col_nome, col_descricao) FROM stdin;
285	LIMPEZA	
286	ESCRITORIO	
287	PAPELARIA	
292	CALÇADOS	
293	PERIFERICOS	
294	ELETRONICOS	
295	VEICULOS	
297	QULQUER COISA	
298	INSUMOS	DESCARTAVEIS
300	NOVO	
302	PORTATEIS	
291	MATERIAIS DE CONSUMO	
299	VENDAS UNITARIAS	
290	AULA	COVID
303	ANIMAIS PETS	
304	ACESSORIOS	
305	FERRAMENTAS	
306	CATEGORIA	
\.


--
-- TOC entry 3136 (class 0 OID 33278)
-- Dependencies: 209
-- Data for Name: tb_departamentos; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_departamentos (col_id, col_nome, col_descricao) FROM stdin;
43	DIRECAO	
46	INFORMATICA	BASICA
41	COORDENACAO	
44	SUPERVISAO	
42	SERVIÇOS GERAIS	
\.


--
-- TOC entry 3154 (class 0 OID 157601)
-- Dependencies: 236
-- Data for Name: tb_entrada_estoque; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_entrada_estoque (col_id, col_id_usuario, col_id_fornecedor, col_tipo, col_situacao, col_data, col_valor, col_quantidade_volumes, col_quantidade_itens, col_hora, col_desconto) FROM stdin;
7	1	\N	ENTRADA	CONCLUIDO	2020-09-15	3.50	0	1	11:50:24	0.00
8	1	\N	ENTRADA	CONCLUIDO	2020-09-15	3.50	0	1	13:47:04	0.00
9	1	\N	ENTRADA	CONCLUIDO	2020-09-15	235.00	0	14	13:52:47	0.00
10	1	\N	ENTRADA	CONCLUIDO	2020-09-19	560.00	0	200	14:30:11	0.00
11	1	\N	ENTRADA	CONCLUIDO	2020-09-19	84.00	0	30	14:32:15	0.00
12	1	\N	ENTRADA	CONCLUIDO	2020-09-19	34.00	0	4	14:45:00	0.00
15	1	\N	ENTRADA	CONCLUIDO	2020-09-19	1057.50	0	45	17:04:05	0.00
16	1	\N	ENTRADA	CONCLUIDO	2020-09-19	100.00	0	10	23:28:11	0.00
17	1	\N	ENTRADA	CONCLUIDO	2020-09-22	1070.00	0	40	17:14:10	0.00
18	1	\N	ENTRADA	CONCLUIDO	2020-09-22	100.00	50	1	18:18:55	0.00
19	1	\N	ENTRADA	CONCLUIDO	2020-09-23	462.00	132	1	17:25:45	0.00
20	1	\N	ENTRADA	CONCLUIDO	2020-09-23	152.00	4	4	18:35:46	0.00
21	1	\N	ENTRADA	CONCLUIDO	2020-09-23	28.00	10	1	19:06:49	0.00
22	1	\N	ENTRADA	CONCLUIDO	2020-09-24	1920.00	60	1	15:00:45	0.00
23	1	\N	ENTRADA	CONCLUIDO	2020-10-11	4476.50	55	2	01:58:20	0.00
24	1	\N	ENTRADA	CONCLUIDO	2020-10-11	30.00	10	1	16:04:36	0.00
25	1	\N	ENTRADA	CONCLUIDO	2020-11-03	394.05	98	2	22:19:16	0.00
26	1	\N	ENTRADA	CONCLUIDO	2020-12-30	280.00	70	1	21:16:04	0.00
\.


--
-- TOC entry 3132 (class 0 OID 25216)
-- Dependencies: 205
-- Data for Name: tb_fornecedores; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_fornecedores (col_id, col_cnpj, col_razao_social, col_nome_fantasia, col_telefone, col_responsavel) FROM stdin;
27	11.144.477/7744-43	MARCOS ALMEIDA	MA SOLUÇOES	(21) 31244-7777	MARCO AURELIO
36	12.312.141/2312-31	MARCOS ANTONIO	MA S.A.	(21) 32123-1434	MARCO SOARES
30	00.034.443/4343-44	CALCADOS LTDA	CALCADOS BELOS	(21) 31444-4878	
35	12.312.312/3123-12	MARCELO SOARES	MM SOARES	(12) 34477-9878	MARCELO
31	12.313.212/3123-12	INFORMATICA VENUS	TECNOLOGIA INFO	(21) 96512-2448	SERGIO
28	25.874.580/0001-66	KALUNGA S A	KALUNGAS	(97) 98787-9799	
37	12.312.354/1232-31	LIMPEZAS SA	LIMPA TUDO	12321231	ADRIANO
38	12.313.213/2132-13	GERALDA SOCIAL	G SOCIAL	2131121232323	GERALDA
\.


--
-- TOC entry 3156 (class 0 OID 157657)
-- Dependencies: 238
-- Data for Name: tb_itens_entrada; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_itens_entrada (col_id, col_id_produto, col_id_entrada, col_numero_item, col_quantidade, col_custo, col_valor_total) FROM stdin;
8	91	12	1	14.00	50.00	700.00
10	90	16	1	10.00	10.00	100.00
17	98	20	3	1.00	123.00	123.00
21	98	23	1	32.00	123.00	3936.00
23	104	24	1	10.00	3.00	30.00
26	103	26	1	70.00	4.00	280.00
\.


--
-- TOC entry 3150 (class 0 OID 124745)
-- Dependencies: 230
-- Data for Name: tb_itens_saida; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_itens_saida (col_id, col_id_produto, col_id_saida, col_numero_item, col_quantidade, col_custo, col_valor_total) FROM stdin;
1	90	27	1	4.00	7.00	27.00
2	90	32	1	4.00	7.00	27.00
133	107	145	2	1.00	20.00	20.00
134	107	146	1	1.00	20.00	20.00
135	107	147	1	1.00	20.00	20.00
136	91	147	2	1.00	50.00	50.00
137	110	148	1	3.00	67.00	201.00
138	90	148	2	2.00	133.00	266.00
139	107	148	3	1.00	20.00	20.00
140	101	149	1	3.00	78.00	234.00
11	91	58	2	2.00	50.00	100.00
141	107	150	1	10.00	20.00	200.00
142	101	150	2	1.00	78.00	78.00
143	110	151	1	1.00	67.00	67.00
144	110	152	1	1.00	67.00	67.00
145	101	152	2	1.00	78.00	78.00
17	91	60	3	10.00	50.00	500.00
146	104	153	1	3.00	1.00	3.00
19	91	61	2	1.00	50.00	50.00
147	90	153	2	2.00	133.00	266.00
148	103	153	3	4.00	4.00	16.00
22	98	64	1	1.00	123.00	123.00
23	98	65	1	2.00	123.00	246.00
24	98	66	1	1.00	123.00	123.00
150	107	154	2	3.00	21.00	84.00
151	103	155	1	3.00	4.00	12.00
62	98	104	1	3.00	123.00	369.00
69	98	106	3	1.00	123.00	123.00
76	98	108	3	1.00	123.00	123.00
79	98	109	1	1.00	123.00	123.00
82	98	110	1	50.00	123.00	6150.00
84	98	111	2	1.00	123.00	123.00
85	98	112	1	2.00	123.00	246.00
117	90	134	2	4.00	10.00	40.00
120	90	135	2	3.00	10.00	30.00
\.


--
-- TOC entry 3130 (class 0 OID 25180)
-- Dependencies: 203
-- Data for Name: tb_marcas; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_marcas (col_id, col_nome, col_descricao) FROM stdin;
108	MINUANO	O QUASE RUIM
112	FABERCASTELL	
113	RAIOVAC	
115	NIKE	
117	VALEPLAST	
118	MICROSOFT	
119	INOVA	
120	CALOI	
121	DELTA	
114	HANZOL	DAS SALAMANDRAS
122	MARCA	
124	VENTISOL	
110	BARRAS	DE CHOCOLATE
125	BULL TERRIER	
126	LG	
127	ELGIN	
128	NOVA INC	
\.


--
-- TOC entry 3134 (class 0 OID 33229)
-- Dependencies: 207
-- Data for Name: tb_produtos; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_produtos (col_id, col_codigo, col_codigo_extra, col_nome, col_descricao, col_peso, col_quantidade, col_valor, col_valor_venda, col_id_categoria, col_id_fornecedor, col_id_marca, col_estoque_minimo, col_estoque_maximo, col_id_medida) FROM stdin;
110	4123231	333	VENTILADOR VENTISOL 30 MESA		2.00	395.00	67.00	125.80	294	27	124	32.00	1000.00	4
101	43431312		TECLADO MECANICO		0.00	5.00	78.00	150.00	293	31	118	\N	\N	\N
98	10203049		TELEVISAO LED 32'		0.00	33.00	600.00	1234.00	294	27	126	12.00	200.00	4
113	123131441	1231231231	MOUSE OPTICO WIRELESS		2.00	32.00	23.00	40.00	293	31	119	16.00	40.00	4
102	65		TECLADO BASICO USB		1.00	60.00	43.00	60.00	293	28	114	0.00	0.00	4
104	4131112		DETERGENTE MINUANO 350ML		350.00	10.00	1.00	2.00	285	37	108	0.00	0.00	\N
90	8577		PAPEL A 4	PCT C 500	0.00	0.00	133.00	15.00	287	27	110	0.00	0.00	4
107	7844898		CELULAR NOKIA LUMIA GALAXY	SAMSUNG DE MERDA	0.60	33.00	21.00	700.00	294	28	117	10.00	134.00	1
115	12312341	312312	MARTELO MAX 4	1.5 KG	1.50	400.00	10.00	23.40	305	35	114	3.00	600.00	4
103	54		CADERNO 500 FLS		0.00	66.00	4.00	40.00	286	28	125	0.00	0.00	4
91	965875	655588	LAPIS PRETO		0.00	13.00	50.00	50.00	290	28	112	\N	\N	\N
\.


--
-- TOC entry 3148 (class 0 OID 100128)
-- Dependencies: 228
-- Data for Name: tb_saida_estoque; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_saida_estoque (col_id, col_id_cliente, col_id_funcionario, col_id_departamento, col_tipo, col_situacao, col_data, col_valor, col_quantidade_volumes, col_quantidade_itens, col_hora, col_desconto) FROM stdin;
3	\N	1	41	saida	concluido	2018-05-23	3.45	3	3	null    	0.00
6	58	1	41	saida	concluido	2018-05-23	3.45	3	3	null    	0.00
7	58	1	41	saida	pendente	2018-05-23	3.45	3	3	null    	0.00
9	58	3	41	saida	pendente	2018-05-23	3.45	3	3	null    	0.00
13	58	1	41	SAIDA	CONCLUIDO	2020-08-17	2.80	0	1	13:27:15	0.00
14	58	1	41	SAIDA	CONCLUIDO	2020-08-17	33.50	0	2	15:49:13	0.00
15	58	1	41	SAIDA	CONCLUIDO	2020-08-17	104.00	0	5	15:52:44	0.00
16	59	1	42	SAIDA	CONCLUIDO	2020-08-17	350.00	0	7	16:13:12	0.00
19	58	1	43	SAIDA	CONCLUIDO	2020-08-17	350.00	0	7	19:14:56	0.00
20	58	1	43	SAIDA	CONCLUIDO	2020-08-17	164.50	0	7	19:23:08	0.00
21	58	1	44	SAIDA	CONCLUIDO	2020-08-17	50.00	0	1	19:27:56	0.00
22	59	1	44	SAIDA	CONCLUIDO	2020-08-21	50.00	0	1	17:00:00	0.00
23	58	1	41	SAIDA	CONCLUIDO	2020-08-21	2.80	0	1	23:54:52	0.00
24	59	1	42	SAIDA	CONCLUIDO	2020-08-22	130.00	0	5	00:04:24	0.00
25	58	1	41	SAIDA	CONCLUIDO	2020-08-23	10.00	0	1	13:57:44	0.00
26	58	1	41	SAIDA	CONCLUIDO	2020-08-23	50.00	0	1	14:04:07	0.00
27	58	1	41	SAIDA	CONCLUIDO	2020-08-23	23.50	0	1	14:13:52	0.00
28	59	1	41	SAIDA	CONCLUIDO	2020-08-23	200.00	0	4	14:29:59	0.00
29	58	1	41	SAIDA	CONCLUIDO	2020-08-23	223.50	0	5	15:10:30	0.00
30	58	1	41	SAIDA	CONCLUIDO	2020-08-23	23.50	0	1	15:22:21	0.00
32	58	1	43	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	13:38:16	0.00
33	58	1	41	SAIDA	CONCLUIDO	2020-08-30	47.00	0	2	13:45:35	0.00
34	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	13:50:56	0.00
35	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	13:59:59	0.00
36	58	1	43	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	14:04:09	0.00
37	58	1	41	SAIDA	CONCLUIDO	2020-08-30	10.00	0	1	14:06:08	0.00
38	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	14:08:53	0.00
39	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	14:13:17	0.00
40	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	14:27:46	0.00
41	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	14:38:31	0.00
42	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	14:41:37	0.00
43	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	15:07:26	0.00
44	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	15:15:41	0.00
45	59	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	15:25:55	0.00
46	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:05:14	0.00
47	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:13:50	0.00
48	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:17:01	0.00
49	58	1	43	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:25:10	0.00
50	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:28:23	0.00
51	58	1	41	SAIDA	CONCLUIDO	2020-08-30	70.50	0	3	16:37:36	0.00
52	58	1	41	SAIDA	CONCLUIDO	2020-08-30	47.00	0	2	16:42:10	0.00
53	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:48:52	0.00
54	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	16:52:40	0.00
55	58	1	41	SAIDA	CONCLUIDO	2020-08-30	23.50	0	1	17:00:58	0.00
56	58	1	41	SAIDA	CONCLUIDO	2020-08-30	73.50	0	2	17:02:36	0.00
57	58	1	41	SAIDA	CONCLUIDO	2020-08-30	191.00	0	7	17:05:02	0.00
58	58	1	41	SAIDA	CONCLUIDO	2020-08-30	248.50	0	16	20:01:40	0.00
60	58	1	41	SAIDA	CONCLUIDO	2020-08-31	526.30	0	12	12:19:21	0.00
61	58	1	43	SAIDA	CONCLUIDO	2020-08-31	73.50	0	2	13:01:26	0.00
62	58	1	43	SAIDA	CONCLUIDO	2020-08-31	23.50	0	1	14:35:18	0.00
63	58	1	41	SAIDA	CONCLUIDO	2020-08-31	1222.00	0	52	23:21:40	0.00
64	58	1	41	SAIDA	CONCLUIDO	2020-09-01	123.00	0	1	18:34:33	0.00
65	58	1	41	SAIDA	CONCLUIDO	2020-09-01	246.00	0	2	21:37:17	0.00
66	58	1	41	SAIDA	CONCLUIDO	2020-09-02	123.00	0	1	00:03:10	0.00
67	58	1	43	SAIDA	CONCLUIDO	2020-09-02	6.00	0	3	23:09:12	0.00
68	58	1	41	SAIDA	CONCLUIDO	2020-09-02	2.00	0	1	23:16:54	0.00
69	58	1	41	SAIDA	CONCLUIDO	2020-09-02	2.00	0	1	23:20:38	0.00
70	58	1	41	SAIDA	CONCLUIDO	2020-09-02	2.00	0	1	23:21:11	0.00
71	58	1	42	SAIDA	CONCLUIDO	2020-09-02	2.00	0	1	23:22:26	0.00
72	59	1	44	SAIDA	CONCLUIDO	2020-09-02	2.00	0	1	23:30:42	0.00
73	58	1	43	SAIDA	CONCLUIDO	2020-09-03	20.00	0	2	21:50:51	0.00
74	58	1	41	SAIDA	CONCLUIDO	2020-09-03	3.50	0	1	21:56:07	0.00
75	58	1	44	SAIDA	CONCLUIDO	2020-09-03	23.50	0	1	22:08:20	0.00
76	59	1	43	SAIDA	CONCLUIDO	2020-09-03	23.50	0	1	22:21:29	0.00
77	59	1	43	SAIDA	CONCLUIDO	2020-09-03	23.50	0	1	22:28:54	0.00
78	58	1	44	SAIDA	CONCLUIDO	2020-09-03	50.00	0	1	22:33:39	0.00
79	59	1	43	SAIDA	CONCLUIDO	2020-09-03	23.50	0	1	22:40:45	0.00
80	58	1	42	SAIDA	CONCLUIDO	2020-09-03	23.50	0	1	22:46:39	0.00
81	58	1	44	SAIDA	CONCLUIDO	2020-09-03	123.00	0	1	23:56:08	0.00
82	58	1	44	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	00:04:06	0.00
83	59	1	41	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	00:09:18	0.00
84	58	1	44	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	13:34:33	0.00
85	58	1	43	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	13:38:45	0.00
86	58	1	43	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	13:46:45	0.00
87	58	1	43	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	13:49:14	0.00
90	58	1	43	SAIDA	CONCLUIDO	2020-09-04	6.00	0	3	13:54:01	0.00
91	58	1	43	SAIDA	CONCLUIDO	2020-09-04	6.00	0	3	13:56:01	0.00
92	59	1	42	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	13:58:41	0.00
93	58	1	41	SAIDA	CONCLUIDO	2020-09-04	50.00	0	1	14:15:46	0.00
96	58	1	41	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	17:27:29	0.00
97	58	1	41	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	18:59:59	0.00
98	58	1	43	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	19:05:46	0.00
99	58	1	41	SAIDA	CONCLUIDO	2020-09-04	2.00	0	1	19:16:58	0.00
100	58	1	44	SAIDA	CONCLUIDO	2020-09-05	2.00	0	1	00:17:21	0.00
101	58	1	44	SAIDA	CONCLUIDO	2020-09-05	4.00	0	2	00:22:41	0.00
102	58	1	41	SAIDA	CONCLUIDO	2020-09-05	4.00	0	2	00:25:05	0.00
104	58	1	42	SAIDA	CONCLUIDO	2020-09-05	369.00	0	3	00:29:48	0.00
105	59	1	41	SAIDA	CONCLUIDO	2020-09-05	5.50	0	4	00:46:33	0.00
106	58	1	44	SAIDA	CONCLUIDO	2020-09-05	128.50	0	3	00:47:45	0.00
107	58	1	41	SAIDA	CONCLUIDO	2020-09-05	58.30	0	4	00:49:59	0.00
108	58	1	41	SAIDA	CONCLUIDO	2020-09-05	181.30	0	5	00:52:27	0.00
109	58	1	41	SAIDA	CONCLUIDO	2020-09-05	150.00	0	13	21:27:57	0.00
110	58	1	41	SAIDA	CONCLUIDO	2020-09-06	6150.00	0	50	10:57:54	0.00
111	58	1	41	SAIDA	CONCLUIDO	2020-09-06	125.00	0	2	12:47:53	0.00
112	59	1	44	SAIDA	CONCLUIDO	2020-09-06	252.30	0	4	19:01:41	0.00
113	59	1	43	SAIDA	CONCLUIDO	2020-09-07	505.50	0	12	00:12:51	0.00
114	59	1	43	SAIDA	CONCLUIDO	2020-09-07	8.40	0	3	13:24:44	0.00
115	59	1	43	SAIDA	CONCLUIDO	2020-09-07	8.40	0	3	13:24:55	0.00
116	59	1	43	SAIDA	CONCLUIDO	2020-09-07	12308.40	0	103	13:25:38	0.00
117	58	1	42	SAIDA	CONCLUIDO	2020-09-07	419.60	0	114	13:27:43	0.00
118	58	1	44	SAIDA	CONCLUIDO	2020-09-09	24.80	0	9	20:42:55	0.00
119	59	1	44	SAIDA	CONCLUIDO	2020-09-09	25.60	0	9	20:44:48	0.00
120	58	1	\N	ENTRADA	CONCLUIDO	2020-09-10	360.00	0	90	17:18:24	0.00
121	59	1	\N	ENTRADA	CONCLUIDO	2020-09-10	35.00	0	10	17:25:38	0.00
122	58	1	\N	ENTRADA	CONCLUIDO	2020-09-10	3.50	0	1	19:43:27	0.00
123	58	1	\N	ENTRADA	CONCLUIDO	2020-09-10	665.00	0	190	19:48:41	0.00
124	58	1	\N	ENTRADA	CONCLUIDO	2020-09-10	17.50	0	5	19:52:36	0.00
125	59	1	\N	ENTRADA	CONCLUIDO	2020-09-10	14.00	0	4	19:59:33	0.00
126	58	1	\N	ENTRADA	CONCLUIDO	2020-09-10	21.00	0	6	20:04:52	0.00
127	59	1	\N	ENTRADA	CONCLUIDO	2020-09-10	3.50	0	1	20:07:22	0.00
129	59	1	41	SAIDA	CONCLUIDO	2020-09-15	5.50	0	2	11:20:12	0.00
130	58	1	43	SAIDA	CONCLUIDO	2020-09-19	253.50	0	51	23:29:06	0.00
131	58	1	44	SAIDA	CONCLUIDO	2020-09-22	502.80	0	11	16:49:22	0.00
132	58	1	41	SAIDA	CONCLUIDO	2020-09-22	150.00	3	0	17:30:24	0.00
133	60	1	42	SAIDA	CONCLUIDO	2020-09-22	10.50	3	0	17:38:58	0.00
134	58	1	41	SAIDA	CONCLUIDO	2020-09-22	53.00	9	3	17:45:15	0.00
135	58	1	44	SAIDA	CONCLUIDO	2020-09-22	147.50	10	3	17:56:43	0.00
136	58	1	41	SAIDA	CONCLUIDO	2020-09-22	17.50	5	1	18:20:05	0.00
137	58	1	44	SAIDA	CONCLUIDO	2020-09-22	752.00	32	1	18:50:34	0.00
138	58	1	41	SAIDA	CONCLUIDO	2020-09-23	352.50	15	1	17:27:43	0.00
139	58	1	43	SAIDA	CONCLUIDO	2020-09-23	285.50	13	2	19:07:23	0.00
140	58	1	42	SAIDA	CONCLUIDO	2020-09-23	320.00	10	1	23:56:58	0.00
141	58	1	41	SAIDA	CONCLUIDO	2020-10-11	468.00	30	3	01:52:51	0.00
142	58	1	41	SAIDA	CONCLUIDO	2020-10-11	50.00	1	1	22:04:03	0.00
143	60	1	41	SAIDA	CONCLUIDO	2020-11-06	384.00	12	1	20:59:47	0.00
144	58	1	46	SAIDA	CONCLUIDO	2020-12-30	28.00	2	2	19:08:50	0.00
145	59	1	46	SAIDA	CONCLUIDO	2020-12-30	94.00	3	3	19:53:54	0.00
146	60	1	46	SAIDA	CONCLUIDO	2020-12-30	90.00	2	2	19:57:41	0.00
147	60	1	46	SAIDA	CONCLUIDO	2020-12-30	90.00	2	2	20:01:26	0.00
148	60	1	46	SAIDA	CONCLUIDO	2020-12-30	1155.00	6	3	20:03:10	0.00
149	60	1	46	SAIDA	CONCLUIDO	2020-12-30	234.00	3	1	20:24:29	0.00
150	60	1	46	SAIDA	CONCLUIDO	2020-12-30	478.00	11	2	20:25:25	0.00
151	60	1	46	SAIDA	CONCLUIDO	2020-12-30	67.00	1	1	20:46:46	0.00
152	58	1	41	SAIDA	CONCLUIDO	2020-12-30	212.00	2	2	20:48:09	0.00
153	61	1	42	SAIDA	CONCLUIDO	2020-12-30	557.00	9	3	21:15:26	0.00
154	58	1	41	SAIDA	CONCLUIDO	2021-06-27	105.00	5	2	22:36:05	0.00
155	63	1	41	SAIDA	CONCLUIDO	2021-11-03	0.00	3	1	22:22:01	0.00
\.


--
-- TOC entry 3152 (class 0 OID 157577)
-- Dependencies: 234
-- Data for Name: tb_tipos_transacoes; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_tipos_transacoes (col_id, col_tipo, col_marcador) FROM stdin;
1	Compra de Mercadoria	+
2	Devolução	+
3	Ajuste de Estoque	+
4	Consumo Interno	-
5	Devolução	-
6	Ajuste de Estoque	-
\.


--
-- TOC entry 3158 (class 0 OID 165879)
-- Dependencies: 248
-- Data for Name: tb_unidade_medida; Type: TABLE DATA; Schema: schm_produto; Owner: postgres
--

COPY schm_produto.tb_unidade_medida (col_id, col_unidade, col_sigla) FROM stdin;
1	QUILO	KG
2	GRAMA	G
3	LITRO	LT
4	UNIDADE	UN
5	ARROBA	@
6	MILILITRO	ML
7	VOLTS	V
8	WATTS	W
9	XIS	X
12	KILO	KL
13	ITEM	I
\.


--
-- TOC entry 3146 (class 0 OID 91868)
-- Dependencies: 226
-- Data for Name: tb_usuarios; Type: TABLE DATA; Schema: schm_usuario; Owner: postgres
--

COPY schm_usuario.tb_usuarios (col_id, col_nome, col_senha, col_tipo, col_data) FROM stdin;
1	davi	12345	vendedor	\N
3	postgres	12345	administrador	\N
\.


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_user_col_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_col_id_seq', 3, true);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 214
-- Name: tb_clientes_col_id_seq; Type: SEQUENCE SET; Schema: schm_cliente; Owner: postgres
--

SELECT pg_catalog.setval('schm_cliente.tb_clientes_col_id_seq', 63, true);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_enderecos_col_id_seq; Type: SEQUENCE SET; Schema: schm_cliente; Owner: postgres
--

SELECT pg_catalog.setval('schm_cliente.tb_enderecos_col_id_seq', 1, false);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 216
-- Name: tb_telefones_col_id_seq; Type: SEQUENCE SET; Schema: schm_cliente; Owner: postgres
--

SELECT pg_catalog.setval('schm_cliente.tb_telefones_col_id_seq', 45, true);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 200
-- Name: tb_categorias_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_categorias_col_id_seq', 306, true);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 208
-- Name: tb_departamentos_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_departamentos_col_id_seq', 47, true);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 235
-- Name: tb_entrada_estoque_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_entrada_estoque_col_id_seq', 26, true);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 204
-- Name: tb_fornecedores_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_fornecedores_col_id_seq', 38, true);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 237
-- Name: tb_intens_entrada_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_intens_entrada_col_id_seq', 26, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 229
-- Name: tb_itens_saida_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_itens_saida_col_id_seq', 151, true);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 202
-- Name: tb_marcas_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_marcas_col_id_seq', 128, true);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_produtos_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_produtos_col_id_seq', 115, true);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 227
-- Name: tb_saida_estoque_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_saida_estoque_col_id_seq', 155, true);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 233
-- Name: tb_tipos_transacoes_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_tipos_transacoes_col_id_seq', 6, true);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 247
-- Name: tb_unidade_medida_col_id_seq; Type: SEQUENCE SET; Schema: schm_produto; Owner: postgres
--

SELECT pg_catalog.setval('schm_produto.tb_unidade_medida_col_id_seq', 13, true);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_usuarios_col_id_seq; Type: SEQUENCE SET; Schema: schm_usuario; Owner: postgres
--

SELECT pg_catalog.setval('schm_usuario.tb_usuarios_col_id_seq', 3, true);


--
-- TOC entry 2951 (class 2606 OID 75442)
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2943 (class 2606 OID 58605)
-- Name: tb_clientes tb_clientes_col_cnpj_key; Type: CONSTRAINT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_clientes
    ADD CONSTRAINT tb_clientes_col_cnpj_key UNIQUE (col_cnpj);


--
-- TOC entry 2945 (class 2606 OID 58603)
-- Name: tb_clientes tb_clientes_pkey; Type: CONSTRAINT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_clientes
    ADD CONSTRAINT tb_clientes_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2949 (class 2606 OID 75011)
-- Name: tb_enderecos tb_enderecos_pkey; Type: CONSTRAINT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_enderecos
    ADD CONSTRAINT tb_enderecos_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2947 (class 2606 OID 74983)
-- Name: tb_telefones tb_telefones_pkey; Type: CONSTRAINT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_telefones
    ADD CONSTRAINT tb_telefones_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2927 (class 2606 OID 25058)
-- Name: tb_categorias tb_categorias_col_nome_key; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_categorias
    ADD CONSTRAINT tb_categorias_col_nome_key UNIQUE (col_nome);


--
-- TOC entry 2929 (class 2606 OID 25056)
-- Name: tb_categorias tb_categorias_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_categorias
    ADD CONSTRAINT tb_categorias_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2939 (class 2606 OID 33288)
-- Name: tb_departamentos tb_departamentos_col_nome_key; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_departamentos
    ADD CONSTRAINT tb_departamentos_col_nome_key UNIQUE (col_nome);


--
-- TOC entry 2941 (class 2606 OID 33286)
-- Name: tb_departamentos tb_departamentos_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_departamentos
    ADD CONSTRAINT tb_departamentos_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2963 (class 2606 OID 157606)
-- Name: tb_entrada_estoque tb_entrada_estoque_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_entrada_estoque
    ADD CONSTRAINT tb_entrada_estoque_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2933 (class 2606 OID 25221)
-- Name: tb_fornecedores tb_fornecedores_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_fornecedores
    ADD CONSTRAINT tb_fornecedores_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2965 (class 2606 OID 157662)
-- Name: tb_itens_entrada tb_intens_entrada_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_entrada
    ADD CONSTRAINT tb_intens_entrada_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2959 (class 2606 OID 124750)
-- Name: tb_itens_saida tb_itens_saida_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_saida
    ADD CONSTRAINT tb_itens_saida_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2931 (class 2606 OID 25185)
-- Name: tb_marcas tb_marcas_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_marcas
    ADD CONSTRAINT tb_marcas_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2935 (class 2606 OID 33240)
-- Name: tb_produtos tb_produtos_col_codigo_key; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos
    ADD CONSTRAINT tb_produtos_col_codigo_key UNIQUE (col_codigo);


--
-- TOC entry 2937 (class 2606 OID 33238)
-- Name: tb_produtos tb_produtos_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos
    ADD CONSTRAINT tb_produtos_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2957 (class 2606 OID 100133)
-- Name: tb_saida_estoque tb_saida_estoque_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_saida_estoque
    ADD CONSTRAINT tb_saida_estoque_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2961 (class 2606 OID 157582)
-- Name: tb_tipos_transacoes tb_tipos_transacoes_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_tipos_transacoes
    ADD CONSTRAINT tb_tipos_transacoes_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2967 (class 2606 OID 165884)
-- Name: tb_unidade_medida tb_unidade_medida_pkey; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_unidade_medida
    ADD CONSTRAINT tb_unidade_medida_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2969 (class 2606 OID 165903)
-- Name: tb_unidade_medida uniq_col_sigla; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_unidade_medida
    ADD CONSTRAINT uniq_col_sigla UNIQUE (col_sigla);


--
-- TOC entry 2971 (class 2606 OID 165901)
-- Name: tb_unidade_medida uniq_col_unidade; Type: CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_unidade_medida
    ADD CONSTRAINT uniq_col_unidade UNIQUE (col_unidade);


--
-- TOC entry 2953 (class 2606 OID 91875)
-- Name: tb_usuarios tb_usuarios_col_nome_key; Type: CONSTRAINT; Schema: schm_usuario; Owner: postgres
--

ALTER TABLE ONLY schm_usuario.tb_usuarios
    ADD CONSTRAINT tb_usuarios_col_nome_key UNIQUE (col_nome);


--
-- TOC entry 2955 (class 2606 OID 91873)
-- Name: tb_usuarios tb_usuarios_pkey; Type: CONSTRAINT; Schema: schm_usuario; Owner: postgres
--

ALTER TABLE ONLY schm_usuario.tb_usuarios
    ADD CONSTRAINT tb_usuarios_pkey PRIMARY KEY (col_id);


--
-- TOC entry 2977 (class 2606 OID 75012)
-- Name: tb_enderecos tb_enderecos_col_id_cliente_fkey; Type: FK CONSTRAINT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_enderecos
    ADD CONSTRAINT tb_enderecos_col_id_cliente_fkey FOREIGN KEY (col_id_cliente) REFERENCES schm_cliente.tb_clientes(col_id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 74984)
-- Name: tb_telefones tb_telefones_col_id_cliente_fkey; Type: FK CONSTRAINT; Schema: schm_cliente; Owner: postgres
--

ALTER TABLE ONLY schm_cliente.tb_telefones
    ADD CONSTRAINT tb_telefones_col_id_cliente_fkey FOREIGN KEY (col_id_cliente) REFERENCES schm_cliente.tb_clientes(col_id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 157607)
-- Name: tb_entrada_estoque tb_entrada_estoque_col_id_fornecedor_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_entrada_estoque
    ADD CONSTRAINT tb_entrada_estoque_col_id_fornecedor_fkey FOREIGN KEY (col_id_fornecedor) REFERENCES schm_produto.tb_fornecedores(col_id) ON DELETE CASCADE;


--
-- TOC entry 2984 (class 2606 OID 157612)
-- Name: tb_entrada_estoque tb_entrada_estoque_col_id_usuario_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_entrada_estoque
    ADD CONSTRAINT tb_entrada_estoque_col_id_usuario_fkey FOREIGN KEY (col_id_usuario) REFERENCES schm_usuario.tb_usuarios(col_id) ON DELETE CASCADE;


--
-- TOC entry 2986 (class 2606 OID 157668)
-- Name: tb_itens_entrada tb_intens_entrada_col_id_entrada_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_entrada
    ADD CONSTRAINT tb_intens_entrada_col_id_entrada_fkey FOREIGN KEY (col_id_entrada) REFERENCES schm_produto.tb_entrada_estoque(col_id) ON DELETE CASCADE;


--
-- TOC entry 2985 (class 2606 OID 157663)
-- Name: tb_itens_entrada tb_intens_entrada_col_id_produto_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_entrada
    ADD CONSTRAINT tb_intens_entrada_col_id_produto_fkey FOREIGN KEY (col_id_produto) REFERENCES schm_produto.tb_produtos(col_id) ON DELETE CASCADE;


--
-- TOC entry 2981 (class 2606 OID 124751)
-- Name: tb_itens_saida tb_itens_saida_col_id_produto_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_saida
    ADD CONSTRAINT tb_itens_saida_col_id_produto_fkey FOREIGN KEY (col_id_produto) REFERENCES schm_produto.tb_produtos(col_id) ON DELETE CASCADE;


--
-- TOC entry 2982 (class 2606 OID 124756)
-- Name: tb_itens_saida tb_itens_saida_col_id_saida_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_itens_saida
    ADD CONSTRAINT tb_itens_saida_col_id_saida_fkey FOREIGN KEY (col_id_saida) REFERENCES schm_produto.tb_saida_estoque(col_id) ON DELETE CASCADE;


--
-- TOC entry 2972 (class 2606 OID 33241)
-- Name: tb_produtos tb_produtos_col_id_categoria_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos
    ADD CONSTRAINT tb_produtos_col_id_categoria_fkey FOREIGN KEY (col_id_categoria) REFERENCES schm_produto.tb_categorias(col_id);


--
-- TOC entry 2973 (class 2606 OID 33246)
-- Name: tb_produtos tb_produtos_col_id_fornecedor_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos
    ADD CONSTRAINT tb_produtos_col_id_fornecedor_fkey FOREIGN KEY (col_id_fornecedor) REFERENCES schm_produto.tb_fornecedores(col_id);


--
-- TOC entry 2974 (class 2606 OID 33251)
-- Name: tb_produtos tb_produtos_col_id_marca_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos
    ADD CONSTRAINT tb_produtos_col_id_marca_fkey FOREIGN KEY (col_id_marca) REFERENCES schm_produto.tb_marcas(col_id);


--
-- TOC entry 2975 (class 2606 OID 165885)
-- Name: tb_produtos tb_produtos_col_id_medida_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_produtos
    ADD CONSTRAINT tb_produtos_col_id_medida_fkey FOREIGN KEY (col_id_medida) REFERENCES schm_produto.tb_unidade_medida(col_id);


--
-- TOC entry 2978 (class 2606 OID 100134)
-- Name: tb_saida_estoque tb_saida_estoque_col_id_cliente_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_saida_estoque
    ADD CONSTRAINT tb_saida_estoque_col_id_cliente_fkey FOREIGN KEY (col_id_cliente) REFERENCES schm_cliente.tb_clientes(col_id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 100144)
-- Name: tb_saida_estoque tb_saida_estoque_col_id_departamento_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_saida_estoque
    ADD CONSTRAINT tb_saida_estoque_col_id_departamento_fkey FOREIGN KEY (col_id_departamento) REFERENCES schm_produto.tb_departamentos(col_id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 100139)
-- Name: tb_saida_estoque tb_saida_estoque_col_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: schm_produto; Owner: postgres
--

ALTER TABLE ONLY schm_produto.tb_saida_estoque
    ADD CONSTRAINT tb_saida_estoque_col_id_funcionario_fkey FOREIGN KEY (col_id_funcionario) REFERENCES schm_usuario.tb_usuarios(col_id) ON DELETE CASCADE;


-- Completed on 2022-11-02 21:55:25

--
-- PostgreSQL database dump complete
--

