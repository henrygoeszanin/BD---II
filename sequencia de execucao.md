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
5. **acadeia.crud.sql**  
   Insere dados de exemplo e demonstra operações CRUD.
