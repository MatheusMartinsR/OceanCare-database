CREATE OR REPLACE PROCEDURE inserir_usuario(
    p_id_usuario    IN tb_usuario.id_usuario%TYPE,
    p_id_recompensa IN tb_usuario.id_recompensa%TYPE,
    p_id_missao     IN tb_usuario.id_missao%TYPE,
    p_email_usuario IN tb_usuario.email_usuario%TYPE,
    p_senha_usuario IN tb_usuario.senha_usuario%TYPE,
    p_cnpj_usuario  IN tb_usuario.cnpj_usuario%TYPE DEFAULT NULL,
    p_cpf_usuario   IN tb_usuario.cpf_usuario%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o usuário já existe
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_usuario
    WHERE  id_usuario = p_id_usuario;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Usuário já existe na tabela.');
    END IF;

    INSERT INTO tb_usuario (id_usuario, id_recompensa, id_missao, email_usuario, senha_usuario, cnpj_usuario, cpf_usuario)
    VALUES (p_id_usuario, p_id_recompensa, p_id_missao, p_email_usuario, p_senha_usuario, p_cnpj_usuario, p_cpf_usuario);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir usuário.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir usuário: ' || SQLERRM);
END inserir_usuario;


CREATE OR REPLACE PROCEDURE inserir_recompensa(
    p_id_recompensa        IN tb_recompensas.id_recompensa%TYPE,
    p_nome_recompensa      IN tb_recompensas.nome_recompensa%TYPE,
    p_descricao_recompensa IN tb_recompensas.descricao_recompensa%TYPE,
    p_tipo_recompensa      IN tb_recompensas.tipo_recompensa%TYPE,
    p_status_recompensa    IN tb_recompensas.status_recompensa%TYPE
)
IS
BEGIN
    INSERT INTO tb_recompensas (id_recompensa, nome_recompensa, descricao_recompensa, tipo_recompensa, status_recompensa)
    VALUES (p_id_recompensa, p_nome_recompensa, p_descricao_recompensa, p_tipo_recompensa, p_status_recompensa);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20001, 'Chave primária duplicada ao inserir recompensa.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro ao inserir recompensa: ' || SQLERRM);
END inserir_recompensa;


