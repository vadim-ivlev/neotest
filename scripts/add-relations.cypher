// Наладить ссылки между существующими узлами


// Привязать посты, которые не являются ответами к трансляциям
MATCH (b:Broadcast ),(p:Post) 
WHERE b.id = p.id_broadcast AND p.id_parent IS NULL
CREATE (b)<-[r:ASK]-(p)
// RETURN b.id, p.id,  p.id_parent
// ORDER BY p.id
;

return "Посты привязаны" as message;

// Связать вопросы с ответами
MATCH (q:Post),(a:Post) WHERE  q.id = a.id_parent
CREATE (q)<-[r:REPLY]-(a)
SET q:Question, a:Answer
;

return "Ответы привязаны" as message;


// Упорядочить ответы
match (a1:Answer),(a2:Answer)
where a1.id = a2.id-1
create (a1)-[:NEXT]->(a2)
;

return "ответы упорядочены" as message;

// привязать изображения к постам
MATCH (p:Post),(i:Image) 
WHERE  p.id = i.post_id
CREATE (p)<-[r:ИЛЛЮСТРИРУЕТ]-(i)
set p:Illustrated
;

return "Изображения привязаны" as message;

