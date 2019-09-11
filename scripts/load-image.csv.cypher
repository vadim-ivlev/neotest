// load image.csv
LOAD CSV WITH HEADERS FROM "file:///image.csv" AS o CREATE (:Image {
    id: toInteger(o.id), 
    post_id: toInteger(o.post_id), 
    filepath: o.filepath, 
    thumbs: o.thumbs, 
    source: o.source 
});
