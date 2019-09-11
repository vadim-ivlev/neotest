COPY  public.broadcast TO '/dumps/broadcast.csv' DELIMITER ',' CSV HEADER;
COPY  public.image TO '/dumps/image.csv' DELIMITER ',' CSV HEADER;
COPY  public.post TO '/dumps/post.csv' DELIMITER ',' CSV HEADER;

