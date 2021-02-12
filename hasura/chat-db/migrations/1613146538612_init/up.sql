CREATE TABLE public.messages (
    id integer NOT NULL,
    text text NOT NULL,
    sender integer NOT NULL,
    receiver integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
CREATE TABLE public.users (
    id integer NOT NULL,
    user_name text NOT NULL,
    last_seen timestamp with time zone DEFAULT now() NOT NULL
);
CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);
ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_receiver_fkey FOREIGN KEY (receiver) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_fkey FOREIGN KEY (sender) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
