CREATE TABLE public.users (
  id bigint NOT NULL,
  encrypted_first_name character varying,
  created_at timestamp(6) without time zone NOT NULL,
  updated_at timestamp(6) without time zone NOT NULL,
  full_name character varying DEFAULT ''::character varying NOT NULL,
  name character varying DEFAULT ''::character varying NOT NULL
);