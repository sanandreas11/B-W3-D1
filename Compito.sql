SELECT * FROM clienti
WHERE nome = 'Mario';

SELECT nome, cognome FROM clienti
WHERE anno_di_nascita = 1982;

SELECT COUNT(*) AS numero_fatture_iva_20 FROM fatture
WHERE iva = 20;

SELECT * FROM prodotti
WHERE EXTRACT(YEAR FROM data_attivazione) = 2017
  AND (in_produzione = TRUE OR in_commercio = TRUE);

  SELECT *
FROM fatture f,clienti c
WHERE f.id_cliente=c.numero_cliente and f.importo<1000;

SELECT numero_fattura,importo,iva,data_fattura,denominazione
FROM fatture fa,fornitori fo
WHERE fa.numero_fornitore=fo.numero_fornitore

SELECT EXTRACT(YEAR FROM data_fattura) AS anno, COUNT(*) AS numero_fatture
FROM fatture
WHERE iva = 20
GROUP BY EXTRACT(YEAR FROM data_fattura);

SELECT EXTRACT(YEAR FROM data_fattura) AS anno,
       COUNT(*) AS numero_fatture,
       SUM(importo) AS totale_importi
FROM fatture
GROUP BY EXTRACT(YEAR FROM data_fattura);

SELECT EXTRACT(YEAR FROM data_fattura) AS anno
FROM fatture
WHERE tipologia = 'A'
GROUP BY EXTRACT(YEAR FROM data_fattura)
HAVING COUNT(*) > 2;

SELECT SUM(f.importo) AS totale_fatture,regione_residenza
FROM fatture f,clienti c
WHERE f.id_cliente=c.numero_cliente
GROUP BY c.regione_residenza

SELECT COUNT(DISTINCT c.numero_cliente) AS numero_clienti
FROM clienti c
JOIN fatture f ON c.numero_cliente = f.id_cliente
WHERE c.anno_nascita = 1980 AND f.importo > 50;