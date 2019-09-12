// Загрузить onlinebc CSV из интернета



// Удалить все связи
MATCH ()-[r]->() 
DELETE r
;


// Удалить все узлы
match (n) delete n
;



// load broadcast.csv
LOAD CSV WITH HEADERS FROM "https://gitlab.com/vadim-ivlev/neotest/raw/master/import/broadcast.csv" AS o CREATE (:Broadcast {
    
    id            : toInteger(o.id),
    title         : o.title,
    time_created  : toInteger(o.time_created),
    time_begin    : toInteger(o.time_begin),
    is_ended      : toInteger(o.is_ended),
    show_date     : toInteger(o.show_date),
    show_time     : toInteger(o.show_time),
    show_main_page: toInteger(o.show_main_page),
    link_article  : o.link_article,
    link_img      : o.link_img,
    groups_create : o.groups_create,
    is_diary      : toInteger(o.is_diary),
    diary_author  : o.diary_author
  
});


// load post.csv
LOAD CSV WITH HEADERS FROM "https://gitlab.com/vadim-ivlev/neotest/raw/master/import/post.csv" AS o CREATE (:Post {
    id          : toInteger(o.id),
    id_parent   : toInteger(o.id_parent),
    id_broadcast: toInteger(o.id_broadcast),
    text        : o.text,
    post_time   : toInteger(o.post_time),
    post_type   : toInteger(o.post_type),
    link        : o.link,
    has_big_img : toInteger(o.has_big_img),
    author      : o.author
});


// load image.csv
LOAD CSV WITH HEADERS FROM "https://gitlab.com/vadim-ivlev/neotest/raw/master/import/image.csv" AS o CREATE (:Image {
    id      : toInteger(o.id),
    post_id : toInteger(o.post_id),
    filepath: o.filepath,
    thumbs  : o.thumbs,
    source  : o.source
});
