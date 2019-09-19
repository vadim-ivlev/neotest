
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

//----------------------------------------------------
match (b:Broadcast{id:354}) -- (q:Question)--(a:Answer)
//where q.id = 23952 
with b, q, a 
order by a.id

with b, q, collect(a{.*}) as lst, count(a) as numa
order by q.id

with b, collect(q{.*, answers:lst} ) as questions, count(q) as numq

return 
b {.*, _num_questions:numq, posts:questions }
limit 3
;

// ---------------------------------------------------
match (b:Broadcast{id:354})--(q:Question)--(a:Answer)
with b, q, collect(a{.*}) as lst, count(a) as num

with b, collect(q{.*, answers:lst} ) as questions, count(q) as numq

return 
b {.*, _num_questions:numq, posts:questions }
limit 3
;

// Посты без ответов
match (b:Broadcast{id:354})-[:ASK]-(q:Post)
where not (q)<-[:REPLY]-()
return b,q
// вариант 2
match (b:Broadcast{id:354})-[:ASK]-(q:Post)
where not "Question" in labels(q)
return b,q, labels(q)



///////////////////////////////////////////////////////

match (b:Broadcast{id:354})-[:ASK]-(q:Post)
where not (q)<-[:REPLY]-()
return b,q, null as lst, 0 as num

union

match (b:Broadcast{id:354})--(q:Question)--(a:Answer)
return b, q, collect(a{.*}) as lst, count(a) as num

with b, collect(q{.*, answers:lst} ) as questions, count(q) as numq

return 
b {.*, _num_questions:numq, posts:questions }
limit 3