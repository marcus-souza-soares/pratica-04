CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" VARCHAR(50) NOT NULL UNIQUE,
	"email" VARCHAR(50) NOT NULL UNIQUE,
	"password" VARCHAR(50) NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" VARCHAR(100) NOT NULL,
	"price" DECIMAL NOT NULL,
	"picturePrincipal" bytea,
	"pictures" bytea,
	"categoryId" DECIMAL NOT NULL,
	"size" VARCHAR(3) NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" VARCHAR(50) NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"address" TEXT NOT NULL,
	"purchaseDay" DATETIME NOT NULL,
	"orderId" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order" (
	"productId" integer NOT NULL,
	"customerId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("orderId") REFERENCES "order"("id");

ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");






