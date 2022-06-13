import db from "./connections";

export function getData() {
  const MY_QUERY = `SELECT * FROM test`;
  return db.query(MY_QUERY).then((result) => result.rows);
  // return "hello world";
}
