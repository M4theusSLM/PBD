-- 1
SELECT Nome
FROM empregado
WHERE Depto = (SELECT Numero FROM departamento WHERE Nome = 'Engenharia Civil');

-- 2
SELECT P.Numero AS Numero_Projeto, DP.Numero_Depto, E.Nome AS Nome_Gerente
FROM projeto P
JOIN departamento_projeto DP ON P.Numero = DP.Numero_Projeto
JOIN departamento D ON DP.Numero_Depto = D.Numero
JOIN empregado E ON D.RG_Gerente = E.RG
WHERE P.Localizacao = 'São Paulo';

-- 3
SELECT E.Nome
FROM empregado E
WHERE NOT EXISTS (
    SELECT *
    FROM departamento_projeto DP
    WHERE DP.Numero_Depto = 3
    AND NOT EXISTS (
        SELECT *
        FROM empregado_projeto EP
        WHERE EP.RG_Empregado = E.RG
        AND EP.Numero_Projeto = DP.Numero_Projeto
    )
);

-- 4
SELECT DISTINCT DP.Numero_Projeto
FROM departamento_projeto DP
JOIN empregado E ON DP.Numero_Depto = E.Depto
WHERE E.Nome = 'Fernando'
UNION
SELECT EP.Numero_Projeto
FROM empregado_projeto EP
JOIN empregado E ON EP.RG_Empregado = E.RG
WHERE E.Nome = 'Fernando';

-- 5
SELECT Nome
FROM empregado
WHERE RG NOT IN (SELECT RG_Responsavel FROM dependentes);

-- 6
SELECT E.Nome
FROM empregado E
JOIN departamento D ON E.RG = D.RG_Gerente
WHERE E.RG IN (SELECT RG_Responsavel FROM dependentes);

-- 7
SELECT DISTINCT DP.Numero_Depto
FROM departamento_projeto DP
JOIN projeto P ON DP.Numero_Projeto = P.Numero
WHERE P.Localizacao = 'Rio Claro';

-- 8
SELECT DISTINCT E.Nome, E.RG
FROM empregado E
WHERE E.RG IN (SELECT DISTINCT RG_Supervisor FROM empregado WHERE RG_Supervisor IS NOT NULL);

--9 
SELECT *
FROM empregado
WHERE Salario >= 2000.00;

-- 10
SELECT *
FROM empregado
WHERE Nome LIKE 'J%';

-- 11
SELECT *
FROM empregado
WHERE Nome LIKE '%Luiz%' OR Nome LIKE '%Luis%';

-- 12
SELECT E.*
FROM empregado E
WHERE E.Depto = (SELECT Numero FROM departamento WHERE Nome = 'Engenharia Civil');

-- 13
SELECT D.Nome
FROM departamento D
JOIN departamento_projeto DP ON D.Numero = DP.Numero_Depto
JOIN projeto P ON DP.Numero_Projeto = P.Numero
WHERE P.Nome = 'Motor 3';
```sql

-- 14
SELECT E.Nome
FROM empregado E
JOIN empregado_projeto EP ON E.RG = EP.RG_Empregado
JOIN projeto P ON EP.Numero_Projeto = P.Numero
WHERE P.Nome = 'Financeiro 1';

-- 15
SELECT E.*
FROM empregado E
JOIN empregado S ON E.RG_Supervisor = S.RG
WHERE S.Salario BETWEEN 2000 AND 2500;

-- 16
SELECT E.Nome
FROM empregado E
JOIN departamento D ON E.RG = D.RG_Gerente
WHERE E.RG IN (SELECT RG_Responsavel FROM dependentes);

-- 17
UPDATE empregado
SET Salario = 3000.00
WHERE Depto = 2;

-- 18
UPDATE empregado
SET Salario = Salario * 1.10;

-- 19
SELECT AVG(Salario) AS Media_Salarial
FROM empregado;

-- 20
SELECT Nome
FROM empregado
WHERE Salario > (SELECT AVG(Salario) FROM empregado)
ORDER BY Nome;