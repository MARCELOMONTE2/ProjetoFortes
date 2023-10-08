-- PROJETO PROCESSO SELETIVO FORTES TECNOLOGIA - DELPHI


-- A base de dados, que acompanha o projeto na pasta db, foi criada utilizando o firebird 3.0

-- Segue abaixo o script do banco de dados conforme requisito funcional 6

-- Caso crie uma base nova é necessario incluir manualmente as informaçoes das tabelas de Bomba, Tamque e Tipo_Combustivel.

-- Obrigado!

/******************************************************************************/
/*           Script Banco de Dados          */
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1252;

CREATE DATABASE 'C:\...\ProjetoFortes\source\db\POSTO.FDB' /*Coloque aqui o enderço de onde quer gerar o banco*/
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;



/******************************************************************************/
/*                                 Generators                                 */
/******************************************************************************/

CREATE GENERATOR GEN_ABASTECIMENTOS_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_ABASTECIMENTOS_ID TO 19;

CREATE GENERATOR GEN_BOMBAS_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_BOMBAS_ID TO 4;

CREATE GENERATOR GEN_TANQUES_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_TANQUES_ID TO 2;

CREATE GENERATOR GEN_TIPO_COMBUSTIVEL_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_TIPO_COMBUSTIVEL_ID TO 2;



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE ABASTECIMENTOS (
    ID                INTEGER NOT NULL,
    BOMBA_ID          INTEGER NOT NULL,
    LITROS            NUMERIC(15,2) NOT NULL,
    VALOR_ABASTECIDO  NUMERIC(15,2) NOT NULL,
    DATA              TIMESTAMP NOT NULL,
    VALOR_IMPOSTO     NUMERIC(15,2) NOT NULL
);

CREATE TABLE BOMBAS (
    ID            INTEGER NOT NULL,
    TANQUE        INTEGER NOT NULL,
    DESCRICAO     VARCHAR(50),
    TAXA_IMPOSTO  NUMERIC(7,4) NOT NULL,
    PRECO         NUMERIC(15,3)
);

CREATE TABLE TANQUES (
    ID                INTEGER NOT NULL,
    VOLUME_LITROS     NUMERIC(15,2),
    TIPO_COMBUSTIVEL  INTEGER NOT NULL
);

CREATE TABLE TIPO_COMBUSTIVEL (
    ID         INTEGER NOT NULL,
    DESCRICAO  VARCHAR(50) NOT NULL
);



/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE ABASTECIMENTOS ADD CONSTRAINT PK_ABASTECIMENTOS PRIMARY KEY (ID);
ALTER TABLE BOMBAS ADD CONSTRAINT PK_BOMBAS PRIMARY KEY (ID);
ALTER TABLE TANQUES ADD CONSTRAINT PK_TANQUES PRIMARY KEY (ID);
ALTER TABLE TIPO_COMBUSTIVEL ADD CONSTRAINT PK_TIPO_COMBUSTIVEL PRIMARY KEY (ID);


/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE ABASTECIMENTOS ADD CONSTRAINT FK_ABASTECIMENTOS_1 FOREIGN KEY (BOMBA_ID) REFERENCES BOMBAS (ID);
ALTER TABLE BOMBAS ADD CONSTRAINT FK_BOMBAS_1 FOREIGN KEY (TANQUE) REFERENCES TANQUES (ID);
ALTER TABLE TANQUES ADD CONSTRAINT FK_TANQUES_1 FOREIGN KEY (TIPO_COMBUSTIVEL) REFERENCES TIPO_COMBUSTIVEL (ID);


/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: ABASTECIMENTOS_BI */
CREATE TRIGGER ABASTECIMENTOS_BI FOR ABASTECIMENTOS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_abastecimentos_id,1);
end
^

/* Trigger: BOMBAS_BI */
CREATE TRIGGER BOMBAS_BI FOR BOMBAS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_bombas_id,1);
end
^

/* Trigger: TANQUES_BI */
CREATE TRIGGER TANQUES_BI FOR TANQUES
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tanques_id,1);
end
^

/* Trigger: TIPO_COMBUSTIVEL_BI */
CREATE TRIGGER TIPO_COMBUSTIVEL_BI FOR TIPO_COMBUSTIVEL
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_tipo_combustivel_id,1);
end
^
SET TERM ; ^

