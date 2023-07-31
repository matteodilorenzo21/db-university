-- QUERY CON SELECT --


-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * FROM `students` WHERE `date_of_birth` LIKE '1990-%';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * FROM `courses` WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * FROM `students` WHERE YEAR(DATEDIFF(NOW(), `date_of_birth`)) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * FROM `courses` WHERE `period` LIKE 'I s%' AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * FROM `exams` WHERE `date` = '2020-06-20' AND `hour` > '14:00:00';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * FROM `degrees` WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT * FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) FROM `teachers` WHERE `phone` IS NULL;


-- QUERY CON GROUP BY --


-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*),YEAR(`enrolment_date`) AS `year_of_enrolment` FROM `students` GROUP BY `year_of_enrolment`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*),`office_address` FROM `teachers` GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, ROUND(AVG(`vote`)) FROM `exam_student` GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`, COUNT(*) FROM `degrees` GROUP BY `department_id`;


-- QUERY CON JOIN --


-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT S.* FROM `degrees` AS D JOIN `students` AS S ON D.`id` = S.`degree_id` WHERE D.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT DPT.`name`, DGR.`name`, DGR.`level`, DGR.`address`, DGR.`email`, DGR.`website` FROM `departments` AS DPT JOIN `degrees` AS DGR ON DPT.`id` = DGR.`department_id` WHERE DPT.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT T.`id`, T.`name` AS 'nome', T.`surname` AS 'cognome', C.`name` AS 'Nome corso' FROM `course_teacher` AS CT JOIN `teachers` AS T ON CT.`teacher_id` = T.`id` JOIN `courses` AS C ON CT.`course_id` = C.`id` WHERE T.`name` = 'Fulvio' AND T.`surname` = 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT ST.`name` AS 'Nome', ST.`surname` AS 'Cognome', DG.*, DP.`name` FROM `students` AS ST JOIN `degrees` AS DG ON ST.`degree_id` = DG.`id` JOIN `departments` AS DP ON DP.`id` = DG.`department_id` ORDER BY ST.`surname`, ST.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti



-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)



-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami


