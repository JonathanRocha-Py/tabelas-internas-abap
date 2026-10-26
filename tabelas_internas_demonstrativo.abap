*&---------------------------------------------------------------------*
*&  Tabelas Internas — Demonstrativo
*&  Jonathan Rocha — Outubro/2026
*&---------------------------------------------------------------------*

REPORT zdemo_tabelas_internas.

* 1. Definir a estrutura dos dados
TYPES: BEGIN OF ts_funcionario,
         matricula TYPE n LENGTH 8,
         nome      TYPE string,
         setor     TYPE string,
       END OF ts_funcionario.

* 2. Criar a tabela interna
DATA: gt_funcionarios TYPE TABLE OF ts_funcionario,
      gs_funcionario  TYPE ts_funcionario.

* 3. Adicionar registros
gs_funcionario-matricula = '00001234'.
gs_funcionario-nome = 'Maria Silva'.
gs_funcionario-setor = 'TI'.
APPEND gs_funcionario TO gt_funcionarios.

gs_funcionario-matricula = '00005678'.
gs_funcionario-nome = 'João Santos'.
gs_funcionario-setor = 'RH'.
APPEND gs_funcionario TO gt_funcionarios.

* 4. Percorrer e exibir
WRITE: / '=== Lista de Funcionários ===', /.

LOOP AT gt_funcionarios INTO gs_funcionario.
  WRITE: / 'Matrícula:', gs_funcionario-matricula,
           '| Nome:', gs_funcionario-nome,
           '| Setor:', gs_funcionario-setor.
ENDLOOP.

WRITE: /, 'Total de registros:', lines( gt_funcionarios ).
