// Наладить ссылки


// Трансляция 354
match (b:Broadcast{id:354}) return b
;


// Удалить все связи
MATCH ()-[r]->() 
DELETE r
;

// привязать посты к трансляциям
MATCH (b:Broadcast),(p:Post) WHERE  b.id = p.id_broadcast
CREATE (b)<-[r:QUESTION_AT]-(p)
;


// привязать изображения к постам
MATCH (p:Post),(i:Image) WHERE  p.id = i.post_id
CREATE (p)<-[r:picture]-(i)
;

// --------------------------------------------------------------------

// Привязать и пометить ответы 
MATCH (p:Post),(a:Post) WHERE  p.id = a.id_parent
CREATE (p)<-[r:ANSWER_TO]-(a)
SET a:Answer
;

// Отвязать ответы от трансляции
MATCH (b)<-[r:QUESTION_AT]-(p)<-[:ANSWER_TO]-(a)
DELETE r
;

// Отвязать ответы от трансляции 2
MATCH (b)<-[r:QUESTION_AT]-(a:Answer)
DELETE r
;