CREATE OR REPLACE PROCEDURE inserir_evento(
    p_id_evento        IN tb_evento.id_evento%TYPE,
    p_id_usuario       IN tb_evento.id_usuario%TYPE,
    p_nome_evento      IN tb_evento.nome_evento%TYPE,
    p_descricao_evento IN tb_evento.descricao_evento%TYPE,
    p_data_evento      IN tb_evento.data_evento%TYPE,
    p_local_evento     IN tb_evento.local_evento%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o usuário existe antes de inserir o evento
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_usuario
    WHERE  id_usuario = p_id_usuario;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Usuário não encontrado para associar ao evento.');
    END IF;

    INSERT INTO tb_evento (id_evento, id_usuario, nome_evento, descricao_evento, data_evento, local_evento)
    VALUES (p_id_evento, p_id_usuario, p_nome_evento, p_descricao_evento, p_data_evento, p_local_evento);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir evento.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir evento: ' || SQLERRM);
END inserir_evento;


CREATE OR REPLACE PROCEDURE inserir_estatistica(
    p_id_estatistica        IN tb_estatistica.id_estatistica%TYPE,
    p_id_evento             IN tb_estatistica.id_evento%TYPE,
    p_descricao_estatistica IN tb_estatistica.descricao_estatistica%TYPE,
    p_data_coleta_estat     IN tb_estatistica.data_coleta_estat%TYPE,
    p_fonte_estatistica     IN tb_estatistica.fonte_estatistica%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o evento existe antes de inserir a estatística
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_evento
    WHERE  id_evento = p_id_evento;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Evento não encontrado para associar à estatística.');
    END IF;

    INSERT INTO tb_estatistica (id_estatistica, id_evento, descricao_estatistica, data_coleta_estat, fonte_estatistica)
    VALUES (p_id_estatistica, p_id_evento, p_descricao_estatistica, p_data_coleta_estat, p_fonte_estatistica);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir estatística.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir estatística: ' || SQLERRM);
END inserir_estatistica;


CREATE OR REPLACE PROCEDURE inserir_conteudo_edu(
    p_id_conteudo     IN tb_conteudo_edu.id_conteudo%TYPE,
    p_id_usuario      IN tb_conteudo_edu.id_usuario%TYPE,
    p_titulo_conteudo IN tb_conteudo_edu.titulo_conteudo%TYPE,
    p_descricao_conteudo IN tb_conteudo_edu.descricao_conteudo%TYPE,
    p_url_conteudo    IN tb_conteudo_edu.url_conteudo%TYPE DEFAULT NULL
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o usuário existe antes de inserir o conteúdo educativo
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_usuario
    WHERE  id_usuario = p_id_usuario;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Usuário não encontrado para associar ao conteúdo educativo.');
    END IF;

    INSERT INTO tb_conteudo_edu (id_conteudo, id_usuario, titulo_conteudo, descricao_conteudo, url_conteudo)
    VALUES (p_id_conteudo, p_id_usuario, p_titulo_conteudo, p_descricao_conteudo, p_url_conteudo);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir conteúdo educativo.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir conteúdo educativo: ' || SQLERRM);
END inserir_conteudo_edu;



CREATE OR REPLACE PROCEDURE inserir_ranking(
    p_id_ranking        IN tb_ranking.id_ranking%TYPE,
    p_id_usuario        IN tb_ranking.id_usuario%TYPE,
    p_posicao_ranking   IN tb_ranking.posicao_ranking%TYPE,
    p_pontuacao_ranking IN tb_ranking.pontuacao_ranking%TYPE,
    p_dt_atualizacao    IN tb_ranking.dt_atualizacao%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o usuário existe antes de inserir no ranking
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_usuario
    WHERE  id_usuario = p_id_usuario;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Usuário não encontrado para associar ao ranking.');
    END IF;

    INSERT INTO tb_ranking (id_ranking, id_usuario, posicao_ranking, pontuacao_ranking, dt_atualizacao)
    VALUES (p_id_ranking, p_id_usuario, p_posicao_ranking, p_pontuacao_ranking, p_dt_atualizacao);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir ranking.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir ranking: ' || SQLERRM);
END inserir_ranking;



CREATE OR REPLACE PROCEDURE inserir_participacao_evento(
    p_id_participacao          IN tb_participacao_evento.id_participacao%TYPE,
    p_id_evento                IN tb_participacao_evento.id_evento%TYPE,
    p_data_participacao        IN tb_participacao_evento.data_participacao%TYPE,
    p_comentarios_participacao IN tb_participacao_evento.comentarios_participacao%TYPE,
    p_pontos_participacao      IN tb_participacao_evento.pontos_participacao%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o evento existe antes de inserir a participação
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_evento
    WHERE  id_evento = p_id_evento;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Evento não encontrado para associar à participação.');
    END IF;

    INSERT INTO tb_participacao_evento (id_participacao, id_evento, data_participacao, comentarios_participacao, pontos_participacao)
    VALUES (p_id_participacao, p_id_evento, p_data_participacao, p_comentarios_participacao, p_pontos_participacao);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir participação em evento.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir participação em evento: ' || SQLERRM);
END inserir_participacao_evento;


CREATE OR REPLACE PROCEDURE inserir_relatorio_poluicao(
    p_id_relatorio          IN tb_relatorios_poluicao.id_relatorio%TYPE,
    p_id_usuario            IN tb_relatorios_poluicao.id_usuario%TYPE,
    p_data_relatorio        IN tb_relatorios_poluicao.data_relatorio%TYPE,
    p_localizacao_relatorio IN tb_relatorios_poluicao.localizacao_relatorio%TYPE,
    p_tipo_poluente         IN tb_relatorios_poluicao.tipo_poluente%TYPE,
    p_descricao_incidente   IN tb_relatorios_poluicao.descricao_incidente%TYPE
)
IS
    v_count NUMBER;
BEGIN
    -- Verificar se o usuário existe antes de inserir o relatório de poluição
    SELECT COUNT(*)
    INTO   v_count
    FROM   tb_usuario
    WHERE  id_usuario = p_id_usuario;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Usuário não encontrado para associar ao relatório de poluição.');
    END IF;

    INSERT INTO tb_relatorios_poluicao (id_relatorio, id_usuario, data_relatorio, localizacao_relatorio, tipo_poluente, descricao_incidente)
    VALUES (p_id_relatorio, p_id_usuario, p_data_relatorio, p_localizacao_relatorio, p_tipo_poluente, p_descricao_incidente);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20002, 'Chave primária duplicada ao inserir relatório de poluição.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir relatório de poluição: ' || SQLERRM);
END inserir_relatorio_poluicao;

CREATE OR REPLACE PROCEDURE inserir_missao(
    p_id_missao        IN tb_missoes.id_missao%TYPE,
    p_descricao_missao IN tb_missoes.descricao_missao%TYPE,
    p_tipo_missao      IN tb_missoes.tipo_missao%TYPE,
    p_objetivo_missao  IN tb_missoes.objetivo_missao%TYPE,
    p_progresso_missao IN tb_missoes.progresso_missao%TYPE
)
IS
BEGIN
    INSERT INTO tb_missoes (id_missao, descricao_missao, tipo_missao, objetivo_missao, progresso_missao)
    VALUES (p_id_missao, p_descricao_missao, p_tipo_missao, p_objetivo_missao, p_progresso_missao);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20001, 'Chave primária duplicada ao inserir missão.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro ao inserir missão: ' || SQLERRM);
END inserir_missao;
