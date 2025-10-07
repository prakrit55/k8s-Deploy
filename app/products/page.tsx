import { mockProducts, Product } from "@/mocks/products";
import Link from "next/link";

export default function ProductsPage() {
  const products: Product[] = mockProducts; // Directly use mock data

  return (
    <>
      <h2>Products</h2>
      <ul>
        {products.map((product) => (
          <li key={product.id}>
            <Link href={"/products/" + product.id}>{product.name}</Link>
          </li>
        ))}
      </ul>
    </>
  );
}
