DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_like;

-- -------------- users -------------- 
CREATE TABLE users
(
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR (255) NOT NULL
);
-- \! ECHO "Created Users Table"
INSERT INTO
    users(fname,lname)
VALUES
    ('Scotty','Bob'),
    ('Jimmy', 'Bob'),
    ('Johnny', 'Bob'),
    ('Janey', 'Bob'),
    ('Jerry', 'Bob'),
    ('Jojo', 'Bob'),
    ('Jorge', 'Bob');

-- -------------- questions -------------- 
CREATE TABLE questions
(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body VARCHAR (255) NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    questions
    (title,body,user_id)
VALUES
    ('Why do we need SQL','I don''t understand anything',(SELECT id FROM users WHERE fname='Jerry' and lname='Bob')),
    ('How do I turn on my computer', 'The box''s light is off', (SELECT id
        FROM users
        WHERE fname='Janey' and lname='Bob')),
    ('Question 3: Title', 'Question 3: body description thats really long', (SELECT id
        FROM users
        WHERE fname='Jimmy' and lname='Bob'));

-- \! ECHO "Created Questions Table"
-- -- -------------- question_follows -------------- 
CREATE TABLE question_follows
(
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);
INSERT INTO 
    question_follows
    (user_id, question_id)
VALUES
    (5,1),
    (4,2),
    (2,3);
-- \! ECHO "Created Question Follows Table"
-- -- -------------- replies -------------- 
CREATE TABLE replies
(
    id INTEGER PRIMARY KEY NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body VARCHAR(255) NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
    replies
    (question_id, parent_id, user_id, body)
VALUES
    (1,null,5,'its the answer to everything'),
    (2,null,4,'press the button'),
    (3,null,2, 'question 3 reply!!'),
    (1,1,5,'no but it helps alot'),
    (1,2,5,'should be press the button reply'),
    (1,4,5,'should be no but it helps alot''s reply'),
    (1,5,5,'should be reply of a reply of a reply');
-- \! ECHO "Created Replies Table"
-- -- -------------- question_like -------------- 
CREATE TABLE question_like
(
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);
-- statement to find which questions a user has asked
-- SELECT 
--     *
-- FROM
--     questions
-- JOIN question_follows ON questions.id = question_follows.question_id 
-- JOIN users ON users.id = question_follows.user_id 
-- WHERE
--     question_follows.user_id = (SELECT id
-- FROM users
-- WHERE fname='Jimmy' and lname='Bob'
-- );

-- statement to find the replies on a question, and who wrote that reply
-- SELECT
--     questions.title,
--     users.fname,
--     replies.body
-- FROM
--     replies
-- JOIN questions ON questions.id = replies.question_id 
-- JOIN users ON users.id = replies.user_id 
-- WHERE
--     question_id IN (SELECT id FROM questions WHERE body LIKE "%");

SELECT 
    *
FROM
    replies;


-- statement to find replies on a reply and which question it is replying to

-- show me every question and their reply histories

SELECT
    questions.title,
    parent_replies.body as parent_reply,
    replies.id,
    replies.body,
    replies.parent_id
FROM
    replies
LEFT OUTER JOIN replies as parent_replies ON parent_replies.id = replies.parent_id
JOIN questions ON questions.id = replies.question_id 
JOIN users ON users.id = replies.user_id 
    

WHERE
    replies.id IN (SELECT id FROM replies WHERE replies.parent_id IS NOT NULL);
    -- show me column (select)
    -- but only if replies.id exists in the subarray:
        -- replies that have parents


    -- replies.user_id as user_reply,
    -- question.user_id as questions_user,