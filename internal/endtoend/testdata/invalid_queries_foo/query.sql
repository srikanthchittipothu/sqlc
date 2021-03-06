CREATE TABLE foo (id text not null);

-- name: ListFoos
SELECT id FROM foo;

-- name: ListFoos :one :many
SELECT id FROM foo;

-- name: ListFoos :two
SELECT id FROM foo;

-- name: DeleteFoo :one
DELETE FROM foo WHERE id = $1;

-- name: UpdateFoo :one
UPDATE foo SET id = $2 WHERE id = $1;

-- name: InsertFoo :one
INSERT INTO foo (id) VALUES ($1);

-- stderr
-- # package querytest
-- query.sql:4:1: invalid query comment: -- name: ListFoos
-- query.sql:7:1: invalid query comment: -- name: ListFoos :one :many
-- query.sql:10:1: invalid query type: :two
-- query.sql:13:1: query "DeleteFoo" specifies parameter ":one" without containing a RETURNING clause
-- query.sql:16:1: query "UpdateFoo" specifies parameter ":one" without containing a RETURNING clause
-- query.sql:19:1: query "InsertFoo" specifies parameter ":one" without containing a RETURNING clause
