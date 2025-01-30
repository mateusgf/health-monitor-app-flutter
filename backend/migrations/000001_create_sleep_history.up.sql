CREATE TABLE sleep_histories (
    id SERIAL PRIMARY KEY,
    start TIMESTAMP NOT NULL,
    "end" TIMESTAMP NOT NULL,
    duration_minutes INT NOT NULL,
    score INT NOT NULL
);
