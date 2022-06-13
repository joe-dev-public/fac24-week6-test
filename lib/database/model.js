import db from "./connections";

// SELECT products.name, products.price FROM products INNER JOIN cart_products ON cart_products.product_id = products.id WHERE cart_products.cart_id='auniquecartid';

export function getData() {
  const MY_QUERY = `SELECT * FROM test`;
  return db.query(MY_QUERY).then((result) => result.rows);
  // return "hello world";
}
