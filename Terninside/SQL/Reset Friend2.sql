DELETE Building
DBCC CHECKIDENT('Trade', RESEED, 0)

-- INSERT INTO Trade VALUES(
--     1,
--     2,
--     100,
--     200,
--     1,
--     0,
--     0,
--     0
-- )

INSERT INTO Trade VALUES(
    8,
    1,
    150,
    250,
    1,
    0,
    0,
    0
)

INSERT INTO Trade VALUES(
    1,
    9,
    10,
    500,
    0,
    1,
    0,
    0
)

INSERT INTO Trade VALUES(
    8,
    9,
    10,
    500,
    1,
    0,
    0,
    0
)

SELECT * FROM Trade
SELECT * FROM Player