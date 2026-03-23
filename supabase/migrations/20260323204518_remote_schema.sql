drop extension if exists "pg_net";


  create table "public"."enderecos" (
    "id" uuid not null default gen_random_uuid(),
    "usuario_id" uuid,
    "rua" text,
    "numero" text,
    "bairro" text,
    "lat" double precision,
    "lng" double precision
      );



  create table "public"."pedido_itens" (
    "id" uuid not null default gen_random_uuid(),
    "pedido_id" uuid not null,
    "produto_id" uuid not null,
    "quantidade" integer not null,
    "preco" numeric not null
      );



  create table "public"."pedidos" (
    "id" uuid not null default gen_random_uuid(),
    "cliente_id" uuid,
    "endereco_id" uuid,
    "motoboy_id" uuid,
    "status" text default 'Pendente'::text,
    "valor_total" numeric,
    "metodo_pagamento" text,
    "criado_em" timestamp without time zone default now()
      );



  create table "public"."produtos" (
    "id" uuid not null default gen_random_uuid(),
    "nome" text not null,
    "descricao" text,
    "preco" numeric not null,
    "imagem_url" text,
    "ativo" boolean default true
      );



  create table "public"."usuarios" (
    "id" uuid not null default gen_random_uuid(),
    "nome" text,
    "telefone" text,
    "role" text
      );


CREATE UNIQUE INDEX enderecos_pkey ON public.enderecos USING btree (id);

CREATE UNIQUE INDEX pedido_itens_pkey ON public.pedido_itens USING btree (id);

CREATE UNIQUE INDEX pedidos_pkey ON public.pedidos USING btree (id);

CREATE UNIQUE INDEX produtos_pkey ON public.produtos USING btree (id);

CREATE UNIQUE INDEX usuarios_pkey ON public.usuarios USING btree (id);

alter table "public"."enderecos" add constraint "enderecos_pkey" PRIMARY KEY using index "enderecos_pkey";

alter table "public"."pedido_itens" add constraint "pedido_itens_pkey" PRIMARY KEY using index "pedido_itens_pkey";

alter table "public"."pedidos" add constraint "pedidos_pkey" PRIMARY KEY using index "pedidos_pkey";

alter table "public"."produtos" add constraint "produtos_pkey" PRIMARY KEY using index "produtos_pkey";

alter table "public"."usuarios" add constraint "usuarios_pkey" PRIMARY KEY using index "usuarios_pkey";

alter table "public"."enderecos" add constraint "fk_endereco_usuario" FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) not valid;

alter table "public"."enderecos" validate constraint "fk_endereco_usuario";

alter table "public"."pedido_itens" add constraint "fk_item_pedido" FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) not valid;

alter table "public"."pedido_itens" validate constraint "fk_item_pedido";

alter table "public"."pedido_itens" add constraint "fk_item_produto" FOREIGN KEY (produto_id) REFERENCES public.produtos(id) not valid;

alter table "public"."pedido_itens" validate constraint "fk_item_produto";

alter table "public"."pedidos" add constraint "fk_pedido_cliente" FOREIGN KEY (cliente_id) REFERENCES public.usuarios(id) not valid;

alter table "public"."pedidos" validate constraint "fk_pedido_cliente";

alter table "public"."pedidos" add constraint "fk_pedido_endereco" FOREIGN KEY (endereco_id) REFERENCES public.enderecos(id) not valid;

alter table "public"."pedidos" validate constraint "fk_pedido_endereco";

alter table "public"."pedidos" add constraint "fk_pedido_motoboy" FOREIGN KEY (motoboy_id) REFERENCES public.usuarios(id) not valid;

alter table "public"."pedidos" validate constraint "fk_pedido_motoboy";

grant delete on table "public"."enderecos" to "anon";

grant insert on table "public"."enderecos" to "anon";

grant references on table "public"."enderecos" to "anon";

grant select on table "public"."enderecos" to "anon";

grant trigger on table "public"."enderecos" to "anon";

grant truncate on table "public"."enderecos" to "anon";

grant update on table "public"."enderecos" to "anon";

grant delete on table "public"."enderecos" to "authenticated";

grant insert on table "public"."enderecos" to "authenticated";

grant references on table "public"."enderecos" to "authenticated";

grant select on table "public"."enderecos" to "authenticated";

grant trigger on table "public"."enderecos" to "authenticated";

grant truncate on table "public"."enderecos" to "authenticated";

grant update on table "public"."enderecos" to "authenticated";

grant delete on table "public"."enderecos" to "service_role";

grant insert on table "public"."enderecos" to "service_role";

grant references on table "public"."enderecos" to "service_role";

grant select on table "public"."enderecos" to "service_role";

grant trigger on table "public"."enderecos" to "service_role";

