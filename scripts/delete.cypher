
// Удалить все связи
MATCH ()-[r]->() DELETE r
;


// Отвязать ответы от трансляции
MATCH (b)<-[r]-(p)<-[:ANSWER_TO]-(a)
DELETE r
;

// Отвязать ответы от трансляции 2
MATCH (b)<-[r]-(a:Answer)
DELETE r
;

