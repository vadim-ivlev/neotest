// Наладить ссылки


// Трансляция 354
match (b:Broadcast{id:354}) return b
;


// Удалить все связи
MATCH ()-[r]->() 
DELETE r
;

// привязать посты к трансляциям
// MATCH (b:Broadcast),(p:Post) WHERE  b.id = p.id_broadcast
// CREATE (b)<-[r:QUESTION_AT]-(p)
// ;

MATCH (b:Broadcast ),(p:Post) 
WHERE b.id = p.id_broadcast AND p.id_parent IS NULL
CREATE (b)<-[r:QUESTION_AT]-(p)
// RETURN b.id, p.id,  p.id_parent
// ORDER BY p.id
;

// Привязать и пометить ответы 
MATCH (p:Post),(a:Post) WHERE  p.id = a.id_parent
CREATE (p)<-[r:ANSWER_TO]-(a)
SET a:Answer, p:Answered
;

// check
match (b:Broadcast {id:354}) return (b)-[*1..2]-();

// create next relationships
match (a1:Answer),(a2:Answer)
where a1.id = a2.id-1
create (a1)-[:NEXT]->(a2)
;


// show some answers with links
match (b:Broadcast{id:354})--(p)--(a)
with b, p, count(a) as num
where num >3
return (b)--(p)--(:Answer)






// привязать изображения к постам
MATCH (p:Post),(i:Image) WHERE  p.id = i.post_id
CREATE (p)<-[r:picture]-(i)
;

// --------------------------------------------------------------------


// Отвязать ответы от трансляции
MATCH (b)<-[r:QUESTION_AT]-(p)<-[:ANSWER_TO]-(a)
DELETE r
;

// Отвязать ответы от трансляции 2
MATCH (b)<-[r:QUESTION_AT]-(a:Answer)
DELETE r
;

