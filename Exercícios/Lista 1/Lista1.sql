--- Lista de exercícios complementares sobre o modelo paciente-consulta

/* 1. Criar uma nova coluna na tabela paciente com o nome pais varchar2(15) */
ALTER TABLE paciente 
ADD pais VARCHAR2(15);

/* 2. Alterar a coluna endereco da tabela paciente para 28 posições */
ALTER TABLE paciente 
MODIFY endereco VARCHAR2(28);

/* 3. Excluir a nova coluna criada no ex 1 */
ALTER TABLE paciente
DROP COLUMN pais;

/* 4. Incluir a restrição NOT NULL na coluna endereco */
ALTER TABLE paciente
MODIFY (endereco NOT NULL);

/* 5. Alterar a data de nascimento do paciente de codigo 001 para '01-09-1960' */
UPDATE paciente
SET data_nascimento = '01-09-1960'
WHERE cod_paciente = 001;

/* 6. Alterar o campo desconto de todos os pacientes para 'N' */
UPDATE paciente 
SET desconto = 'N';

/* 7. Alterar o campo endereco para 'Rua Melo Alves, 40' e cidade para 'Itu' para o paciente de código 002 */
UPDATE paciente
SET endereco = 'Rua Melo Alves, 40', cidade = 'Itu'
WHERE cod_paciente = 002;

/* 8. Excluir a consulta 002, somente se o campo valor_consulta for igual a 0 */
DELETE FROM consulta
WHERE cod_consulta = 002
AND valor_consulta = 0;

/* 9. Excluir o paciente de código 5 */
DELETE FROM paciente
WHERE cod_paciente = 5;

/* 10. Excluir todos os pacientes da cidade de Sorocaba e de sexo feminino */
DELETE FROM paciente
WHERE cidade = 'Sorocaba'
AND sexo = 'F';

/* 11. Alterar o campo desconto para 'S' de todos os pacientes de sexo feminino e idade superior a 60 anos */
UPDATE paciente
SET desconto = 'S'
WHERE sexo = 'F'
AND (EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM data_nascimento)) > 60;

/* 
  12. Criar um novo campo na tabela paciente para registrar o telefone do paciente.
  Este campo deverá ser varchar2(15). Inserir o número dos pacientes neste novo campo
*/
ALTER TABLE paciente 
ADD telefone VARCHAR2(15);

UPDATE paciente 
SET telefone = '12345-6789';
