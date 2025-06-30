# Sequência de Execução do Projeto Academia

## 1. Subir o container MySQL

```sh
docker compose up mysql -d
```

## 2. Executar os scripts SQL na ordem correta

1. **academia.init.sql**  
   Cria o banco de dados e todas as tabelas necessárias.
2. **academia.triggers.sql**  
   Cria os triggers para controle de agendamento.
3. **academia.functions.sql**  
   Cria funções auxiliares para consultas e validações.
4. **academia.views.sql**  
   Cria as views para facilitar consultas e relatórios.
5. **academia.procedure.sql**
   Cria as procedures
6. **academia.constaints.sql**
   Cria as restrições para o banco
7. **academia.crud.sql**  
   Insere dados de exemplo e demonstra operações CRUD.
8. **academia.commands.sql**
   Executar comandos e verificar funcionalidades de operações e do banco.
