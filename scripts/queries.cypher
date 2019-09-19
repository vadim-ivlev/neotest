
// Трансляция 354
match (b:Broadcast{id:354}) return b;


// Трансляция 354 со связанными узлами
match (b:Broadcast {id:354}) return (b)-[*1..2]-();

// Показать некоторые узлы
match (b:Broadcast{id:354})--(p)--(a)
with b, p, count(a) as num
where num >3
return (b)--(p)--(:Answer)

// какие вопросы в различных бродкавастах вызвали наибольшее количество ответов
match (b:Broadcast) -- (q:Question)--(a:Answer)
with b, q, count(*) as num
order by num desc
return b.id, num, collect(q.id) as question_ids
;


// Показ трансляции 354 с подчиненными в виде json


match (b:Broadcast{id:354}) -- (q:Question)--(a:Answer)
with b,q,a order by q.id, a.id
with b,q, collect(a{.*}) as lst, count(a) as num
where num > 4

return 
b {
	.id, 
    .title, 
     questions:collect(q{
     	.id, 
        answers:{num:num, items:lst}
        })
    }
limit 3
;


