-- TRIGGERS AUDITORIA



CREATE TABLE TB_AUDITORIA (
    ID_AUDITORIA   NUMBER(10) PRIMARY KEY,
    TABELA         VARCHAR2(50) NOT NULL,
    OPERACAO       VARCHAR2(10) NOT NULL,
    USUARIO        VARCHAR2(100) NOT NULL,
    DATA_HORA      TIMESTAMP NOT NULL,
    DADOS_ANTES    CLOB,
    DADOS_DEPOIS   CLOB
);

-- Criação da sequência SEQ_AUDITORIA
CREATE SEQUENCE SEQ_AUDITORIA
START WITH 1
INCREMENT BY 1;



-- Trigger para a tabela TB_USUARIO
CREATE OR REPLACE TRIGGER AUDIT_TB_USUARIO
AFTER INSERT OR UPDATE OR DELETE ON TB_USUARIO
FOR EACH ROW
DECLARE
    v_operacao VARCHAR2(10);
    v_dados_antes CLOB;
    v_dados_depois CLOB;
BEGIN
    IF INSERTING THEN
        v_operacao := 'INSERT';
        v_dados_depois := 'ID_USUARIO=' || :NEW.ID_USUARIO || ', ID_PERFIL=' || :NEW.ID_PERFIL || 
                          ', ID_REGIAO=' || :NEW.ID_REGIAO || ', EMAIL_USUARIO=' || :NEW.EMAIL_USUARIO || 
                          ', CNPJ_USUARIO=' || :NEW.CNPJ_USUARIO || ', CPF_USUARIO=' || :NEW.CPF_USUARIO;
    ELSIF UPDATING THEN
        v_operacao := 'UPDATE';
        v_dados_antes := 'ID_USUARIO=' || :OLD.ID_USUARIO || ', ID_PERFIL=' || :OLD.ID_PERFIL || 
                         ', ID_REGIAO=' || :OLD.ID_REGIAO || ', EMAIL_USUARIO=' || :OLD.EMAIL_USUARIO || 
                         ', CNPJ_USUARIO=' || :OLD.CNPJ_USUARIO || ', CPF_USUARIO=' || :OLD.CPF_USUARIO;
        v_dados_depois := 'ID_USUARIO=' || :NEW.ID_USUARIO || ', ID_PERFIL=' || :NEW.ID_PERFIL || 
                          ', ID_REGIAO=' || :NEW.ID_REGIAO || ', EMAIL_USUARIO=' || :NEW.EMAIL_USUARIO || 
                          ', CNPJ_USUARIO=' || :NEW.CNPJ_USUARIO || ', CPF_USUARIO=' || :NEW.CPF_USUARIO;
    ELSIF DELETING THEN
        v_operacao := 'DELETE';
        v_dados_antes := 'ID_USUARIO=' || :OLD.ID_USUARIO || ', ID_PERFIL=' || :OLD.ID_PERFIL || 
                         ', ID_REGIAO=' || :OLD.ID_REGIAO || ', EMAIL_USUARIO=' || :OLD.EMAIL_USUARIO || 
                         ', CNPJ_USUARIO=' || :OLD.CNPJ_USUARIO || ', CPF_USUARIO=' || :OLD.CPF_USUARIO;
    END IF;

    INSERT INTO TB_AUDITORIA (ID_AUDITORIA, TABELA, OPERACAO, USUARIO, DATA_HORA, DADOS_ANTES, DADOS_DEPOIS)
    VALUES (SEQ_AUDITORIA.NEXTVAL, 'TB_USUARIO', v_operacao, USER, SYSTIMESTAMP, v_dados_antes, v_dados_depois);
END;
