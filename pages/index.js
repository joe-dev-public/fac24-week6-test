import Head from "next/head";
import Image from "next/image";
// import styles from "../styles/Home.module.css";
import {
  getAllProducts,
  // getCartProducts,
  getAllProductImages,
} from "../lib/database/model";

export async function getServerSideProps() {
  // Don't forget to await
  // const cartData = await getCartProducts("auniquecartid1");
  const allProductData = await getAllProducts();

  // Get all the images (pointless optimisation to try: for the product ID's returned?)
  const allProductImages = await getAllProductImages();

  console.log(allProductImages);

  return {
    props: {
      // cartData,
      allProductData,
      allProductImages,
    },
  };
}

// export default function Home({ cartData }) {
export default function Home({ allProductData, allProductImages }) {
  return (
    <div>
      <Head>
        <title>My Next.js app</title>
      </Head>

      <main>
        {allProductData.map((product) => (
          <div key={product.id}>
            <h2>{product.name}</h2>
            {allProductImages.map((image) => {
              if (image.product_id === product.id) {
                return (
                  <Image
                    src={image.image_src}
                    width="400"
                    height="400"
                    alt={product.name + " image"}
                  />
                );
              }
            })}
            <p>{product.price}</p>
            <p>{product.description}</p>
          </div>
        ))}
        {/* Loop through product images and print if ID's match */}

        {/* <ul>
          {cartData.map((row) => (
            <li key={row.id}>
              {row.name}: {row.price} x {row.quantity} = {row.total_price}{" "}
              (subtotal)
            </li>
          ))}
        </ul> */}
      </main>
    </div>
  );
}
