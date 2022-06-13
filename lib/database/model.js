import db from "./connections";

export function getAllProducts() {
  const GET_PRODUCTS = `SELECT * FROM products`;
  return db.query(GET_PRODUCTS).then((result) => result.rows);
}

// OK, interesting. With the Next.js model, is it possible to query these per product_id?
// (Or is it better just to get all of them and use JS to match the images to products?)
export function getProductImages(product_id) {
  const GET_PRODUCT_IMAGES = `SELECT image_src FROM product_images WHERE product_id = $1`;
  return db
    .query(GET_PRODUCT_IMAGES, [product_id])
    .then((result) => result.rows);
}

export function getAllProductImages() {
  const GET_ALL_PRODUCT_IMAGES = `SELECT * FROM product_images`;
  return db.query(GET_ALL_PRODUCT_IMAGES).then((result) => result.rows);
}

export function getProduct(id) {
  const GET_PRODUCT = `SELECT * FROM products WHERE id = $1`;
  return db.query(GET_PRODUCT, [id]).then((result) => result.rows[0]);
}

export function getCart(id) {
  const GET_CARTS = `SELECT * FROM carts WHERE id = $1`;
  return db.query(GET_CARTS).then((result) => result.rows[0]);
}

export function getCartProducts(cart_id) {
  const GET_CART_PRODUCTS = `
    SELECT products.id, products.name, products.price, cart_products.quantity, (products.price * cart_products.quantity) AS total_price
    FROM products
    INNER JOIN cart_products
      ON cart_products.product_id = products.id WHERE cart_products.cart_id = $1`;
  return db.query(GET_CART_PRODUCTS, [cart_id]).then((result) => result.rows);
}
