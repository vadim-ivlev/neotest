// load broadcast.csv
LOAD CSV WITH HEADERS FROM "file:///broadcast.csv" AS o CREATE (:Broadcast {
    
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
