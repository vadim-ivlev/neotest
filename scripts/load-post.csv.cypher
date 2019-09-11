// load post.csv
LOAD CSV WITH HEADERS FROM "file:///post.csv" AS o CREATE (:Post {
id: toInteger(o.id),
id_parent: toInteger(o.id_parent),
id_broadcast: toInteger(o.id_broadcast),
text: o.text,
post_time: toInteger(o.post_time),
post_type: toInteger(o.post_type),
link: o.link,
has_big_img: toInteger(o.has_big_img),
author: o.author

});