grant truncate on table "public"."enderecos" to "service_role";

grant update on table "public"."enderecos" to "service_role";

grant delete on table "public"."pedido_itens" to "anon";

grant insert on table "public"."pedido_itens" to "anon";

grant references on table "public"."pedido_itens" to "anon";

grant select on table "public"."pedido_itens" to "anon";

grant trigger on table "public"."pedido_itens" to "anon";

grant truncate on table "public"."pedido_itens" to "anon";

grant update on table "public"."pedido_itens" to "anon";

grant delete on table "public"."pedido_itens" to "authenticated";

grant insert on table "public"."pedido_itens" to "authenticated";

grant references on table "public"."pedido_itens" to "authenticated";

grant select on table "public"."pedido_itens" to "authenticated";

grant trigger on table "public"."pedido_itens" to "authenticated";

grant truncate on table "public"."pedido_itens" to "authenticated";

grant update on table "public"."pedido_itens" to "authenticated";

grant delete on table "public"."pedido_itens" to "service_role";

grant insert on table "public"."pedido_itens" to "service_role";

grant references on table "public"."pedido_itens" to "service_role";

grant select on table "public"."pedido_itens" to "service_role";

grant trigger on table "public"."pedido_itens" to "service_role";

grant truncate on table "public"."pedido_itens" to "service_role";

grant update on table "public"."pedido_itens" to "service_role";

grant delete on table "public"."pedidos" to "anon";

grant insert on table "public"."pedidos" to "anon";

grant references on table "public"."pedidos" to "anon";

grant select on table "public"."pedidos" to "anon";

grant trigger on table "public"."pedidos" to "anon";

grant truncate on table "public"."pedidos" to "anon";

grant update on table "public"."pedidos" to "anon";

grant delete on table "public"."pedidos" to "authenticated";

grant insert on table "public"."pedidos" to "authenticated";

grant references on table "public"."pedidos" to "authenticated";

grant select on table "public"."pedidos" to "authenticated";

grant trigger on table "public"."pedidos" to "authenticated";

grant truncate on table "public"."pedidos" to "authenticated";

grant update on table "public"."pedidos" to "authenticated";

grant delete on table "public"."pedidos" to "service_role";

grant insert on table "public"."pedidos" to "service_role";

grant references on table "public"."pedidos" to "service_role";

grant select on table "public"."pedidos" to "service_role";

grant trigger on table "public"."pedidos" to "service_role";

grant truncate on table "public"."pedidos" to "service_role";

grant update on table "public"."pedidos" to "service_role";

grant delete on table "public"."produtos" to "anon";

grant insert on table "public"."produtos" to "anon";

grant references on table "public"."produtos" to "anon";

grant select on table "public"."produtos" to "anon";

grant trigger on table "public"."produtos" to "anon";

grant truncate on table "public"."produtos" to "anon";

grant update on table "public"."produtos" to "anon";

grant delete on table "public"."produtos" to "authenticated";

grant insert on table "public"."produtos" to "authenticated";

grant references on table "public"."produtos" to "authenticated";

grant select on table "public"."produtos" to "authenticated";

grant trigger on table "public"."produtos" to "authenticated";

grant truncate on table "public"."produtos" to "authenticated";

grant update on table "public"."produtos" to "authenticated";

grant delete on table "public"."produtos" to "service_role";

grant insert on table "public"."produtos" to "service_role";

grant references on table "public"."produtos" to "service_role";

grant select on table "public"."produtos" to "service_role";

grant trigger on table "public"."produtos" to "service_role";

grant truncate on table "public"."produtos" to "service_role";

grant update on table "public"."produtos" to "service_role";

grant delete on table "public"."usuarios" to "anon";

grant insert on table "public"."usuarios" to "anon";

grant references on table "public"."usuarios" to "anon";

grant select on table "public"."usuarios" to "anon";

grant trigger on table "public"."usuarios" to "anon";

grant truncate on table "public"."usuarios" to "anon";

grant update on table "public"."usuarios" to "anon";

grant delete on table "public"."usuarios" to "authenticated";

grant insert on table "public"."usuarios" to "authenticated";

grant references on table "public"."usuarios" to "authenticated";

grant select on table "public"."usuarios" to "authenticated";

grant trigger on table "public"."usuarios" to "authenticated";

grant truncate on table "public"."usuarios" to "authenticated";

grant update on table "public"."usuarios" to "authenticated";

grant delete on table "public"."usuarios" to "service_role";

grant insert on table "public"."usuarios" to "service_role";

grant references on table "public"."usuarios" to "service_role";

grant select on table "public"."usuarios" to "service_role";

grant trigger on table "public"."usuarios" to "service_role";

grant truncate on table "public"."usuarios" to "service_role";

grant update on table "public"."usuarios" to "service_role";


